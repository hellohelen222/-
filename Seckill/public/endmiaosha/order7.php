<?php
/*
require_once __DIR__ . '/vendor/autoload.php';

use PhpAmqpLib\Connection\AMQPStreamConnection;

use PhpAmqpLib\Message\AMQPMessage;
*/




class Jwt {

    //头部
    private static $header=array(
        'alg'=>'HS256', //生成signature的算法
        'typ'=>'JWT'    //类型
    );

    //使用HMAC生成信息摘要时所使用的密钥
    private static $key='123456';

    public static function getToken($payload)
    {
        if(is_array($payload))
        {
            $base64header=self::base64UrlEncode(json_encode(self::$header,JSON_UNESCAPED_UNICODE));
            $base64payload=self::base64UrlEncode(json_encode($payload,JSON_UNESCAPED_UNICODE));
            $token=$base64header.'.'.$base64payload.'.'.self::signature($base64header.'.'.$base64payload,self::$key,self::$header['alg']);
            return $token;
        }else{
            return false;
        }
    }


    /**
     * 验证token是否有效,默认验证exp,nbf,iat时间
     * @param string $Token 需要验证的token
     * @return bool|string
     */
    public static function verifyToken($Token)
    {
        $tokens = explode('.', $Token);
        if (count($tokens) != 3)
            return false;

        list($base64header, $base64payload, $sign) = $tokens;

        //获取jwt算法
        $base64decodeheader = json_decode(self::base64UrlDecode($base64header), JSON_OBJECT_AS_ARRAY);
        if (empty($base64decodeheader['alg']))
            return false;

        //签名验证
        if (self::signature($base64header . '.' . $base64payload, self::$key, $base64decodeheader['alg']) !== $sign)
            return false;

        $payload = json_decode(self::base64UrlDecode($base64payload), JSON_OBJECT_AS_ARRAY);

        //签发时间大于当前服务器时间验证失败
        if (isset($payload['iat']) && $payload['iat'] > time())
            return false;

        //过期时间小宇当前服务器时间验证失败
        if (isset($payload['exp']) && $payload['exp'] < time())
            return false;

        //该nbf时间之前不接收处理该Token
        if (isset($payload['nbf']) && $payload['nbf'] > time())
            return false;

        return $payload;
    }




    /**
     * base64UrlEncode   https://jwt.io/  中base64UrlEncode编码实现
     * @param string $input 需要编码的字符串
     * @return string
     */
    private static function base64UrlEncode($input)
    {
        return str_replace('=', '', strtr(base64_encode($input), '+/', '-_'));
    }

    /**
     * base64UrlEncode  https://jwt.io/  中base64UrlEncode解码实现
     * @param string $input 需要解码的字符串
     * @return bool|string
     */
    private static function base64UrlDecode($input)
    {
        $remainder = strlen($input) % 4;
        if ($remainder) {
            $addlen = 4 - $remainder;
            $input .= str_repeat('=', $addlen);
        }
        return base64_decode(strtr($input, '-_', '+/'));
    }

    /**
     * HMACSHA256签名   https://jwt.io/  中HMACSHA256签名实现
     * @param string $input 为base64UrlEncode(header).".".base64UrlEncode(payload)
     * @param string $key
     * @param string $alg   算法方式
     * @return mixed
     */
    private static function signature($input, $key, $alg = 'HS256')
    {
        $alg_config=array(
            'HS256'=>'sha256'
        );
        return self::base64UrlEncode(hash_hmac($alg_config[$alg], $input, $key,true));
    }
}

class Order
{
    private static $redis = null;
    private static $pdo = null;

    public static function Redis()
    {
        if (self::$redis == null) {
            $redis = new Redis();
            $redis->connect('127.0.0.1',6379);
            self::$redis = $redis;
            
        }
        return self::$redis;
    }

