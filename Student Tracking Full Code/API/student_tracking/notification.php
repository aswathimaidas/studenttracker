<?php
$con=mysqli_connect("localhost","root","","childtracking");
$imei=$_POST['imei'];
$response=array();
$sql="SELECT * from notification where imei='$imei'";
$result=mysqli_query($con,$sql);
if (mysqli_num_rows($result)>0)
    {
			$response['success']=true;
			while($row=mysqli_fetch_assoc($result))
			{
			$response['data'][]=$row;
			}
	}
	else
	{
			$response['success']=false;
			
	}
	echo json_encode($response);
	mysqli_close($con);
?>