<!DOCTYPE html>
<html lang="en">
<head>
	<title>Table V04</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!--===============================================================================================-->
</head>
<body><?php include'../common/menu.php';?>
<center>  <h2 style="padding-top:-1px; font-family:Georgia, 'Times New Roman', Times, serif">PROFILE</h2></center>
<center><br><br>
<table class="w3-table-all" style="width:500px">
<tr class="" style="color:#F00">
									<th>IMEI</th>
									<th >PROFILE</th>
                                    <th>Update</th>
								</tr>
							
						
					</div>
			
								<?php 
		include 'connectionI.php';
		if(isset($_REQUEST['st']))
		{
			mysqli_query($con,"UPDATE sound_profile profile='$_REQUEST[st]' WHERE imei='$_REQUEST[ime]'");
		}
		$q="select * from sound_profile";
		$run=mysqli_query($con,$q);
		if(mysqli_num_rows($run)>0)
			{
			while($raw=mysqli_fetch_array($run)) 
			{
			?>
			<td><?php echo $raw['imei']?>
			<td><?php echo $raw['profile']?></td>
            <td><a href="ime=<?php echo $raw['imei']?>&&st=1" class="btn btn-danger">Normal</a> <a href="ime=<?php echo $raw['imei']?>&&st=2" class="btn btn-danger">Silent</a></td>
            
                                 
</tr><?php } }
			?>																		
							
						</table></center>
					</div>
				</div>
</body>
</html>