<?php

function url(){
    if(isset($_SERVER['HTTPS'])){
        $protocol = ($_SERVER['HTTPS'] && $_SERVER['HTTPS'] != "off") ? "https" : "http";
    }
    else{
        $protocol = 'http';
    }
    return $protocol . "://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
}

function getMessage(){
    return 'Вы неверно зашли. <a href="' . substr(url(), 0, strrpos(url(),'/')) . '">На главную</a>';
}

