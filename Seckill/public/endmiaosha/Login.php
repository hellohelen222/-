<?php
/* 设置响应数据的内容格式，和字符集*/
header('Content-type:text/html;charset=utf-8');
 

/**
 * PHP实现jwt
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


/* 传递接送json对象给axious
    function apiSuccess($msg="操作成功",$code=200,$token=[])
    {
      header('Content-Type:application/json');//加上这行,前端那边就不需要var result = $.parseJSON(data);
      $ret = ["code" => $code,"msg" => $msg, "data" => $data];
      return json_encode($ret,JSON_UNESCAPED_UNICODE);
    }
    */
    /*
     $params=json_decode(urldecode($_POST['ajax']),true);
    $username= $params['username'];
    $password=$params['password'];
echo json_encode($username);
*/
   ///我去，php接收vue的参数代码为什么也这么难找
   /*
    $params=json_decode(file_get_contents("php://input"),true);
    $username=$params['username'];
    $password=$params['password'];
    */
    //echo json_encode($username);
  
//echo json_encode($username);
    $jwt=new Jwt;
    $mytoken=$_GET['token'];
    echo $mytoken;
//json_encode($token);
//$mytoken=null;

    if($mytoken){
         $getPayload=$jwt->verifyToken($mytoken);
         $username=$getPayload['username'];
         $password=$getPayload['password'];
         //echo "<br><br>";
         //echo($username);
    }
    else{
        /*使用表单的post请求php页面中可以通过$_POST来获取*/
        //$username = $_POST['username'];
        //$password = $_POST['password'];
        $params=json_decode(file_get_contents("php://input"),true);
        $username=$params['username'];
        $password=$params['password'];
    }
    if($username==null || $password==null){
        var_dump(http_response_code(201));
        return ;
        
    }
    
    //$con=mysqli_connect("localhost","sql81_70_222_94","prS5scEHds");
    $con=mysqli_connect("127.0.0.1","sql81_70_222_94","prS5scEHds");
    
    if (!$con) { 
          die('数据库连接失败'.$mysql_error()); 
        }
    $dbpass=null;
    
    mysqli_select_db($con, "sql81_70_222_94");
    $result=mysqli_query($con, "select password from stumanage where username = '$username' ;");
    if (!$result) {
        printf("Error: %s\n", mysqli_error($con));
        exit();
    }
    $row=mysqli_fetch_array($result);
    $dbpass=$row["password"];
    
    
    
    if($dbpass==$password){
        //echo 1;
     
        #设置当前状态码（我去，找了好久axios与php怎么通信）
        //var_dump(http_response_code(200));
         //测试和官网是否匹配begin
        $payload=array('username'=>$username,'password'=>$password,'iat'=>1516239022);
        
        $token=$jwt->getToken($payload);
        //setcookie('token',$token);
        //echo "<pre>";
        echo $token;
        
        //header('Content-Type:application/json');//加上这行,前端那边就不需要var result = $.parseJSON(data);
       // $ret = ["status" => http_response_code(200),"token" =>$token];
        //echo json_encode($ret,JSON_UNESCAPED_UNICODE);
        
        //对token进行验证签名
        //$getPayload=$jwt->verifyToken($token);
        //echo "<br><br>";
        //var_dump($getPayload);
        //echo "<br><br>";
        //测试和官网是否匹配end
        //echo json_encode($token);
        //apiSuccess($token);
        
        
        
        
        
    }else{
        var_dump(http_response_code(201));
    }
    



   
    
    /*
    //自己使用测试begin
    $payload_test=array('iss'=>'admin','iat'=>time(),'exp'=>time()+7200,'nbf'=>time(),'sub'=>'www.admin.com','jti'=>md5(uniqid('JWT').time()));;
    $token_test=Jwt::getToken($payload_test);
    echo "<pre>";
    echo $token_test;
    
    //对token进行验证签名
    $getPayload_test=Jwt::verifyToken($token_test);
    echo "<br><br>";
    var_dump($getPayload_test);
    echo "<br><br>";
    //自己使用时候end
    */



 
?>