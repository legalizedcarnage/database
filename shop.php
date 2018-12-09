<?php
$cat;
$sort;

$sql = "select * from item";
if(isset($_GET['search'])) {
    $s2 = trim($_GET['search']);
    $s = ucfirst($s2); 
    $sql  .= " where (iname like '%" .  $s. "%' or iname like '%" .  $s2. "%')";
}
if(isset($_GET['cat'])) {
    $cat = trim($_GET['cat']);
    if(isset($_GET['search'])) {
        $sql .= " and ";
    }else  {
        $sql .= " where ";
    }
    
    $sql  .= "(console = '" .  $cat. "')";
}

if(isset($_GET['sort'])) {
    $sql .= " order by " . $_GET['sort'] . " desc";
}
$result = pg_query($db, $sql);
$num = pg_num_rows($result);

if (!$result) {
    echo "An error occurred.\n";
    exit;
}

//number of results and filters

echo "<div style='margin:auto;width:50%'class = shop>";
if(isset($_GET['search'])) {
    echo "Searching for \"".$_GET['search']."\"";
}
if(isset($_GET['cat'])) {
    if(!isset($_GET['search'])) {
        echo "Searching";
    }
    echo " in ".$_GET['cat'];
}
if(isset($_GET['search']) || isset($_GET['cat'])) {
    echo "<br>";
}
echo $num." Results</br>";
echo " Sort by: <form style='display:inline'action='' method='get'>";
if(isset($_GET['cat'])) {
    echo "<input type ='hidden' name = 'cat' value = ";
    echo "'".trim($_GET['cat'])."'>";
}
if(isset($_GET['search'])) {
    echo "<input type ='hidden' name = 'search' value = ";


    echo "'".trim($_GET['search'])."'>";
}
echo "<button name = 'sort' value='price' class = 'btn-link' type='submit'>Price</button>";
echo "<button name='sort' value = 'iname' class = 'btn-link' type='submit'>Alphabetical</button>";
echo "</form></br>";


//results
while ($row = pg_fetch_row($result)) {
    //open item
    echo "<div class = 'item' style = 'height:130;width:auto;border-top:1px dotted black;border-bottom:1px dotted black'>";
        echo "<div class = 'item-icon'>"; 
            echo "<img src = ' '> </img>";
        echo "</div>";
        //float left
        echo "<div class = 'item-name' style='float:left'>"; 
            echo "<span style='font-size:20'>$row[2] for $row[7]</span></br>";
            echo "<span style='font-size:20'>by $row[4]</span></br>";
        echo "</div>";
        //float right
        echo "<div class = 'item-price' style='float:right;text-align:right'>"; 
            echo "<span style='font-size:20'>Buy $row[3]</span></br>";
            echo "<span style='font-weight:bold;font-size:32'>Price: \$$row[6]</span></br> ";
            echo "<form method='post' action='checkout.php'><button style='width:200'class = 'btn btn-lg btn-primary btn-block ' type='submit' name='item' value='$row[0]'>Add to cart <i style='' class='fa fa-cart-plus'></i></button></form>";
            //echo "<input type='button' value='add to cart'><i style='' class='fa fa-cart-plus'></i>";
        echo "</div>";

    
    //close 
    echo "</div><br />\n";
}
echo "</div>";
?>