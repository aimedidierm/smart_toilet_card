<?php

require __DIR__ . '/../vendor/autoload.php';
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();
$dbHost = $_ENV['DB_HOST'];
$dbUser = $_ENV['DB_USER'];
$dbPass = $_ENV['DB_PASS'];
$dbName = $_ENV['DB_NAME'];
$db = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
if (!is_null($db->errorCode())) {
	die("Not Connected");
	exit();
}
