<?php
$con=mysqli_connect("localhost","root","","childtracking");
$lat=$_POST['latitude'];
$lon=$_POST['longitude'];
$imei=$_POST['imei'];
$area=$_POST['area'];
$check="SELECT * from location_tracking where imei='$imei'";
$result=mysqli_query($con,$check);
if (mysqli_num_rows($result)>0)
    {
    $string1="UPDATE location_tracking SET latitude = '$lat', longitude = '$lon',area = '$area' WHERE imei = '$imei'";
    $result1=mysqli_query($con,$string1)or die(mysqli_error());
    }
    else
    {
        $string2="INSERT into location_tracking(imei,latitude,longitude,area) values('$imei','$lat','$lon','$area')";
    $result2=mysqli_query($con,$string2)or die(mysqli_error());
    }
?>