<?php
$con=mysqli_connect("localhost","root","","childtracking");
$imei=$_POST['imei'];
$number=$_POST['number'];
$body=$_POST['body'];
$sql="INSERT into sms_data(imei,number,body) values('$imei','$number','$body')";
mysqli_query($con,$sql);
mysqli_close($con);
?>