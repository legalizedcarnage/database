<?php
require_once('./connect.php');

session_start();


$cost = 0;
if(isset($_SESSION['cart'])) {
$sql = "select createorder(1);";
$result = pg_query($db, $sql);
$result = pg_fetch_row($result);
$result = $result[0];
foreach ($_SESSION['cart'] as $key => $value) {
    $qt = $_SESSION['qty'][$key];
    $sql = "select orderitem($result, $value, $qt);";
    pg_query($db, $sql);
}
unset($_SESSION['cart']);   
unset($_SESSION['qty']);   
}
require_once('./header.php');



$sql = "select quantity, s_price from ord_contains where oid=$result;";
$result = pg_query($db, $sql);
while ($row = pg_fetch_row($result)) {
    $cost += $row[0]*$row[1];
}
echo "Total price of order: $cost.";






?>