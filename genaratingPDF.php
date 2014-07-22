<?php
require('checkURL.php');

if($_POST['order_id']){
    //Запись куки
    setcookie('order_id', $_POST['order_id']);
    setcookie('order_date', $_POST['order_date']);
    setcookie('fio', $_POST['fio']);
    setcookie('telephone', $_POST['telephone']);
    setcookie('firm_telephones', $_POST['firm_telephones']);
    setcookie('firm_city_address', $_POST['firm_city_address']);
    setcookie('firm_city', $_POST['firm_city']);
    setcookie('total_price', $_POST['total_price']);
    setcookie('productList', $_POST['productList']);
    setcookie('countProductList', $_POST['countProductList']);
    setcookie('priceProductList', $_POST['priceProductList']);
    setcookie('elementsParameters', $_POST['elementsParameters']);
}
else {
    echo getMessage();
}
