<?php
/**
 * JBZoo App is universal Joomla CCK, application for YooTheme Zoo component
 *
 * @package     jbzoo
 * @version     2.x Pro
 * @author      JBZoo App http://jbzoo.com
 * @copyright   Copyright (C) JBZoo.com,  All rights reserved.
 * @license     http://jbzoo.com/license-pro.php JBZoo Licence
 * @coder       Denis Smetannikov <denis@jbzoo.com>
 */
// no direct access
defined('_JEXEC') or die('Restricted access');


$uniqClass = 'jsJBPriceAdvance-' . $this->identifier . '-' . $this->getItem()->id;
$iniqId = uniqid('jbprice-adv-');
?>

<!-- <p><strong><?php echo $this->getItem()->name; ?></strong></p> -->
<div class="jsJBPriceAdvance jbprice-advance <?php echo $uniqClass; ?>" id="<?php echo $iniqId; ?>">
    <?php echo $skuTmpl; ?>
    <?php echo $balanceTmpl; ?>

    <?php
    foreach ($prices as $value) {

        foreach ($value["prices"] as $valarr) {
            //array_push($min_price, (int)$valarr["totalNoFormat"]);

        }
    }
    ?>



    <?php echo $pricesTmpl; ?>
    <?php echo $countTmpl; ?>
    <?php echo $buttonsTmpl; ?>
</div>

