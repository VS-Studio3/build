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
$tabsId = uniqid('jbzoo-tabs-');

$elements = $item->elements;
?>
<script type="text/javascript">
    $j(function(){
        
});
</script>
<script type="text/javascript">
    $j(function() {
        $j('a[href="#less_price_wrapper"]').click(function(){
            $j('input[value="Наименования товара"]').val($j('h1').text());
        });
        $j('a[href="#less_price_wrapper"]').fancybox();
        $j('.little_img img').attr({'width': 50, 'height': 50});
        $j('.little_img .preview_img').click(function() {
            $j('.prev_img_container').show();
            $j('.img_sourse').html($j('.first_img img').clone().attr({'width': 500, 'height': 500}));
        });
        $j('.close_img').click(function() {
            $j('.prev_img_container').hide();
        });
    });
</script>
<div class="prev_img_container">
    <div class="close_img">Закрыть</div>
    <div class="img_sourse"></div>
</div>
<div id="full_product_description" class="isset_<?php
if ($this->checkPosition('isset')) {
    echo 'true';
} else {
    echo 'false';
}
?>">
    <?php if ($this->checkPosition('image')) : ?>
        <div class="little_img">
            <?php echo $this->renderPosition('image'); ?>
            <div class="preview_img">Preview</div>
        </div>
        <div class="first_img item-image align-<?php echo $align; ?>">
            <?php echo $this->renderPosition('image'); ?>
        </div>
    <?php endif; ?>

    <?php echo $this->renderPosition('title', array('style' => 'jbtitle')); ?>
    <div class="clear clr"></div>

    <div class="rborder item-body">
        <span class="isset_class">Есть на складе</span>
        <div class="items_price_less">
        <div class="item-current-price"></div>
        <div class="less-price"><a href="#less_price_wrapper">Нашли дешевле? Поторгуемся!</a></div>
        </div>
        <div class="current_city_price_wrapper">* Цена со склада в</div>
        <a href="#" id="select-city">Выбрать город</a>
        <a href="#zayavka" class="btn btn_zayavka">Отправить заявку</a>

        <?php if ($this->checkPosition('price')) : ?>
            <div class="item-price-position">
                <?php echo $this->renderPosition('price'); ?>
            </div>
        <?php endif; ?>
        

        
        <?php if (!$this->checkPosition('isset')) : ?>
        <a rel="nofollow" href="#zayavka" class="show_zayavka" title="Добавить в корзину">Купить</a>
<?php endif; ?>

        <div class="color_cart">Карта цветов</div>
        <div class="item-color-position"></div>
        
        <?php if ($this->checkPosition('possible_colors')) : ?>
            <div class="possible-colors-position">
                <?php echo $this->renderPosition('possible_colors'); ?>
            </div>
        <?php endif; ?>
    </div>

    <?php if ($this->checkPosition('description')) : ?>
        <div class="description">
            <div>Описание и технические характеристики:</div>
            <div class="text_about">
                <?php echo $this->renderPosition('description'); ?>
            </div>
        </div>
    <?php endif; ?>

    <?php if ($this->checkPosition('related')) : ?>
        <div class="others">
            <h3>С этим товаром покупают:</h3>
            <?php echo $this->renderPosition('related'); ?>
        </div>
    <?php endif; ?>

</div>

<script type="text/javascript">
    $j(function(){
        $j('.possible-colors-position a').attr('target', '_blank');
        $j('.prices_list').remove();
        $j('#select-city').click(function(){
            var listOfCities = $j('#list_of_cities_div').clone().wrap('<div id="list_of_cities_div">');
            $j('#modal_cities').show();
        });
        /*Вывод цены по вариациям*/
        var elementsJSON = JSON.stringify(<?php echo $elements; ?>);
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
            
        $j('.current_city_price_wrapper').html($j('.current_city_price_wrapper').html() + ' ' + getCookie('city'));
        
        var currentUserCity = getCookie('city');
        var translitCokieValueOfCity = null;
        
        var variationsObjects = [];
        var count = 0;
        for (var k in variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations']) if (variations['888260d0-e4b7-49ca-949a-063f17dedab1']['variations'].hasOwnProperty(k))
        {
            ++count;
        }
        if (count != 0){
            $j('.jbprice-selects select:eq(0) option').each(function() {
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
            for(var i = 0; i < variationsObjects.length; i++){
                if(parseFloat(variationsObjects[i]['price']) < minPrice){
                    minPrice = parseFloat(variationsObjects[i]['price']);
                }
            }
            $j('.item-current-price').html('от ' + minPrice + ' р.');
        }
        else{
            //Если вариаций нет
            $j('.item-current-price').html(variations['888260d0-e4b7-49ca-949a-063f17dedab1']['basic']['value'] + ' р.');
            $j('.color_cart').hide();
        }
        
        var colorsList = {
            '1014' : '#d0c66d', '1015' : '#e3d99b', '3003' : '#610709',
            '3005' : '#350b0f', '3009' : '#491915', '3011' : '#5b0c11',
            '5002' : '#10246d', '5005' : '#0f3283', '5021' : '#22546b',
            '6002' : '#214c14', '6005' : '#092b1a', '7004' : '#7b8386',
            '7005' : '#4b564e', '7024' : '#2e3339', '8017' : '#2b1b0c',
            '9002' : '#dad9c4', '9003' : '#f6f5f3', '9006' : '#f6f5f3'
        }
        
        $j('.jbprice-selects select:eq(1) option').each(function(number){
            if(number != 0){
                $j('.item-color-position').append('<div class="color" style="background-color:' + colorsList[$j(this).val()] + '"></div>');
            }
        });
    });
</script>


