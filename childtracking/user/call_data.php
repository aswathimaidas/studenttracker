<!DOCTYPE html>
<html lang="en">
<head>
	<title>Table V04</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body><?php include'../common/menu.php';?>
<center>  <h2 style="padding-top:-1px; font-family:Georgia, 'Times New Roman', Times, serif">CALLS</h2></center>
<center><br><br>
<table class="w3-table-all" style="width:500px">
<tr class="" style="color:#F00">
									<th >IMEI</th>
									<th >CALL TYPE</th>
									<th >NUMBER</th>
									<th >DATE</th>
								</tr>
							
								<?php 
		include 'connectionI.php';
		$q="select * from call_data";
		$run=mysqli_query($con,$q);
		if(mysqli_num_rows($run)>0)
			{
			while($raw=mysqli_fetch_array($run)) 
			{
			?>
			<td><?php echo $raw['imei']?>
			<td><?php echo $raw['calltype']?>
            <td><?php echo $raw['number']?>
            <td><?php echo $raw['date']?>
                                 
</tr><?php } }
			?>																		
							
						</table>
					</div>
				</div>
</body>
</html>