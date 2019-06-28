<?php
    function dispcategories() {
        include ('dbconn.php');

        $select = mysqli_query($con,  "SELECT * FROM categories");


        while ($row = mysql_fetch_assoc($select)) {
            echo"<table class='category-table'>";
            echo"<tr><td class='main-category' colspan='2'>".$row['category_title']."</td></tr>";
            dispsubcategories($row['cat_id']);
            echo "</table>";

        }
    }


     function dispsubcategories($parent_id) {
         include ('dbconn.php');
         $select = mysqli_query($con,"SELECT cat_id, subcat_id, subcategory_title, subcategory_desc FROM categories, subcategories
                                    WHERE ($parent_id = categories.cat_id) AND ($parent_id = subcategories.parent_id) ");
        
        echo "<tr><th width='90'>Categories</th><th width='10%'>Topics</th></tr>";
        while ($row = mysqli_fetch_assoc($select)) {
            echo "<tr><td class='category_title'><a href='/forum gila/topics.php?cid=".$row['cat_id']."&scid=".$row['subcat_id']."'>
                ".$row['subcategory_title']."<br />";
            echo $row['subcategory_desc']."</a></td>";
            echo "<td class'num_topics'>".getnumtopics($parent_id, $row['subcat_id'])."</td><.tr>";
        }
     }

     function getnumtopics($cat_id, $subcat_id) {
         include ('dbconn.php');
         $select = 
     }
?>