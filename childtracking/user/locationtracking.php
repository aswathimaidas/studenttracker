<!DOCTYPE html>
<html lang="en">
<head>
	<title>Table V04</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body><?php include'../common/menu.php';
include 'connectionI.php'; ?>
<center>  <h2 style="padding-top:-1px; font-family:Georgia, 'Times New Roman', Times, serif">LOCATION</h2></center>
<center><br><br>
<form action="" method="post">
<label>Child </label>
<select name="imei" >
<option value="">--Select--</option>
<?php
session_start();
$id=$_SESSION['id'];
$result1=mysqli_query($con,"select * from child_registration where parentid='$id'");

 while($row1=mysqli_fetch_array($result1))
{
?>

<option value="<?php echo $row1['imei'];?>"><?php echo $row1['name'];?></option>
<?php
}
?>
</select>
<input type="submit" name="submit">
</form><br>




								<?php 
								
		if(isset($_POST['submit']))
		{
			$i=$_POST['imei'];
			
		$q="select * from location_tracking where imei='$i'";
		
		$res=mysqli_query($con,$q);
		
			while($ra=mysqli_fetch_array($res)) 
			{
			?>
            <table class="w3-table-all" style="width:800px">
<tr class="" style="color:#F00">
									<th>IMEI</th>
									<th>LATITUDE</th>
									<th>LONGITUDE</th>
                                    <th>AREA</th>
								</tr>
							<tr>
			<td><?php echo $ra['imei']?></td>
			<td><?php echo $ra['latitude']?></td>
            <td><?php echo $ra['longitude']?></td>
             <td><?php echo "<a href='https://maps.google.com/maps?q=$ra[latitude],$ra[longitude]' target=''>View Location</a>";?></td>
             
                                            
</tr><?php  }
		}
		
			?>				

						</table>
					</div>
				</div>
</body>
</html>				
