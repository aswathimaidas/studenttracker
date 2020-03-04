<!DOCTYPE html>
<html lang="en">
<head>
	<title>Table V04</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body><?php include'../common/menu.php';?>
<center>  <h2 style="padding-top:-1px; font-family:Georgia, 'Times New Roman', Times, serif">DETAILS</h2></center>
<center><br><br>
<table class="w3-table-all" style="width:500px">
<tr class="" style="color:#F00">
									<th >NAME</th>
									<th >USER NAME</th>
									<th >PASSWORD</th>
									<th >IMEI</th>
								</tr>
							
								<?php 
		include 'connectionI.php';
		$q="select * from child_registration";
		$run=mysqli_query($con,$q);
		if(mysqli_num_rows($run)>0)
			{
			while($raw=mysqli_fetch_array($run)) 
			{
			?>
			<td><?php echo $raw['name']?>
			<td><?php echo $raw['username']?>
            <td><?php echo $raw['password']?>
            <td><?php echo $raw['imei']?>
                                 
</tr><?php } }
			?>																		
							
						</table>
					</div>
				</div>
</body>
</html>