    public static function mysql()
    {
        $dbhost = '127.0.0.1'; //数据库服务器
        $dbport = 3306; //端口
        $dbname = 'sql81_70_222_94'; //数据库名称
        $dbuser = 'sql81_70_222_94'; //用户名
        $dbpass = 'prS5scEHds'; //密码
        
        // 连接
        try {
            $db = new PDO('mysql:host='.$dbhost.';port='.$dbport.';dbname='.$dbname, $dbuser, $dbpass);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //设置错误模式
            $db->query('SET NAMES utf8;');
            self::$pdo = $db;
        } catch (PDOException $e) {
            $this->log(0, '连接数据库失败！');
            exit;
        }
        return self::$pdo;
    }
    public function timediff($begin_time,$end_time)
    {
        if($begin_time < $end_time){
            $starttime = $begin_time;
            $endtime = $end_time;
        }else{
            $starttime = $end_time;
            $endtime = $begin_time;
        }
        //计算天数
        $timediff = $endtime-$starttime;
        $days = intval($timediff/86400);
        //计算小时数
        $remain = $timediff%86400;
        $hours = intval($remain/3600);
        //计算分钟数
        $remain = $remain%3600;
        $mins = intval($remain/60);
        //计算秒数
        $secs = $remain%60;
        $res = array("day" => $days,"hour" => $hours,"min" => $mins,"sec" => $secs);
        return $res;
    }
    
    public function goodsOrder($goodsname,$goodscount,$username)
    {
        $redis = self::Redis();
        
        $con=mysqli_connect("127.0.0.1","sql81_70_222_94","prS5scEHds");
    
        if (!$con) { 
              die('数据库连接失败'.$mysql_error()); 
            }
       
        
        mysqli_select_db($con, "sql81_70_222_94");
        //被一个点高了半天，调试恪太难了
        $result=mysqli_query($con, "select product_id,total,start_time,end_time from ms_activity where product_name='$goodsname';");
        if (!$result) {
            printf("Error: %s\n", mysqli_error($con));
            exit();
        }
        
        while ($row=mysqli_fetch_array($result)) { 
          $total=$row["total"];
          $starttime=$row["start_time"];
          $endtime=$row["end_time"];
        } 
        //echo $starttime;
       // echo $endtime;
        
        //$row=mysqli_fetch_array($result);
        //echo $total;
        //echo 11111;
        

        $currenttime=time();
        //echo $currenttime;
        //echo $starttime;
        //echo $endtime;
        if($currenttime<$starttime){
            $timecount = $this->timediff($currenttime,$starttime);
             echo("离活动开始还有:");
             echo '<br>------------------------------------------<br>'; 
            reset($timecount); 
            foreach ($timecount as $key=>$value) 
            { 
            echo $key.'=>'.$value.', '; 
            }
             return false;
            
        }
        if( $currenttime>$endtime){
            echo("活动已经结束！！！");
            return false;
            
        }
        
        if($currenttime>$starttime && $currenttime<$endtime){
            $redis = self::Redis();
            for($i=1; $i <= $goodscount; $i++){
                $count = $redis->rpop('num');//每次从num取出1
                echo  $count ;
            }  
            if($count == $row["total"]){
                $this->log(0, 'no num redis');
                //echo $count;
                //echo $row['total'];
                echo '已没有库存';
            } else {
                //$orderNo = $this->orderNo();
                $number = $total - $goodscount;
                if ($number < 0) {
                    $this->log(0, '已没有库存');
                    
                    return false;
                }
                echo "下单成功";
                return true;
                
        }
            /*
            $db = self::mysql();
            $result1=mysqli_query($con, "select id from ms_user where username='$username';");
            if (!$result1) {
                printf("Error: %s\n", mysqli_error($con));
                exit();
            }
            
            while ($row1=mysqli_fetch_array($result1)) { 
              $userid=$row1["id"];
            }
            echo $userid;
            try {
                $db->beginTransaction(); //启动事务
                $endprice=$price * 100;
                $created_at=date('Y-m-d H:i:s');
                
                $sql = "INSERT INTO `ms_order` (user_id,order_sn,status,goods_id,o_num,price,created_at) VALUES ('$userid','$orderNo','1','$goods_id', '$goodscount','$endprice','$created_at';)";
                if ($db->exec($sql) === TRUE) {
                    echo "新记录插入成功";
                } else {
                    echo "Error: " . $sql . "<br>" . $conn->error;
                }
                
                $sql2 = "update ms_product set total=total-$goodscount where total>0 and id=$goods_id;";
                $res = $db->exec($sql2);
                
                $db->commit(); //提交事务
                $this->log(1, '下单和库存扣减成功');
                echo "下单成功";
            } catch (Exception $e) {
                $db->rollBack(); //回滚事务
                $this->log(0, '下单失败');
            }
            */
            
        }
    }
    
