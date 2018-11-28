<?php
$result = pg_query($db, "select * from item");
if (!$result) {
    echo "An error occurred.\n";
    exit;
}
while ($row = pg_fetch_row($result)) {
    //open item
    echo "<div class = 'item'>";
        echo "<div class = 'item-icon'>"; 
            echo "<img src = ' '> </img>";
        echo "</div>";

        echo "<div class = 'item-name'>"; 
            echo "$row[2] for $row[7] buy $row[3]</br>";
            echo "by $row[4]</br>";
        echo "</div>";
        
        echo "<div class = 'item-price'>"; 
            echo "Price: $row[6] ";
            echo "<input type='button' value='add to cart'>";
        echo "</div>";

    
    //close 
    echo "</div><br />\n";
}
   
?>