<?php
function num2str($num) {
    $nul='ноль';
    $ten=array(
        array('','один','два','три','четыре','пять','шесть','семь', 'восемь','девять'),
        array('','одна','две','три','четыре','пять','шесть','семь', 'восемь','девять'),
    );
    $a20=array('десять','одиннадцать','двенадцать','тринадцать','четырнадцать' ,'пятнадцать','шестнадцать','семнадцать','восемнадцать','девятнадцать');
    $tens=array(2=>'двадцать','тридцать','сорок','пятьдесят','шестьдесят','семьдесят' ,'восемьдесят','девяносто');
    $hundred=array('','сто','двести','триста','четыреста','пятьсот','шестьсот', 'семьсот','восемьсот','девятьсот');
    $unit=array( // Units
        array('копейка' ,'копейки' ,'копеек',  1),
        array('рубль'   ,'рубля'   ,'рублей'    ,0),
        array('тысяча'  ,'тысячи'  ,'тысяч'     ,1),
        array('миллион' ,'миллиона','миллионов' ,0),
        array('миллиард','милиарда','миллиардов',0),
    );
    //
    list($rub,$kop) = explode('.',sprintf("%015.2f", floatval($num)));
    $out = array();
    if (intval($rub)>0) {
        foreach(str_split($rub,3) as $uk=>$v) { // by 3 symbols
            if (!intval($v)) continue;
            $uk = sizeof($unit)-$uk-1; // unit key
            $gender = $unit[$uk][3];
            list($i1,$i2,$i3) = array_map('intval',str_split($v,1));
            // mega-logic
            $out[] = $hundred[$i1]; # 1xx-9xx
            if ($i2>1) $out[]= $tens[$i2].' '.$ten[$gender][$i3]; # 20-99
            else $out[]= $i2>0 ? $a20[$i3] : $ten[$gender][$i3]; # 10-19 | 1-9
            // units without rub & kop
            if ($uk>1) $out[]= morph($v,$unit[$uk][0],$unit[$uk][1],$unit[$uk][2]);
        } //foreach
    }
    else $out[] = $nul;
    $out[] = morph(intval($rub), $unit[1][0],$unit[1][1],$unit[1][2]); // rub
    $out[] = $kop.' '.morph($kop,$unit[0][0],$unit[0][1],$unit[0][2]); // kop
    return trim(preg_replace('/ {2,}/', ' ', join(' ',$out)));
}

/**
 * Склоняем словоформу
 * @ author runcore
 */
function morph($n, $f1, $f2, $f5) {
    $n = abs(intval($n)) % 100;
    if ($n>10 && $n<20) return $f5;
    $n = $n % 10;
    if ($n>1 && $n<5) return $f2;
    if ($n==1) return $f1;
    return $f5;
}

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

