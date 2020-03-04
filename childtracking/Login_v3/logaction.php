<?php 
include '../connectionI.php';
$username=$_POST['username'];
$password=$_POST['password'];
$q="select * from registration where username='$username' && password='$password'";
$run=mysqli_query($con,$q);
if($run)
{
	header("location:../dashboard/dashboard.php?a=error");
}
else
{
	echo $username;
	echo $password;
}




?>