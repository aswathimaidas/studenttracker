<?php
$con=mysqli_connect("localhost","root","","hcare");
$jsonIterator = new RecursiveIteratorIterator(
    new RecursiveArrayIterator(json_decode(file_get_contents('php://input'), true)),
    RecursiveIteratorIterator::SELF_FIRST);

foreach ($jsonIterator as $key => $val) {
    if(is_array($val)) {
        echo "$key:\n";
    } else {
      echo "key = '$key' and value = '$val'";
    }
}
 ?>