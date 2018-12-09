<?php session_start(); ?>

<?php 
//destroys session
unset($_SESSION);
session_destroy();
$_SESSION= [];

//destroys part of a session
unset($_SESSION['cart']);
header("Location: ./home.php");
?>