<script type="text/javascript">
(function ($) {
    $(function () {
        <?php
        function jsonRemoveUnicodeSequences($struct) {
                   return preg_replace("/\\\\u([a-f0-9]{4})/e", "iconv('UCS-4LE','UTF-8',pack('V', hexdec('U$1')))", json_encode($struct));
        }
        //Берем из БД список вариантов в формате json
        $itemId = $this->getItem()->id;
        $host = 'localhost';
        $user = 'root';
        $pasword = '';
        $dbName = 'build';

        $connection = new mysqli($host, $user, $pasword, $dbName);
        $connection->query("SET NAMES 'utf8';");
        $query = "SELECT name,elements FROM bzrnp_zoo_item WHERE id = '" . $itemId . "'";

        $result = $connection->query($query);

        $row = $result->fetch_assoc();

        $countType = substr($row['elements'], 0, strpos($row['elements'], '888260d0-e4b7-49ca-949a-063f17dedab1'));
        $countType = substr($countType, strpos($countType, 'value'));
        $countType = substr($countType, 9);
        $countType = substr($countType, 0, strpos($countType, '}'));
        $countType = jsonRemoveUnicodeSequences($countType);
        $countType =  str_replace('\"\n\t\t"', '', $countType);
        $countType =  str_replace('"', '', $countType);
        $countType =  str_replace('\\', '', $countType);
        ?>

        function getCookie(name) {
            var cookie = " " + document.cookie;
            var search = " " + name + "=";
            var setStr = null;
            var offset = 0;
            var end = 0;
            if (cookie.length > 0) {
                offset = cookie.indexOf(search);
                if (offset != -1) {
                    offset += search.length;
                    end = cookie.indexOf(";", offset)
                    if (end == -1) {
                        end = cookie.length;
                    }
                    setStr = unescape(cookie.substring(offset, end));
                }
            }
            return(setStr);
        }

        $('#<?php echo $iniqId; ?>').JBZooPriceAdvance({
            'params': <?php echo json_encode($interfaceParams); ?>,
            'prices': <?php echo json_encode($prices); ?>,
            'mainHash': "<?php echo $this->_getHash(); ?>",
            'itemId': <?php echo $this->getItem()->id; ?>,
            'identifier': "<?php echo $this->identifier; ?>",
            'addToCartUrl': "<?php echo $addToCartUrl; ?>",
            'removeFromCartUrl': "<?php echo $removeFromCartUrl; ?>",
            'modalUrl': "<?php echo $modalUrl; ?>",
            'basketUrl': "<?php echo $basketUrl; ?>"
        });

        $('.jsTotal').hide();

        var elementsJSON = JSON.stringify(<?php echo $row['elements']; ?>);
        var variations = JSON.parse(elementsJSON);

        //СПИСОК ВАРИАЦИЙ ПО ПРОДУКТУ
        var variationsObjects = [];
        //Если существуют вариации
        var count = 0;
        for (var k in variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations']) if (variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations'].hasOwnProperty(k))
        {
            ++count;
        }
        if (count != 0) {
            var currentUserCity = getCookie('city');
            var translitCokieValueOfCity = null;

            $('.jsCartModal fieldset:eq(0) label').each(function () {
                if ($.trim($(this).text()).indexOf(currentUserCity) != -1) {
                    translitCokieValueOfCity = $(this).find('input').val();
                }
            });

            //Если вариаций по этому городу нету
            if (translitCokieValueOfCity == null) {
            }
            else {
                //Создание объектов вариаций для вывода по городу
                var varioationsInJSONFromTable = variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations'];
                for (var field in varioationsInJSONFromTable) {
                    if (varioationsInJSONFromTable[field]['param1'] == translitCokieValueOfCity || varioationsInJSONFromTable[field]['param1'] == '') {
                        var varionObject = {variation: varioationsInJSONFromTable[field]['param3'],
                            price: varioationsInJSONFromTable[field]['value'],
                            color: varioationsInJSONFromTable[field]['param2'],
                            city: varioationsInJSONFromTable[field]['param1'],
                            id: varioationsInJSONFromTable[field]['param3'] + '|' + varioationsInJSONFromTable[field]['value']
                        }
                        variationsObjects.push(varionObject);
                    }
                }

                $('.prices_list').hide();

                var appendVariationsDIVSText = '';
                var summaryVariationsDIVS = '';

                for (var i = 0; i < variationsObjects.length; i++) {
                    var currentlyVariationName = '';
                    appendVariationsDIVSText = '';
                    appendVariationsDIVSText += '<div id="' + variationsObjects[i]['variation'] + '" class="variation_object" title="' + variationsObjects[i]['id'] + '"><span class="item_name">';

                    $('.jsCartModal fieldset:eq(2) label').each(function () {
                        if ($(this).find('input').val() == variationsObjects[i]['variation']) {
                            currentlyVariationName = $.trim($(this).text());
                        }
                    });
                    appendVariationsDIVSText += currentlyVariationName;

                    $('.jsCartModal fieldset:eq(1) label').each(function () {
                        if ($(this).find('input').val() == variationsObjects[i]['color']) {
                            appendVariationsDIVSText += ' (' + $.trim($(this).text()) + ')';
                        }
                    });

                    appendVariationsDIVSText += '</span> <span class="item_price">' + variationsObjects[i]['price'] +
                     ' ' + 'р./<?php echo $countType; ?>' +  '</span><span ' +
                        'class="relative"><span class="how">*количество</span><input ' +
                        'type="text"' +
                        ' ' +
                        'class="set_count"></span><span class="relative"><span class="how">*стоимость</span><input' +
                        ' ' +
                        'type="text" ' +
                    'class="summary_count" readonly></span><button class="buy">Купить</button></div>';
                    summaryVariationsDIVS += appendVariationsDIVSText;
                }

                summaryVariationsDIVS += '<div class="for_itogo"><div class="itogo"><span>Итого:</span><input ' +
                    'type="text" ' +
                    'class="total_price"></div>';

                $('.jsCartModal').prepend(summaryVariationsDIVS + '<div class="for_but"><button class="get_basket">Оформить заказ</button><button ' +
                    'class="close_iframe">Продолжить покупки</button></div>');

                //Вывод суммарной цены по вариации
                $('.set_count').keyup(function () {
                    if (!isNaN($(this).val())) {

                        var parentTitle = $(this).parent().parent().attr('title');

                        var priceInCurrentVariation = 0;
                        for (var i = 0; i < variationsObjects.length; i++) {
                            if (variationsObjects[i]['id'] == parentTitle) {
                                priceInCurrentVariation = parseFloat(variationsObjects[i]['price']);
                            }
                        }

                        $(this).parent().next('span').find('input').val(priceInCurrentVariation * parseFloat($(this).val()));
                        var total_price = 0;
                        $('.variation_object .summary_count').each(function () {
                            if ($(this).val().length > 0 && $(this).val() != 'NaN') {
                                total_price += parseFloat($(this).val());
                            }
                        });
                        $('.total_price').val(total_price);
                    }
                    else {
                        $(this).parent().next('span').find('input').empty();
                    }
                });

                $('.jbprice-selects, .jbprice-count, .jbprice-buttons, .jbprice-price').hide();

                $('.buy').click(function () {
                    $('.variation_object.active').each(function () {
                        var count = $(this).find('.set_count').val();
                        if ($.isNumeric(count) && parseFloat(count) > 0) {
                            var variationNamaValue = $(this).attr('id');
                            
                            $('.jsCartModal fieldset:eq(2) label').each(function () {
                                if ($(this).find('input').val() == variationNamaValue) {
                                    $(this).find('input').prop('checked', true);
                                }
                            });

                            var colorValue = '';
                            var cityValue = '';
                            for (var i = 0; i < variationsObjects.length; i++) {
                                if (variationsObjects[i]['id'] == $(this).attr('title')) {
                                    colorValue = variationsObjects[i]['color'];
                                    cityValue = variationsObjects[i]['city'];
                                }
                            }

                            $('.jsCartModal fieldset:eq(1) label').each(function () {
                                if ($(this).find('input').val() == colorValue) {
                                    $(this).find('input').prop('checked', true);
                                }
                            });

                            $('.jsCartModal fieldset:eq(0) label').each(function () {
                                if ($(this).find('input').val() == cityValue) {
                                    $(this).find('input').prop('checked', true);
                                }
                            });

                            $('.jsCount').val(count);
                            $('a[href="#add-to-cart"]').trigger('click');
                            var productNameVariation = $('.variation_object.active .item_name').text();
                            alert('"<?php echo $this->getItem()->name; ?>"' + ' ' + productNameVariation + ' добавлен в корзину');
                        }
                    });
                });

                $('.get_basket').click(function () {
                    window.top.location.href = "index.php/2014-06-27-07-33-20?controller=basket&task=index&app_id=2&nocache=1081762493";
                });

                $('.close_iframe').click(function () {
                    parent.jQuery.fancybox.close();
                });

                $('.variation_object').each(function () {
                    $(this).addClass('unactive');
                    $(this).find('.set_count').attr('disabled', true);
                });

                $('.variation_object:eq(0)').removeClass('unactive').addClass('active');
                $('.variation_object:eq(0)').find('.set_count').attr('disabled', false);

                $('.variation_object').click(function () {
                    $('.variation_object').each(function () {
                        $(this).removeClass('active').addClass('unactive');
                        $(this).find('.set_count').attr('disabled', true);
                    });

                    $(this).removeClass('unactive').addClass('active');
                    $(this).find('.set_count').attr('disabled', false);
                });
            }
        }
        else {
            //Если продукт без вариаций
            $('.prices_list').after('<span class="relative"><span class="how">*количество</span><input type="text" class="count"></span><span ' +
                'class="relative"><span class="how">*стоимость</span><input ' +
                'type="text" ' +
                'class="summary"></span><div ' +
                'class="for_but" ' +
                '><button' +
                ' class="buy">Добавить в корзину</button><button class="to_basket">Оформить заказ</button><button ' +
                'class="close_iframe">Продолжить покупки</button></div>');
            $('.count').keyup(function () {
                if (!isNaN($(this).val())) {
                    var price = parseFloat($('.prices_list').text().substr(0, $('.prices_list').text().indexOf('р')));
                    console.log(price)
                    $('.summary').val(price * parseInt($(this).val()));
                }
                else {
                    $('.summary').val('');
                }
            });

            $('.to_basket').click(function () {
                window.top.location.href = "index.php/2014-06-27-07-33-20?controller=basket&task=index&app_id=2&nocache=1081762493";
            });

            $('.close_iframe').click(function () {
                parent.jQuery.fancybox.close();
            });

            $('.buy').click(function () {
                if (!isNaN($('.count').val()) && $('.count').val().length > 0) {
                    $('.jsCount').val($('.count').val());
                    $('a[href="#add-to-cart"]').trigger('click');
                    alert('Товар "<?php echo $row['name']; ?>" добавлен в корзину')
                }
            });
        }
    });
})(jQuery);
</script>
<style>
    .jbcart-modal-body {
        margin: 0;
        padding: 0;
    }
    .jbcart-modal-body .hit-icon-simple{
        display: none !important;
    }
    .item_name {
        width: 195px;
        margin-right: 10px;
    }
    .prices_list{
        width: 328px;
        margin-right: 10px;
        white-space: nowrap;
    }
    .item_price    {
        width: 115px;
        margin-right: 10px;
        white-space: nowrap;
    }
    .how{
        position: absolute;
        font-size: 12px;
        line-height: 18px;
        font-family: 'Arial', 'sans-serif';
        color: #000000;
        bottom: -28px;
    }
    .relative{
        position: relative;
    }
    .prices_list{
        height: 100%;
        display: inline-block;
        vertical-align: middle;
        font-size: 18px;
        color: #000000;
    }
    .item_name,
    .item_price{
        height: 100%;
        display: table-cell;
        vertical-align: middle;
        font-size: 18px !important;
        color: #000000;
    }
    .jbzoo .jbprice-advance .jsCount{
        margin-right: 0px!important;
    }
    .jbzoo .variation_object .set_count,
    .jbzoo .jbprice-advance .count,
    .jbzoo .jbprice-advance .count:hover,
    .jbzoo .jbprice-advance .jsCount{
        width: 64px;
        min-width: 50px !important;
        height: 42px !important;
        border-radius: 0px;
        display: table-cell;
        vertical-align: middle;
        position: relative;
        margin-bottom: 0px;
        color: #000000;
        text-align: center;
        margin-right: 10px;
        border-color: #535151;
        font-size: 18px;
        margin-bottom: 15px;
    }
    .for_but{
        position: absolute;
        bottom: 15px;
        width: 100%;
    }
    .jbprice-adv-inited{
        padding: 10px 0px;
    }
    .jbprice-count,
    .jbprice-buttons{
        display: none;
    }
    .get_basket{
        float: right;
    }
    .jbprice-count td{
        font-size: 17px;
        color: #000000;
    }
    .buy{
        background-image: url("<?php echo JURI::base();
        ?>templates/krovlya/images/price.png");
        width: 38px;
        background-position: 0px -268px;
        background-repeat:  no-repeat;
        height: 38px;
        border: none;
        background-color: #f9f9f9;
        text-indent: -999999px !important;
        overflow: hidden;
        position: relative;
        top: -7px;
        text-align: left;
    }
    .buy:hover{
        cursor: pointer;
    }
    .jbzoo .variation_object .summary_count,
    .jbzoo .jbprice-advance .summary{
        width: 100px;
        min-width: 50px !important;
        height: 42px !important;
        display: table-cell;
        vertical-align: middle;
        border-radius: 0px !important;
        font-size: 18px;
        color: #000000;
        text-align: center;
        border-color: #535151 !important;
        margin-bottom: 15px;
        margin-right: 10px;
    }
    .variation_object.unactive input[readonly]{
        background: rgb(235, 235, 228);
    }
    .variation_object.unactive {
        border: 2px solid #f9f9f9;
        border-radius: 5px;
        vertical-align: middle;
        padding: 10px;
        display: inline-table;
        width: 96%;
        margin-bottom: 10px;
        opacity: 0.5;
    }

    .variation_object.active {
        border: 2px solid #aaaaaa;
        border-radius: 5px;
        vertical-align: middle;
        padding: 10px;
        display: inline-table;
        width: 96%;
        margin-bottom: 10px;
        transition: 0.3s;
    }
    .jsCartModal {
        min-height: 250px;
        font-family: 'Arial', 'sans-serif';
        padding: 10px 0px 55px 0px;
        position: relative;
    }

    .itogo {
        text-align: right;
        font-size: 20px;
        color: #000000;
        font-family: 'Arial', 'sans-serif';
        margin-bottom: 20px;
    }

    .itogo span {
        height: 36px;
        padding-top: 10px;
        display: inline-block;
    }

    .itogo input {
        width: 134px;
        height: 47px !important;
        border-radius: 0px !important;
        font-size: 25px;
        color: #000000 !important;
        text-align: center;
        margin-right: 10px !important;
        margin-left: 20px !important;
        border-color: #535151 !important;

    }

    #buy_submit,
    .get_basket,
    .close_iframe,
    .to_basket,
    .jsAddToCart.jbzoo-button.green,
    .jsAddToCart.jbzoo-button.green:hover   {
        background-color: #302767 !important;
        border-radius: 5px;
        position: relative;
        overflow: hidden;
        background: none;
        font-size: 15px;
        line-height: 34px;
        color: #ffffff;
        text-transform: uppercase;
        font-weight: bold;
        border: none;
        padding: 2px 9px;
    }
    #buy_submit:before,
    .get_basket:before,
    .close_iframe:before,
    .to_basket:before,
    .jsAddToCart.jbzoo-button.green:before{
        position: absolute;
        content: '';
        width: 102%;
        height: 51px;
        left: -2px;
        top: -18px;
        /* -webkit-box-shadow: 0 15px 10px rgba(0, 0, 0, 0.7); */
        -moz-box-shadow: 0 15px 10px rgba(0, 0, 0, 0.7);
        box-shadow: inset 0px -3px 27px rgba(253, 253, 253, 0.7);
        border-radius: 50%;
    }
</style>
