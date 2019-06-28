<?php 
        include ('layout_manager.php');
        include ('content_function.php');
?>


<html>
    <head><title>Gila Forum</title></head> 
    <link href="styles/style.css" type="text/css" rel="stylesheet"/>

<body>
    <div class="pane">
        <div class="header"><h1><a href="/forum gila">hfdasghjsgfhjd</a></h1></div>
        <div class="loginpane">
            <?php
            session_start();
                if (isset($_SESSION[ 'username'])) {
                    logout();
                } else {
                    if (isset($_GET[ 'status'])) {
                        if ($_GET[ 'status'] == 'reg_success') {
                            echo "<h1 style= 'color: green;'>new user registerd succesfully!</h1>";
                        } else if ($_GET['status'] == 'login_fail') {
                            echo "<h1 style= 'color: red;'>invalid username and/or password!</h1>";
                        }
                    }
                    loginform();
                }


            ?>
        </div>
        <div class="forumdesc"> 
            <p>Welcomhfdsag,jhaghdfshfsk</p>
        </div>
        <div class="content">
            <?php dispcategories();


            ?>

        </div>
    </div>
</body>
</html>