<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>Creative Colorlib SignUp Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link href="registration_templates/child_reg.css" rel="stylesheet">


<!-- //web font -->
</head>
<body><?php include'../common/menu.php';?>
	<!-- main -->
  <center>  <h2 style="padding-top:-1px; font-family:Georgia, 'Times New Roman', Times, serif">REGISTARTION</h2></center>
	<div class="main-w3layouts wrapper" style="padding-top:2px">
		
		<div class="main-agileinfo" >
			<div class="agileits-top" style="background-color:#999">
				<form action="childaction.php" method="post">
	                <input class="text" type="text" name="name" placeholder="Name"  title="Text Only" required style="" ><br>
					<input class="text" type="text" name="username" placeholder="Username" required style=""><br>
					<input class="text" type="password" name="password" placeholder="Password" pattern=".{4,20}" required style="">
                    <input class="text email" type="text" name="imei" placeholder="IMEI" pattern="[0-9].{16,20}" required style="">
						<div class="wthree-text">
						
						<div class="clear"> </div>
					</div>
					<input type="submit" value="REGISTER" style="background-color:#F00; border-color:#F00">
				</form>
				
			</div>
		</div>
		<!-- copyright -->
		<div class="colorlibcopy-agile">
			
		</div>
		<!-- //copyright -->
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<!-- //main -->
</body>
</html>