    public function orderNo()
    {
        return date('Ymd').substr(implode(NULL, array_map('ord', str_split(substr(uniqid(), 7, 13), 1))), 0, 8);
    }

    // 保存日志
    public function log($status, $msg)
    {
        $db = self::mysql();
        $sql = "INSERT INTO `ms_order_log` (status,msg,created_at) VALUES (:status,:msg,:created_at)";
        $stmt = $db->prepare($sql);
        $stmt->execute([
            ':msg' => $msg,
            ':status' => $status,
            ':created_at' => date('Y-m-d H:i:s')
        ]);
    }
}


header('Content-type:text/html;charset=utf-8');
$goodsname = $_POST['goodsname'];
$goodscount = $_POST['goodscount'];
$token=$_POST['token'];
$jwt=new Jwt;
//echo $token;
$getPayload=$jwt->verifyToken($token);
//echo "<br><br>";
//var_dump($getPayload);
$username=$getPayload['username'];
$password=$getPayload['password'];

$order=new Order;
$goodsorder=$order->goodsOrder($goodsname,$goodscount,$username);
echo $goodsorder;

if($goodsorder){
    $con=mysqli_connect("127.0.0.1","sql81_70_222_94","prS5scEHds");
        
    if (!$con) { 
          die('数据库连接失败'.$mysql_error()); 
        }
    
    
    mysqli_select_db($con, "sql81_70_222_94");
    $result1=mysqli_query($con, "select id from ms_user where username='$username';");
    if (!$result1) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }
    while ($row1=mysqli_fetch_array($result1)) { 
      $userid=$row1["id"];
    }
    
    $result2=mysqli_query($con, "select product_id from ms_activity where product_name='$goodsname';");
    if (!$result2) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }
    while ($row=mysqli_fetch_array($result2)) { 
      $goods_id=$row["product_id"];
    }


 
        $host = '127.0.0.1';
        $port = '5052';
        $conn = fsockopen($host, $port, $errno, $errstr, 3);
        if (!$conn) {
            var_dump('连接失败');
            var_dump(http_response_code(201));
            exit;
        }

        $method = 'RpcService.Order';
        //$params = ['ntype'=>4,'data'=>$username,'data2'=>$goods_id];
        $params=array('dtype'=>4,'user_id'=>intval($userid),'goods_id'=>intval($goods_id),'count'=>intval($goodscount));
        echo($params["dtype"]);
        echo "<br><br>";
        
        echo($params["user_id"]);
         echo "<br><br>";
         echo($params["goods_id"]);
          echo "<br><br>";
          echo($params["count"]);
           echo "<br><br>";
        echo("hahahhaahh");
       // $m=[$params].;
        
        $err = fwrite($conn, json_encode(array(
                'method' => $method,
                'params' =>array($params),
                'id'     => 0,
            ))."\n");
        if ($err === false){
            var_dump('写入数据失败');
             var_dump(http_response_code(201));
            exit;
        }

        stream_set_timeout($conn, 0, 30000);
        $line = fgets($conn);
        if ($line === false) {
            var_dump('获取响应数据失败');
             var_dump(http_response_code(201));
            exit;
        }
        var_dump(json_decode($line,true));
        exit;
    
}









?>
