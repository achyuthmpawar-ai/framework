
<?php
$host = "localhost";
$username = "root";
$password = "";
$database = "csci6040_study";

$con = mysqli_connect($host, $username, $password, $database);

// Correct way to check connection with mysqli_connect()
if (mysqli_connect_errno()) {
    die("Cannot connect to DB: " . mysqli_connect_error());
}
?>