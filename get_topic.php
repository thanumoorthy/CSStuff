<?php

$con = mysqli_connect("mysql13.000webhost.com","a2914448_root","Thanu1100","a2914448_csstuff");
if (!$con) { 
	die('Could not connect to MySQL: ' . mysql_error()); 
} 
echo 'Connection OK'; mysql_close($con); 


?>