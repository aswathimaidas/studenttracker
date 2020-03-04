<?php
include("table.php");
include("../header_inner.php");

include("../connection.php");
$k=0;
?>


<html lang="en">
<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap.min.css">
  <script src="jquery.min.js"></script>
  <script src="bootstrap.min.js"></script>
</head>
<body>



<?php
include("data_validation.php");
$id=$_REQUEST['id'];
$result = mysqli_query($con,"SHOW FIELDS FROM history");

$i = 0;
echo "<form action='update_data.php?id=$id' method='post' enctype='multipart/form-data'>";
while ($row = mysqli_fetch_array($result))
 {

  $name=$row['Field'];
  $type=$row['Type'];
  $type = explode("(", $type);
  $type_only=$type[0];
$i++;

$result2 = mysqli_query($con,"SELECT * FROM history where id='$id'") or die(mysql_error());
$row2= mysqli_fetch_array($result2);

$datas=$row2[$name];
//echo $datas;
if($i==1)
{
}
elseif($i==12)
{
	//$dateT=date("Y-m-d H:i:s");
	//echo "<input type='text' name='$name' value='$_POST[package]' class='form-control' readonly >";
	
	
	  echo "
	  
	  
	  <div class='col-md-10'>
                                            <div class='form-group'><label>
	  
	  ".str_replace('_', ' ', $name)."</label><input type='text' name='$name'class='form-control'  value='$datas' readonly> </div>
                                        </div>";
	
}


 elseif($i==30 )
  {
	  echo "
	  
	  <div class='col-sm-2'>".str_replace('_', ' ', $name)."</div><div class='col-sm-4'> ";
	  
	
	echo "<select name='$name' class='form-control'>";
	
	  
	  $sql2 = "select *  from division where id='$row2[division]'";
    $result2 = mysqli_query($con, $sql2) or die("Error in Selecting " . mysqli_error($connection));

    
    while($row2 =mysqli_fetch_array($result2))
    {
		
		echo "<option value='$row2[id]'>$row2[division]</option>";
	}
	
	  $sql2 = "select *  from division where id!='$row2[division]'";
    $result2 = mysqli_query($con, $sql2) or die("Error in Selecting " . mysqli_error($connection));

    
    while($row2 =mysqli_fetch_array($result2))
    {
		
		echo "<option value='$row2[id]'>$row2[division]</option>";
	}
	
	
	
	
	
	
	
	  echo "</select>";
	    
	  echo "</div>
                                        ";
	
      
    
  }
  


elseif($i==400 )
  {
	
	  $date=date("Y-m-d");
	  
	  $t="t".$k;
	  echo "
	  
	  
	  
	  <div class='col-md-5'>
                                            <div class='form-group'><label>
	  
	  ".str_replace('_', ' ', $name)." jjjjjjjjjjjj</label>
	  
	  <input type='text' name='$name'  class='form-control' value='$date' id='$t' required ></div></div>";
	   ?>
	  
	    <script type="text/javascript">
$(function() {
	$('#t<?php echo $k;?>').datepick({
		
	dateFormat:"dd-mm-yyyy",
	minDate:new Date('1980-01-01'),
	maxDate: new Date('2000-01-01')
		
	}
	
	);
	
});

function showDate(date) {
	alert('The date chosen is ' + date);
}
</script>
      <?php
	  $k++;
    
  }










  elseif($type_only=="varchar" || $type_only=="int" || $type_only=="int" || $type_only=="tinyint"  )
  {
	  
	  
	  echo "
	  
	  
	  <div class='col-md-10'>
                                            <div class='form-group'><label>
	  
	  ".str_replace('_', ' ', $name)."</label><input type='text' name='$name' value='$datas' class='form-control' > </div>
                                        </div>";
	  
	  
	  
  }
  
  
    elseif($type_only=="date" )
  {
	
	  $date=date("Y-m-d");
	  
	  $t="t".$k;
	  echo "
	  
	  
	  
	  <div class='col-md-10'>
                                            <div class='form-group'><label>
	  
	  ".str_replace('_', ' ', $name)." </label>
	  
	  <input type='text' name='$name'  class='form-control' value='$date' id='$t' required ></div></div>";
	   ?>
	  
	    <script type="text/javascript">
$(function() {
	$('#t<?php echo $k;?>').datepick({
		
	dateFormat:"dd-mm-yyyy",
	minDate:new Date('1980-01-01'),
	maxDate: new Date('2000-01-01')
		
	}
	
	);
	
});

function showDate(date) {
	alert('The date chosen is ' + date);
}
</script>
      <?php
	  $k++;
  }
  
  
  
  
 if($type_only=="tinytext" )
  {
	  echo "
	  
	  	  
	  <div class='col-md-10'>
                                            <div class='form-group'><label>
	  
	  ".str_replace('_', ' ', $name)."</label>
	  
	  <input type='file' name='$name' class='form-control' value='$datas' >
	 <img src='uploads/$datas' width='180'>
	  
	  </div></div>";
  }
  if($type_only=="text" )
  {
	  echo "<div class='col-md-10'>
                                            <div class='form-group'><label>
											
											 ".str_replace('_', ' ', $name)."</label>
											
											<textarea name='$name' class='form-control'>$datas</textarea>
											</div>
											</div>";
  }
  
  
  

  
  
}


echo "
<div class='col-md-12'>
                              <div class='col-md-3'>              <div class='form-group'>
											<input type='submit' value='Update' name='submit' class='form-control btn-success'>";



echo "</form>";



echo "
</div></div><div class='col-md-3'>   <div class='form-group'>
<form action='select.php' method='post'><input type='submit' name='view' value='Back' class='form-control btn-danger'></form></div></div>
<div class='clearfix'></div>

</div>
";



mysqli_free_result($result);






echo "<div class='clearfix'></div>
";










mysqli_close($con);

include("../footer_inner.php");

?>
<div id="sample">