function printDocument($pdfParameters){
    $pdf = new tFPDF();
    $pdf->AddPage();
    
    $pdf->AddFont('DejaVu', '', 'DejaVuSansCondensed.ttf', true);
    $pdf->SetFont('DejaVu', '', 8);
    $pdf->SetTextColor(65, 61, 61);
    $pdf->SetX(30);
    $pdf->Write(5, 'Внимание! Оплата данного счета означает согласие с условиями поставки товара. Уведомление об оплате ');
    $pdf->SetXY(30, $pdf->GetY() + 5);
    $pdf->Write(5, 'обязательно, в противном случае не гарантируется наличие товара на складе. Товар отпускается по факту');
    $pdf->SetXY(43, $pdf->GetY() + 5);
    $pdf->Write(5, 'прихода денег на р/с Поставщика, самовывозом, при наличии доверенности и паспорта.');
    
    $pdf->SetXY(20, $pdf->GetY() + 5);
    $pdf->SetFont('DejaVu', '', 11);
    $pdf->Write(5, 'Счет действителен в течении 3-х дней с момента выписки счета, в других случаях сумма ');
    $pdf->SetXY(20, $pdf->GetY());
    $pdf->Write(5, 'Счет действителен в течении 3-х дней с момента выписки счета, в других случаях сумма ');
    $pdf->SetXY(80, $pdf->GetY() + 5);
    $pdf->Write(5, 'может быть пересчитана');
    $pdf->SetXY(80, $pdf->GetY());
    $pdf->Write(5, 'может быть пересчитана');
    
    $pdf->SetFont('DejaVu', '', 8);
    $pdf->SetXY(10, $pdf->GetY() + 10);
    $pdf->Write(5, '1. Отгрузка товара осуществляется механизированным способом, погрузка в крытый транспорт ');
    $pdf->SetXY(10, $pdf->GetY() + 5);
    $pdf->Write(5, 'осуществляется по дополнительному согласованию.');
    $pdf->SetXY(10, $pdf->GetY() + 5);
    $pdf->Write(5, '2. Получение товара обязательно в течении 7 рабочих дней, с даты изготовления заказа, в противном случае товар считается принятым на ответственное хранение с начислением платы 0,5%');
    
    $pdf->SetXY(10, $pdf->GetY() + 5);
    $pdf->Write(5, 'в сутки от стоимости товаров.');
    
    $pdf->SetXY(10, $pdf->GetY() + 5);
    $pdf->MultiCell(105, 15, '', 1);
    $pdf->SetXY(10, $pdf->GetY() - 15);
    $pdf->Write(5, 'Отделение 8599 Сбербанка России Г. КУРГАН');
    
    $pdf->SetXY(10, $pdf->GetY() + 10);
    $pdf->Write(5, 'Банк получателя');


    $pdf->SetXY(115, $pdf->GetY() - 10);
    $pdf->MultiCell(20, 5, '', 1);
    $pdf->SetXY(115, $pdf->GetY() - 5);
    $pdf->Write(5, 'БИК');
    $pdf->SetXY(115, $pdf->GetY() + 5);
    $pdf->MultiCell(20, 10, '', 1);
    
    $pdf->SetXY(115, $pdf->GetY() - 10);
    $pdf->Write(5, 'Сч. №');
    
    $pdf->SetXY(135, $pdf->GetY() - 5);
    $pdf->MultiCell(63, 15, '', 1);
    
    $pdf->SetXY(135, $pdf->GetY() - 15);
    $pdf->Write(5, '043735650');
    $pdf->SetXY(135, $pdf->GetY() + 5);
    $pdf->Write(5, '30101810100000000650');
    
    $pdf->SetXY(10, $pdf->GetY() + 10);
    $pdf->MultiCell(15, 5, 'ИНН', 1);
    
    $pdf->SetXY(25, $pdf->GetY() - 5);
    $pdf->MultiCell(45, 5, '450902096409', 1);
    
    $pdf->SetXY(70, $pdf->GetY() - 5);
    $pdf->MultiCell(45, 5, 'КПП', 1);
    
    $pdf->SetXY(10, $pdf->GetY());
    $pdf->MultiCell(105, 15, '', 1);
    
    $pdf->SetXY(10, $pdf->GetY()- 15);
    $pdf->Write(5, 'ИП Антропов Александр Павлович');
    
    $pdf->SetXY(10, $pdf->GetY() + 10);
    $pdf->Write(5, 'Получатель');
    
    $pdf->SetXY(115, $pdf->GetY() - 15);
    $pdf->MultiCell(20, 20, '', 1);
    
    $pdf->SetXY(115, $pdf->GetY() - 20);
    $pdf->Write(5, 'Сч. №');
    
    $pdf->SetXY(135, $pdf->GetY());
    $pdf->MultiCell(63, 20, '', 1);
    
    $pdf->SetXY(135, $pdf->GetY() - 20);
    $pdf->Write(5, '40802810732180103546');

    $pdf->SetFont('DejaVu', '', 15);
    $pdf->SetXY(10, $pdf->GetY() + 22);
    
    $date = $pdfParameters['order_date'];
    $currentDate = substr($date, 0, 2) . ' ';
    $month = substr($date, 3, 2);
    $currentMonth = '';
    switch ($month){
        case '01':
            $currentMonth = 'января';
            break;
        case '02':
            $currentMonth = 'февраля';
            break;
        case '03':
            $currentMonth = 'марта';
            break;
        case '04':
            $currentMonth = 'апреля';
            break;
        case '05':
            $currentMonth = 'мая';
            break;
        case '06':
            $currentMonth = 'июня';
            break;
        case '07':
            $currentMonth = 'июля';
            break;
        case '08':
            $currentMonth = 'августа';
            break;
        case '09':
            $currentMonth = 'сентября';
            break;
        case '10':
            $currentMonth = 'октября';
            break;
        case '11':
            $currentMonth = 'ноября';
            break;
        case '12':
            $currentMonth = 'декабря';
            break;
    }
    
    $currentDate = $currentDate . $currentMonth . ' ' . substr($date, 6, 4);
            
    $pdf->Write(5, 'Счет на оплату № ' . $pdfParameters['number'] . ' от ' . $currentDate);
    $pdf->SetXY(10, $pdf->GetY());
    $pdf->Write(5, 'Счет на оплату № ' . $pdfParameters['number'] . ' от ' . $currentDate);
    
    $pdf->SetLineWidth(0.1);
    $pdf->Line(10, $pdf->GetY() + 8, 198, $pdf->GetY() + 8);
    
    $pdf->SetFont('DejaVu', '', 12);
    $pdf->SetXY(10, $pdf->GetY() + 10);
    $pdf->Write(5, 'Поставщик:');
    
    $pdf->SetXY(50, $pdf->GetY() - 2);
    $pdf->SetMargins(50, 0, 10);
    $pdf->Write(8, $pdfParameters['firm_city'] . ', ' . $pdfParameters['firm_city_address'] . ', ' . $pdfParameters['firm_telephones']);
    
    $pdf->SetXY(10, $pdf->GetY() + 10);
    $pdf->Write(5, 'Покупатель:');
    
    $pdf->SetXY(50, $pdf->GetY() - 2);
    $pdf->SetMargins(50, 0, 10);
    $pdf->Write(8, $pdfParameters['fio'] . ', тел.: ' . $pdfParameters['telephone']);
    
    $pdf->SetFont('DejaVu', '', 12);
    
    $pdf->SetXY(10, $pdf->GetY() + 15);
    $leftLinePointY = $pdf->GetY() + 5;
    $pdf->MultiCell(10, 8, '№', 1);
   
    
    $pdf->SetXY(20, $pdf->GetY() - 8);
    $pdf->MultiCell(80, 8, 'Товары (работы, услуги)', 1);
    
    $pdf->SetXY(100, $pdf->GetY() - 8);
    $pdf->MultiCell(20, 8, 'Кол-во', 1);
    
    $pdf->SetXY(120, $pdf->GetY() - 8);
    $pdf->MultiCell(10, 8, 'Ед.', 1);
    
    $pdf->SetXY(130, $pdf->GetY() - 8);
    $pdf->MultiCell(35, 8, 'Цена', 1);
    
    $pdf->SetXY(165, $pdf->GetY() - 8);
    $pdf->MultiCell(35, 8, 'Сумма', 1);
    
    $productsList = explode('|', $pdfParameters['productList']);
    $countProductList = explode('|', $pdfParameters['countProductList']);
    $priceProductList = explode('|', $pdfParameters['priceProductList']);
    $elementsParameters = explode('|', $pdfParameters['elementsParameters']);
    
    $pdf->SetFont('DejaVu', '', 9);
    
    for($i = 0; $i < count($productsList); $i++){
        if($i != 0){
            $pdf->SetLineWidth(0.5);
            $pdf->Line(10, $pdf->GetY(), 200, $pdf->GetY());
        }
        $pdf->SetXY(10, $pdf->GetY());
        $pdf->Write(5, $i + 1);
        
        $pdf->SetXY(100, $pdf->GetY());
        $pdf->Write(5, $countProductList[$i]);
        
        $pdf->SetXY(120, $pdf->GetY());
        $pdf->Write(5, $elementsParameters[$i]);
        
        $pdf->SetXY(130, $pdf->GetY());
        $pdf->Write(5, $priceProductList[$i]);
        
        $pdf->SetXY(165, $pdf->GetY());
        $pdf->Write(5, doubleval(str_replace(',', '.', str_replace(' ', '', $priceProductList[$i]))) * $countProductList[$i] . ' р.');        
        
        $pdf->SetXY(20, $pdf->GetY());
        $pdf->MultiCell(80, 5, $productsList[$i], 1);
    }
    
    $Y = $pdf->GetY();
    $pdf->SetLineWidth(0.1);
    $pdf->Line(10, $Y, 200, $Y);
    $pdf->Line(10, $leftLinePointY, 10, $Y);
    $pdf->Line(200, $leftLinePointY, 200, $Y);
    $pdf->Line(120, $leftLinePointY, 120, $Y);
    $pdf->Line(130, $leftLinePointY, 130, $Y);
    $pdf->Line(165, $leftLinePointY, 165, $Y);
    
    $pdf->SetFont('DejaVu', '', 12);
    $pdf->SetXY(145, $pdf->GetY() + 5);
    $pdf->Write(5, 'Итого :   ' . substr($pdfParameters['total_price'], 0, strlen($pdfParameters['total_price']) - 3));
    $pdf->SetXY(145, $pdf->GetY());
    $pdf->Write(5, 'Итого :   ' . substr($pdfParameters['total_price'], 0, strlen($pdfParameters['total_price']) - 3));
    
    $pdf->SetXY(125, $pdf->GetY()+5);
    $pdf->Write(5, 'Без налога(НДС)');
    $pdf->SetXY(125, $pdf->GetY());
    $pdf->Write(5, 'Без налога(НДС)');
    
    $pdf->Line(195, $pdf->GetY() + 2, 197, $pdf->GetY() + 2);
   
    $pdf->SetXY(127, $pdf->GetY() + 5);
    $pdf->Write(5, 'Всего к оплате :   ' . substr($pdfParameters['total_price'], 0, strlen($pdfParameters['total_price']) - 3));
    $pdf->SetXY(127, $pdf->GetY());
    $pdf->Write(5, 'Всего к оплате :   ' . substr($pdfParameters['total_price'], 0, strlen($pdfParameters['total_price']) - 3));
    
    $pdf->SetXY(10, $pdf->GetY() + 5);
    $summaVSlovah = num2str(doubleval(str_replace(',', '.', str_replace(' ', '', $pdfParameters['total_price']))));
    $pdf->Write(5, 'Всего наименований ' . count($productsList) . ', на сумму ' . $pdfParameters['total_price']);
    
    $pdf->SetMargins(10, 0);
    
    $pdf->SetXY(10, $pdf->GetY() + 5);
    $pdf->Write(5, $summaVSlovah);
    
    $pdf->SetLineWidth(0.1);
    $pdf->Line(10, $pdf->GetY() + 8, 200, $pdf->GetY() + 8);
    
    $pdf->SetXY(10, $pdf->GetY() + 10);
    $pdf->Write(5, 'Руководитель');
    $pdf->SetXY(10, $pdf->GetY() );
    $pdf->Write(5, 'Руководитель');
    
    $pdf->SetLineWidth(0.1);
    $pdf->Line(45, $pdf->GetY() + 4, 100, $pdf->GetY() + 4);
    $pdf->SetFont('DejaVu', '', 10);
    $pdf->SetXY(73, $pdf->GetY() - 1);
    $pdf->Write(5, 'Антропов А. П.');
    
    $pdf->SetFont('DejaVu', '', 12);
    $pdf->SetXY(110, $pdf->GetY() + 1);
    $pdf->Write(5, 'Бухгалтер');
    $pdf->SetXY(110, $pdf->GetY());
    $pdf->Write(5, 'Бухгалтер');
    
    $pdf->SetLineWidth(0.1);
    $pdf->Line(138, $pdf->GetY() + 4, 200, $pdf->GetY() + 4);
    $pdf->SetFont('DejaVu', '', 10);
    $pdf->SetXY(173, $pdf->GetY() - 1);
    $pdf->Write(5, 'Ермакова В. А.');
    
    $pdf->SetLineWidth(0.1);
    $pdf->Line(10, $pdf->GetY() + 10, 200, $pdf->GetY() + 10);
    
    $pdf->SetFont('DejaVu', '', 12);
    $pdf->SetXY(10, $pdf->GetY() + 12);
    $pdf->Write(5, 'Исполнитель');
    $pdf->SetXY(10, $pdf->GetY() );
    $pdf->Write(5, 'Исполнитель');
    
    $pdf->SetLineWidth(0.1);
    $pdf->Line(45, $pdf->GetY() + 4, 100, $pdf->GetY() + 4);
    
    $pdf->SetFont('DejaVu', '', 10);
    $pdf->SetXY(50, $pdf->GetY() - 1);
    $pdf->Write(5, 'Белова Наталья Викторовна');
    
    $pdf->SetFont('DejaVu', '', 12);
    $pdf->SetXY(10, $pdf->GetY() + 12);
    $pdf->Write(5, 'С условием поставки ознакомлен, с комплектацией согласен');
    $pdf->SetXY(10, $pdf->GetY());
    $pdf->Write(5, 'С условием поставки ознакомлен, с комплектацией согласен');
    
    $pdf->SetLineWidth(0.1);
    $pdf->Line(138, $pdf->GetY() + 4, 200, $pdf->GetY() + 4);
    
    $pdf->Output();
}

