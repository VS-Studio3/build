<?php
/**
 * JBZoo is universal CCK based Joomla! CMS and YooTheme Zoo component
 * @category   JBZoo
 * @author     smet.denis <admin@joomla-book.ru>
 * @copyright  Copyright (c) 2009-2012, Joomla-book.ru
 * @license    http://joomla-book.ru/info/disclaimer
 * @link       http://joomla-book.ru/projects/jbzoo JBZoo project page
 */
defined('_JEXEC') or die('Restricted access');


$align = $this->app->jbitem->getMediaAlign($item, $layout);

$host = 'localhost';
$user = 'root';
$pasword = '';
$dbName = 'build';

$connection = new mysqli($host, $user, $pasword, $dbName);
$connection->query("SET NAMES 'utf8';");
$query = "SELECT elements FROM bzrnp_zoo_item WHERE id = '" . $item->id . "'";

$result = $connection->query($query);
$row = $result->fetch_assoc();

$countType = substr($row['elements'], 0, strpos($row['elements'], '888260d0-e4b7-49ca-949a-063f17dedab1'));
$countType = substr($countType, strpos($countType, 'value'));
$countType = substr($countType, 9);
$countType = substr($countType, 0, strpos($countType, '}'));
$countType = preg_replace("/\\\\u([a-f0-9]{4})/e", "iconv('UCS-4LE','UTF-8',pack('V', hexdec('U$1')))", json_encode($countType));
$countType = str_replace('\"\n\t\t"', '', $countType);
$countType = str_replace('"', '', $countType);
$countType = str_replace('\\', '', $countType);
$result->free();
$connection->close();
?>

<div class="item price isset_<?php
if ($this->checkPosition('isset')) {
    echo 'true';
} else {
    echo 'false';
}
?>" item="<?php echo $item->id; ?>">


        <?php if ($this->checkPosition('image')) : ?>
        <div class="span3 item-image align-<?php echo $align; ?>">
        <?php echo $this->renderPosition('image'); ?>
        </div>
    <?php endif; ?>

    <?php if ($this->checkPosition('title')) : ?>
        <h3 class="item-title"><?php echo $this->renderPosition('title'); ?></h3>
    <?php endif; ?>
    <span class="isset_class">Есть на складе</span>
    <?php if ($this->checkPosition('price')) : ?>
        <div class="product-buttons span12">
            <?php echo $this->renderPosition('price'); ?>
        </div>
    <?php endif; ?>
        


    <?php if (!$this->checkPosition('isset')) : ?>
        <a rel="nofollow" href="#zayavka" class="show_zayavka" title="Добавить в корзину">Купить</a>
<?php endif; ?>
</div>

<script type="text/javascript">
    $j(function() {
        var elementsJSON = JSON.stringify(<?php echo $row['elements']; ?>);
        var variations = JSON.parse(elementsJSON);

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

        var currentUserCity = getCookie('city');
        var translitCokieValueOfCity = null;

        var variationsObjects = [];
        var count = 0;
        for (var k in variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations'])
            if (variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations'].hasOwnProperty(k))
            {
                ++count;
            }
        if (count != 0) {
            $j('.item.price[item="<?php echo $item->id; ?>"] .jbprice-selects select:eq(0) option').each(function() {
                if ($j.trim($j(this).text()).indexOf(currentUserCity) != -1) {
                    translitCokieValueOfCity = $j(this).val();
                }
            });

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

            var minPrice = parseFloat(variationsObjects[0]['price']);
            for (var i = 0; i < variationsObjects.length; i++) {
                if (parseFloat(variationsObjects[i]['price']) < minPrice) {
                    minPrice = parseFloat(variationsObjects[i]['price']);
                }
            }
            $j('.item.price[item="<?php echo $item->id; ?>"] .prices_list').html('от ' + minPrice + ' р./<?php echo $countType; ?>');
        }
    });
</script>



