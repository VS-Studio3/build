<?php
require('tfpdf/tfpdf.php');
require('checkURL.php');

$host = 'localhost';
$user = 'root';
$pasword = '';
$dbName = 'build';

$pdfParameters = ['order_id' => '', 'order_date' => '', 'fio' => '', 'telephone' => '', 
        'firm_telephones' => '', 'firm_city' => '', 'firm_city_address' => '', 
        'productList' => '', 'countProductList' => '', 'priceProductList' => '', 'total_price' => '',
        'number' => '', 'elementsParameters' => ''];

if(isset($_GET['order_id'])){
    //Берем из БД
    $connection = new mysqli($host, $user, $pasword,  $dbName);
    $connection->query("SET NAMES 'utf8';");
    
    $order_id = $connection->real_escape_string($_GET['order_id']);
    
    $selectQuery = "SELECT * FROM orders_documents WHERE order_id = '" . $order_id ."'";
    
    $result = $connection->query($selectQuery);
    if($result->num_rows > 0){
        $pdfParametersVal = $result->fetch_assoc();
        printDocument($pdfParametersVal);
    }
    else{
        echo getMessage();
    }
    $connection->close(); 
}
else if($_COOKIE['order_id']){
    //Берем из куки, потом куки удаляем и записываем в БД PDF
    $pdfParameters['order_id'] = $_COOKIE['order_id'];
    $pdfParameters['order_date'] = $_COOKIE['order_date'];
    $pdfParameters['fio'] = $_COOKIE['fio'];
    $pdfParameters['telephone'] = $_COOKIE['telephone'];
    $pdfParameters['firm_telephones'] = $_COOKIE['firm_telephones'];
    $pdfParameters['firm_city'] = $_COOKIE['firm_city'];
    $pdfParameters['firm_city_address'] = $_COOKIE['firm_city_address'];
    $pdfParameters['productList'] = $_COOKIE['productList'];
    $pdfParameters['countProductList'] = $_COOKIE['countProductList'];
    $pdfParameters['priceProductList'] = $_COOKIE['priceProductList'];
    $pdfParameters['total_price'] = $_COOKIE['total_price'];
    $pdfParameters['elementsParameters'] = $_COOKIE['elementsParameters'];
    
    $numberString = file_get_contents('number.txt');
    $number = 'ЦКФ' . strval(intval($numberString) + 1);
    $pdfParameters['number'] = $number;
    file_put_contents('number.txt', strval(intval($numberString) + 1));
    
    //Удаляем куки
    setcookie("order_id", "", time() - 3600);
    setcookie("order_date", "", time() - 3600);
    setcookie("fio", "", time() - 3600);
    setcookie("telephone", "", time() - 3600);
    setcookie("firm_telephones", "", time() - 3600);
    setcookie("total_price", "", time() - 3600);
    setcookie("productList", "", time() - 3600);
    setcookie("countProductList", "", time() - 3600);
    setcookie("priceProductList", "", time() - 3600);
    setcookie("firm_city", "", time() - 3600);
    setcookie("firm_city_address", "", time() - 3600);
    setcookie("elementsParameters", "", time() - 3600);

    /*Делаем запись документа в БД*/
    extract($pdfParameters);
    $connection = new mysqli($host, $user, $pasword,  $dbName);
    $connection->query("SET NAMES 'utf8';");
    
    $insertQuery = "INSERT INTO orders_documents(order_id, order_date, fio, telephone, firm_telephones, firm_city, firm_city_address, productList, countProductList, priceProductList, total_price, number, elementsParameters) "
            . "VALUES ('".$order_id."', '".$order_date."', '".$fio."', '".$telephone."', '".$firm_telephones."', '".$firm_city."', '".$firm_city_address."', '".$productList."', '".$countProductList."', '".$priceProductList."', '".$total_price."', '" .$number . "', '" . $elementsParameters . "')"; 
    if (!$connection->query($insertQuery)) {
        echo "INSERT failed: (" . $connection->errno . ") " . $connection->error;
        exit;
    }    
    $connection->close();
    /*Выводим документ*/
    printDocument($pdfParameters);
}
else {
    echo getMessage();
}
