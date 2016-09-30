$servername = "server.com:3306 ";
$username = "user1";
$password = "pass123";
$dbname="tablename";


// Create connection
$connection = mysqli_connect($servername, $username, $password, $dbname);
if (!$connection) {
    $response="ERROR - no connection to $servername with $username / $dbname";
	echo "$response"; exit;
}

	$sql = "SELECT dt, typ, value FROM table WHERE `x`='$y' ORDER BY `id` DESC LIMIT 0,10";
		$result = mysqli_query($conn, $sql);
		if (mysqli_num_rows($result) > 0) {
		    while($row = mysqli_fetch_assoc($result)) {
                $dt=$row[dt];
                $type=$row[typ];
                $val=$row[value];
                
              }