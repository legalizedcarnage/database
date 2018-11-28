<?php 
//define('HOST', "localhost");
//define('USER', "games");
//define('PW', "1234");
//define('DB', "games");
$conn_string = "host=localhost port=5432 dbname=games user=games password=1234";
//$db->query('sql);
//mysqli_query($db, "sql");
//$db = pg_connect(HOST,DB, USER, PW);
$db = pg_connect($conn_string);
if(!$db) {//error
	echo "Connection unsuccessful";
}else {
	//echo "Connection successful";
}
/*
$sql = "SELECT * FROM Persons";
$res = $db->query($sql);
if($res) {
	while($row = $res->fetch_assoc() ) {
		foreach($row as $data) {
			echo $data;
		}
	}
}
 */

?>
