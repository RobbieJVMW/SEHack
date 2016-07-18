<?php
header('Content-Type: text/xml');

// input values
if($argv[1])
{
	$input_function=$argv[1];
	$input_value=$argv[2];
	$input_type=$argv[3];
	
}
else
{
$input_function=$_GET["function"];
$input_value=$_GET["value"];
$input_type=$_GET["type"];
}



//db connections
$servername = $_SERVER["dbserver"];
$username = $_SERVER["dbuser"];
$password = $_SERVER["dbpass"];
$dbname=$_SERVER["dbname"];

if(!$servername)
{
//db connections
$servername = "temperature.clmv89mfjqjm.eu-west-1.rds.amazonaws.com:3306 ";
$username = "hackathon";
$password = "hackathon123";
$dbname="hackathon";

}

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
if (!$conn) {
    $response="ERROR - no connection to $servername with $username / $dbname";
	echo "$response"; exit;
}



switch ($input_function) {
	
	case "addReading":
	$response=addReading($input_type,$input_value,$conn);
	break; 
	
	case "getReading":
	$response=getReading($input_type,$input_value,$conn);
	break; 
	
	default:
	$response="Error";
	
}

?>
<?xml version="1.0" encoding="utf-8"?>
<hackathon>
<?php 
echo "$response";
?>

</hackathon>

<?php



	function addReading($type,$value,$conn)
	{
		if(!$type or !$value) { 			    $response="\t<status>Error</status>\n\t<message>invalid input</message>";}
		else{
			$sql = "INSERT INTO `weather` (type,value) VALUES ('$type','$value')";
			if (mysqli_query($conn, $sql)) {
			    $response="\t<status>Success</status>";
			} else {
			    $response="\t<status>Error</status>\n\t<message>DB insert failed</message>";
			}	
		}
			
		return $response; 
	}
	
	function getReading($type,$value,$conn)
	{

		$sql = "SELECT datetime, type, value FROM weather WHERE `type`='$type' ORDER BY `id` DESC LIMIT 0,$value";
		$result = mysqli_query($conn, $sql);
		if (mysqli_num_rows($result) > 0) {
		    while($row = mysqli_fetch_assoc($result)) {
	           $response.="\t<reading>\n\t\t<date>" . $row["datetime"]. "</date>\n\t\t<type>" . $row["type"]. "</type>\n\t\t<value>" . $row["value"]. "</value>\n\t</reading>\n";
	       }
	   }
	   else {$response="<status>Error</status>\n\t<message>no data</message>"; }
	   
	   return $response;
	}
?>
