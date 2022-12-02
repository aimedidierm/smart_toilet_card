<?php
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(E_ALL);
require 'php-includes/connect.php';
$newamount=0;
$price=100;
if(isset($_POST['card'])){
    $card = $_POST['card'];
    $query = "SELECT id,balance FROM user WHERE card = ? limit 1";
    $stmt = $db->prepare($query);
    $stmt->execute(array($card));
    if ($stmt->rowCount()>0) {
        $rows = $stmt->fetch(PDO::FETCH_ASSOC);
        $user=$rows['id'];
        $am=$rows['balance'];
        if ($price <= $am) {
            $newamount=$am-$price;
            $sql ="UPDATE user SET balance = ? WHERE id = ? limit 1";
            $stm = $db->prepare($sql);
            if ($stm->execute(array($newamount, $user))) {
                $sql ="INSERT INTO transactions (credit,user) VALUES (?,?)";
                $stm = $db->prepare($sql);
                $stm->execute(array($price,$user));
                $data = array('cstatus' =>'1','balance' =>$newamount); 
                echo $response = json_encode($data);
            }
        } else {
            $data = array('cstatus' =>'2'); 
            echo $response = json_encode($data);
        }
    }
}
?>