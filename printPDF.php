<?php
require('checkURL.php');

if($_COOKIE['order_id']){
    
    
    //После показа куки удаляем
    setcookie ("order_id", "", time() - 3600);
}
else{
    echo getMessage();
}
