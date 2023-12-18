<?php
//echo phpinfo();exit();
echo "Hello, Docker! PHP is Now Up and Running PHP version: " . phpversion();

$host = 'docker-mysql-db-1';
$db = getenv('DB_NAME');
$user = getenv('DB_USERNAME');
$pass = getenv('DB_PASSWORD');

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

var_dump("Connected to MySQL successfully");
$conn->close();
?>