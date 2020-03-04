<?php
$con=mysqli_connect("localhost","root","","childtracking");
$imei=$_POST['imei'];
$response=array();
$sql="SELECT * from sound_profile where imei='$imei'";
$result=mysqli_query($con,$sql);
if (mysqli_num_rows($result)>0)
    {	$row=mysqli_fetch_assoc($result);
		echo $row['profile'];
	}
	else
	{
			echo "fail";
			
	}

	mysqli_close($con);
?>