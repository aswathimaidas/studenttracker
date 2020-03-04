<?php 
include 'connectionI.php';
$name=$_POST['name'];
$username=$_POST['username'];
$password=$_POST['password'];
$imei=$_POST['imei'];
$q="insert into child_registration (name,username,password,imei) values 				
				('$name','$username','$password','$imei')";
$run=mysqli_query($con,$q);
if($run)
{
	$qp="INSERT INTO `sound_profile`(`imei`, `profile`) VALUES ('$imei','1')";
	mysqli_query($con,$qp);
	header("location:../dashboard/dashboard.php?a=error");
}
else
{
	echo 'error'	;
}
?>