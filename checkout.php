<?php
session_start();
require_once('./connect.php');


if(isset($_POST['item'])) {
    if(isset($_SESSION['cart'])) {
        if(in_array($_POST['item'],$_SESSION['cart'])) {
            $_SESSION['qty'][array_search($_POST['item'],$_SESSION['cart'])] +=1;
        }else {
            
            $_SESSION['qty'][sizeof($_SESSION['cart'])]=1;
            $_SESSION['cart'][sizeof($_SESSION['cart'])]=$_POST['item'];
        }
    }else{
        $_SESSION['cart'][0]=$_POST['item'];
        $_SESSION['qty'][0]=1;
    }
}
require_once('./header.php');
if(isset($_SESSION['cart'])) {
    $list = implode(",",$_SESSION['cart']);
    $result = pg_query($db, "select * from item where iid IN ($list)");
    while ($row = pg_fetch_row($result)) {
        //open item
        echo "<div class = 'item' style = 'height:120;width:300px;border-top:1px dotted black;border-bottom:1px dotted black'>";
            echo "<div class = 'item-icon'>"; 
                echo "<img src = ' '> </img>";
            echo "</div>";
            //float left
            echo "<div class = 'item-name' style='float:left'>"; 
                $q = $_SESSION['qty'][array_search($row[0],$_SESSION['cart'])];
                echo "$row[2] for $row[7] * $q;</br>";
                echo "by $row[4]</br>";
            echo "</div>";
            //float right
            echo "<div class = 'item-price' style='float:right;text-align:right'>"; 
                echo "</br>Buy $row[3]</br>";
                echo "Price: $row[6]</br> ";
                echo "<form method='post' action='checkout.php'><button class = 'btn btn-lg btn-primary btn-block ' type='submit' name='item' value='$row[0]'>Add to cart <i style='' class='fa fa-cart-plus'></i></button></form>";
                //echo "<input type='button' value='add to cart'><i style='' class='fa fa-cart-plus'></i>";
            echo "</div>";

        //close 
        echo "</div><br />\n";
    }
}  
echo "<a href = './'>Go back</a>"; 
echo "<a href = './payment.php'>Pay</a>";