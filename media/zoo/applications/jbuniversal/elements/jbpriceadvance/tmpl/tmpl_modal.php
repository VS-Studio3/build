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
    (function($) {
        $(function() {
<?php
//Берем из БД список вариантов в формате json
$itemId = $this->getItem()->id;
$host = 'localhost';
$user = 'root';
$pasword = '';
$dbName = 'build';

$connection = new mysqli($host, $user, $pasword, $dbName);
$query = "SELECT elements FROM bzrnp_zoo_item WHERE id = '" . $itemId . "'";

$result = $connection->query($query);

$row = $result->fetch_assoc();
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

            /*
             * 
             * !!! СПИСОК ВАРИАЦИЙ ПО ПРОДУКТУ !!!
             * 
             */
            var variationsObjects = [];
            //Если существуют вариации
            if ('variations' in variations['888260d0-e4b7-49ca-949a-063f17dedab1']) {
                var currentUserCity = getCookie('city');
                var translitCokieValueOfCity = null;

                $('.jsCartModal fieldset:eq(0) label').each(function() {
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
                                city: varioationsInJSONFromTable[field]['param1']
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
                        appendVariationsDIVSText += '<div id="' + variationsObjects[i]['variation'] + '" class="variation_object"><span class="item_name">';

                        $('.jsCartModal fieldset:eq(2) label').each(function() {
                            if ($(this).find('input').val() == variationsObjects[i]['variation']) {
                                currentlyVariationName = $.trim($(this).text());
                            }
                        });
                        appendVariationsDIVSText += currentlyVariationName;

                        $('.jsCartModal fieldset:eq(1) label').each(function() {
                            if ($(this).find('input').val() == variationsObjects[i]['color']) {
                                appendVariationsDIVSText += ' (' + $.trim($(this).text()) + ')';
                            }
                        });

                        appendVariationsDIVSText += '</span> <span class="item_price">' + variationsObjects[i]['price'] + ' р.</span><input type="text" class="set_count"><input type="text" class="summary_count" readonly></div>';
                        summaryVariationsDIVS += appendVariationsDIVSText;
                    }

                    $('.jsCartModal').prepend(summaryVariationsDIVS + '<button id="buy_submit">Купить</button');

                    //Вывод суммарной цены по вариации
                    $('.set_count').keyup(function() {
                        if (!isNaN($(this).val())) {

                            var parentId = $(this).parent().attr('id');

                            var priceInCurrentVariation = 0;
                            for (var i = 0; i < variationsObjects.length; i++) {
                                if (variationsObjects[i]['variation'] == parentId.toString()) {
                                    priceInCurrentVariation = parseFloat(variationsObjects[i]['price']);
                                }
                            }

                            $(this).next('input').val(priceInCurrentVariation * parseFloat($(this).val()));
                        }
                        else {
                            $(this).next('input').empty();
                        }
                    });

                    $('.jbprice-selects, .jbprice-count, .jbprice-buttons').hide();

                    $('#buy_submit').click(function() {
                        var isAjax = false;
                        $('.variation_object.active').each(function() {
                            while (isAjax != false) {
                            }
                            var count = $(this).find('.set_count').val();
                            if ($.isNumeric(count) && parseFloat(count) > 0) {
                                var variationNamaValue = $(this).find('.set_count').parent().attr('id');
                                $('.jsCartModal fieldset:eq(2) label').each(function() {
                                    if ($(this).find('input').val() == variationNamaValue) {
                                        $(this).find('input').prop('checked', true);
                                    }
                                });

                                var colorValue = '';
                                var cityValue = '';
                                for (var i = 0; i < variationsObjects.length; i++) {
                                    if (variationsObjects[i]['variation'] == variationNamaValue) {
                                        colorValue = variationsObjects[i]['color'];
                                        cityValue = variationsObjects[i]['city'];
                                    }
                                }

                                $('.jsCartModal fieldset:eq(1) label').each(function() {
                                    if ($(this).find('input').val() == colorValue) {
                                        $(this).find('input').prop('checked', true);
                                    }
                                });

                                $('.jsCartModal fieldset:eq(0) label').each(function() {
                                    if ($(this).find('input').val() == cityValue) {
                                        $(this).find('input').prop('checked', true);
                                    }
                                });

                                $('.jsCount').val(count);
                                isAjax = true;
                                $.when($('a[href="#add-to-cart"]').trigger('click')).done(function() {
                                    isAjax = false;
                                });
                            }
                        });
                    });
                    
                    $('.variation_object').each(function(){
                        $(this).addClass('unactive');
                    });
                    
                    $('.variation_object:eq(0)').removeClass('unactive').addClass('active');
                    
                    $('.variation_object .set_count').click(function(){
                        $('.variation_object').each(function(){
                            $(this).removeClass('active').addClass('unactive');
                        });
                        
                        $(this).parent().removeClass('unactive').addClass('active');
                    });
                }
            }
            else {
                //Если продукт без вариаций

            }
        });
    })(jQuery);
</script>
