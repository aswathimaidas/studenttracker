<?php
include 'connectionI.php';
$name=$_POST['name'];
$address=$_POST['address'];
$phone=$_POST['phone'];
$email=$_POST['email'];
$username=$_POST['username'];
$password=$_POST['password'];
$q="insert into registration (name,address,phone,email,username,password) values 				
				('$name','$address','$phone','$email','$username','$password')";
$run=mysqli_query($con,$q);
if($run)
{
	header("location:registration.php?a=error");
}
else
{
	echo 'error'	;
}





?>