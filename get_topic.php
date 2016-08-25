<?php
$con = mysqli_connect("mysql13.000webhost.com","a2914448_root","Thanu1100","a2914448_csstuff");
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 

$query = "SELECT a.topic_id, a.topic_name, b.topic_dt_name, b.topic_dt_id, b.topic_dt_desc, b.topic_icon,  DATE_FORMAT(b.last_updated, '%b-%y') as last_updated_year , EXTRACT( DAY FROM b.last_updated ) AS last_updated_date FROM topic a, topic_details b WHERE a.topic_id = b.topic_id ORDER BY a.topic_id, b.topic_dt_id";
$stmt = $con->prepare($query);
$stmt->execute();

$stmt->bind_result($topic_id, $topic_name, $topic_dt_name , $topic_dt_id,$topic_dt_desc,$topic_icon,$last_update_year,$last_update_date);

$topic_list  = array();
$topic = array();
$topic_details = array(); 
$is_new_topic = TRUE;
$prev_topic_id = "1";

while ( $stmt -> fetch()) {	
   //add first topic 
   if (  $topic_id == "1" ) {
	   $topic['topic_id'] = $topic_id;
	   $topic['topic_name'] = $topic_name;
	   $topic_details['topic_dt_name'] = $topic_dt_name;
	   $topic_details['topic_dt_id'] = $topic_dt_id;
 	   $topic_details['topic_dt_desc'] = $topic_dt_desc;
	   $topic_details['topic_icon'] = $topic_icon;
	   $topic_details['last_update_year'] = $last_update_year;	  
	   $topic_details['last_update_date'] =  $last_update_date;
	 }
   
   
    if ( $prev_topic_id == $topic_id ) {
         $is_new_topic = FALSE;
	  }   
   else {
	    $is_new_topic = TRUE;
		$prev_topic_id = $topic_id;
   }
   if ( $is_new_topic) {
       $topic['topic_details'] = $topic_details;    
	   array_push($topic_list,$topic);
	   $topic = array();
       $topic_details = array(); 
       $topic['topic_id'] = $topic_id;
	   $topic['topic_name'] = $topic_name;
	   $topic_details['topic_dt_name'] = $topic_dt_name;
	   $topic_details['topic_dt_id'] = $topic_dt_id;
 	   $topic_details['topic_dt_desc'] = $topic_dt_desc;
	   $topic_details['topic_icon'] = $topic_icon;
	   $topic_details['last_update_year'] = $last_update_year;	 
	   $topic_details['last_update_date'] =  $last_update_date;
	 
   }
   else {
	   array_push($topic,$topic_details);
	   $topic_details = array();
	   $topic_details['topic_dt_name'] = $topic_dt_name;
	   $topic_details['topic_dt_id'] = $topic_dt_id;
 	   $topic_details['topic_dt_desc'] = $topic_dt_desc;
	   $topic_details['topic_icon'] = $topic_icon;
	   $topic_details['last_update_year'] = $last_update_year;	  
	   $topic_details['last_update_date'] =  $last_update_date;
	   
   }
  

}
$topic['topic_details'] = $topic_details;    
array_push($topic_list,$topic);
echo json_encode($topic_list);



$stmt->close();
$con->close();
?>

