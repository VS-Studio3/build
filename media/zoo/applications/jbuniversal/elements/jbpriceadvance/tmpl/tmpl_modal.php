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
            echo $valarr["totalNoFormat"] . '<br>';
        }
    }
    echo var_dump($variations);
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

            var elementsJSON = JSON.stringify(<?php echo $row['elements']; ?>);
            var variations = JSON.parse(elementsJSON);

            /*
             * 
             * !!! СПИСОК ВАРИАЦИЙ ПО ПРОДУКТУ !!!
             * 
             */
            var variationsObjects = [];

            var issetVarionsInProduct = true;
            //Если существуют вариации
            if ('variations' in variations['888260d0-e4b7-49ca-949a-063f17dedab1']) {
                //Создание объектов вариаций для вывода
                var varioationsInJSONFromTable = variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations'];
                for (var field in varioationsInJSONFromTable) {
                    var varionObject = {variation: varioationsInJSONFromTable[field]['param3'],
                        price: varioationsInJSONFromTable[field]['value'],
                        color: varioationsInJSONFromTable[field]['param2'],
                        city: varioationsInJSONFromTable[field]['param1']
                    }
                    variationsObjects.push(varionObject);
                }
            }
            else {
                //Если продукт без вариаций
                issetVarionsInProduct = false;
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

            var appendVariationsDIVSText = '';
            var summaryVariationsDIVS = '';

            for (var i = 0; i < variationsObjects.length; i++) {
                var currentlyVariationName = '';
                appendVariationsDIVSText = '';
                appendVariationsDIVSText += '<div id="' + variationsObjects[i]['variation'] + '"><span class="item_name">';

                $('.jsCartModal fieldset:eq(2) label').each(function() {
                    if ($(this).find('input').val() == variationsObjects[i]['variation']) {
                        currentlyVariationName = $.trim($(this).text());
                    }
                });

                appendVariationsDIVSText += currentlyVariationName + '</span> <span class="item_price">' + variationsObjects[i]['price'] + '</span><input type="text" class="set_count"><input type="text" class="summary_count"></div>';
                summaryVariationsDIVS += appendVariationsDIVSText;
            }

            /* Поместить в дивы аналогичные названию */
            var copyOfFields = $('.jbprice-selects').clone();
            var copyOfCount = $('.jbprice-count').clone();
            var buttons = $('.jbprice-buttons').clone();

            $('.jsCartModal').empty();
            $('.jsCartModal').prepend(summaryVariationsDIVS);

            $('.set_count').keyup(function() {
                if(!isNaN($(this).val())){
                    /*
                    var parentId = $(this).parent().attr('id');
                    
                    var priceInCurrentVariation = 0;
                    for(var i =0; i < variationsObjects; i++){
                        if(variationsObjects[i]['variation'] == parentId){
                            priceInCurrentVariation = parseFloat(variationsObjects[i]['price']);
                        }
                    }
                    
                    $(this).next('input').val(priceInCurrentVariation * $(this).val());*/
                    $(this).next('input').val($(this).val());
                }
                else{
                    $(this).next('input').empty();
                }
            });
        });
    })(jQuery);
</script>
