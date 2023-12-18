<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
require 'php-includes/connect.php';

$email = 'admin@example.com';
$names = 'Admin Name';
$phone = '123456789';
$address = 'Admin Address';
$password = 'hashed_password'; // You should hash the password before storing it

// SQL query to insert data into the admin table
$sql = "INSERT INTO `admin` (`email`, `names`, `phone`, `address`, `password`) VALUES (:email, :names, :phone, :address, :password)";

// Use prepared statements to prevent SQL injection
$stmt = $db->prepare($sql);
$stmt->bindParam(':email', $email);
$stmt->bindParam(':names', $names);
$stmt->bindParam(':phone', $phone);
$stmt->bindParam(':address', $address);
$stmt->bindParam(':password', $password);

// Execute the statement
if ($stmt->execute()) {
    echo "Data inserted successfully!";
} else {
    echo "Error: " . $stmt->errorInfo()[2]; // Display the detailed error message
}

// Close the statement and database connection
$stmt->closeCursor(); // Close the cursor, necessary for some databases
$db = null; // Close the database connection

// $newamount = 0;
// $price = 100;

// // Get the raw JSON data from the request
// $jsonData = file_get_contents("php://input");

// // Decode the JSON data
// $jsonObject = json_decode($jsonData, true);
// if ($jsonObject && isset($jsonObject['card'])) {
//     $card = $jsonObject['card'];
//     $query = "SELECT * FROM user WHERE card = ? LIMIT 1";
//     $stmt = $db->prepare($query);
//     $stmt->execute(array($card));

//     if ($stmt->rowCount() > 0) {
//         $rows = $stmt->fetch(PDO::FETCH_ASSOC);
//         $user = $rows['id'];
//         $am = $rows['balance'];

//         if ($price <= $am) {
//             $newamount = $am - $price;

//             $sql = "UPDATE user SET balance = ? WHERE id = ? LIMIT 1";
//             $stm = $db->prepare($sql);

//             if ($stm->execute(array($newamount, $user))) {
//                 $sql = "INSERT INTO transactions (credit, user) VALUES (?, ?)";
//                 $stm = $db->prepare($sql);
//                 $stm->execute(array($price, $user));

//                 $data = array("cstatus" => "3", "balance" => $newamount);
//                 echo $response = json_encode($data);
//             }
//         } else {
//             $data = array("cstatus" => "1");
//             echo $response = json_encode($data);
//         }
//     }
// }
?>
