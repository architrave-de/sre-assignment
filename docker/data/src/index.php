
<?php
    $conn = mysqli_connect('db', 'devuser', 'devpass');
    $db   = mysqli_select_db($conn,'test_db');
    mysqli_query($conn, 'CREATE TABLE IF NOT EXISTS `colors` (`col1` VARCHAR(32)) ENGINE=InnoDB');
    mysqli_query($conn, 'TRUNCATE TABLE `colors`');
    mysqli_query($conn, 'INSERT INTO `colors` SET `col1` = "blue"');
    $result = mysqli_query($conn, 'SELECT * FROM `colors`');
    $row = mysqli_fetch_row($result);
    if ($row[0] !== 'blue') {
        die("Something went wrong\n");
    }
    echo "Ìnstance provisioned successfully\n";