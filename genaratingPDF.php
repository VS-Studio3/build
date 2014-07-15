<?php
require('checkURL.php');

if($_POST['order_id']){
    //Запись куки
    setcookie('order_id', $_POST['order_id']);
}
else {
    echo getMessage();
}
