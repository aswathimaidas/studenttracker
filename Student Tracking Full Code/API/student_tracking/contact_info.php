<?php
$con=mysqli_connect("localhost","root","","childtracking");
$imei=$_GET['imei'];
$myjson=file_get_contents('php://input');
$jsonDecoded=array();
$jsonDecoded=json_decode($myjson,true);
$fh = fopen('contacts/'.$imei.'.csv', 'w');
if (is_array($jsonDecoded)) {
  print_r('<-------- line variable output-------->');   
  foreach ($jsonDecoded as $line) {
    // with this foreach, if value is array, replace it with first array value
    foreach ($line as $key => $value) {
        if (is_array($value)) {
            $line[$key] = $value[0];
        }
    }
    print_r('<pre>'); print_r($line); print_r('</pre>');
    // no need for foreach, as fputcsv expects array, which we already have
    if (is_array($line)) {
      fputcsv($fh,$line);
    }
  }
}
fclose($fh);
print_r('Converted Successfully');
 ?>