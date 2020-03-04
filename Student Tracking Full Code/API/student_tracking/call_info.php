<?php
$con=mysqli_connect("localhost","root","","childtracking");
$imei=$_POST['imei'];
$number=$_POST['number'];
$type=$_POST['type'];
$time=$_POST['time'];
$sql="INSERT into call_data(imei,calltype,number,date) values('$imei','$type','$number','$time')";
mysqli_query($con,$sql);
mysqli_close($con);
?>