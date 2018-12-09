<?php session_start(); ?>

<h1> Home Page</h1>
<?php
if(isset($_POST['user']) && isset($_POST['pass'])) {
	$db_user = 'john';
	$db_password = 'pass';
	$userPOST = $db->real_escape_string($_POST['user']);
	$passwordPOST = $db->real_escape_string($_POST['pass']);
	if($res = $db->query("SELECT * FROM Users WHERE u_email='$userPOST'")) {
		//if($res->num_rows == 1) {
		if($row = $res->fetch_assoc()) {
			if($row['pass'] == $passwordPOST) {
				$_SESSION['isActive'] = true;
				$_SESSION['user'] = $row['user'];

				session_regenerate_id(true);

				header("Location: ./home.php");
			} else {
			//ERROR: password does not match
			}
		}else {
		//ERROR: no user w/ email = to posted email
		}
	}
	if($db_user == $_POST['user']) {
		if($db_password == $_POST['pass']) {
			$_SESSION['isActive'] = true;
			$_SESSION['user'] = $db_user;

		//	header("Location: ./home.php");
		}else {
			echo "invalid credintials";
		}
	}else {
		echo "invalid credintials";
	}
}
if(isset($_SESSION['isActive']) && $_SESSION['isActive'] === true) {
	echo "User is active";
	echo "<a href='logout.php'>Logout</a>";
} else {
	echo "Use is not active";
?> 
<form action='login.php' method='POST'>
<input type='text' name='user'>
<input type = 'text' name='pass'>
<input type='submit' value='login'>
</form>
<?php } ?>

