<?php
header("Access-Control-Allow-Origin:*");
header("Content-type:text/json;charset=utf-8");
error_reporting(0);
//require_once ("database.php");

$con=mysqli_connect("localhost","sql81_70_222_94","prS5scEHds");
    if (!$con) { 
          die('数据库连接失败'.$mysql_error()); 
        }
   
    
    mysqli_select_db($con, "sql81_70_222_94");
    $re=mysqli_query($con, "select id,activity_name,price,start_time,end_time from ms_activity;");

$arr=[];
while ($row = $re -> fetch_assoc()) {
    if($row["isContent"]=="0"){
        $row["isContent"]=false;
    }else{
        $row["isContent"]=true;
    }
    array_push($arr,$row);
}
echo json_encode($arr);
?>