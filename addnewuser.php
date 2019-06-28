<?php
    include ('dbconn.php');

    $newuser = $_POST['usernameinput'];
    $newpwd = $_POST['passwordinput'];

    $insert =  mysqli_query($con, "INSERT INTO users (`username`, `password`) VALUES ('".$newuser."', '".$newpwd."')");

    if ($insert) {
        header("location: /forum gila/index.php?status=reg_success ");
    }
?>