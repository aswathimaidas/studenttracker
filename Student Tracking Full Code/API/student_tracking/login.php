<?php
$con=mysqli_connect("localhost","root","","childtracking");
$username=$_POST['username'];
$password=$_POST['password'];
$imei=$_POST['imei'];
$response=array();
$sql="SELECT * from child_registration where imei='$imei' and username='$username' and password='$password'";
$result=mysqli_query($con,$sql);
if (mysqli_num_rows($result)>0)
    {
			$response['success']=true;
			$row=mysqli_fetch_assoc($result);
			$response['data']=$row;
	}
	else
	{
			$response['success']=false;
			
	}
	echo json_encode($response);
	mysqli_close($con);
?>