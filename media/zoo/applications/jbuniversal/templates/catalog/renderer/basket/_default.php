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


$view = $this->getView();
$this->app->jbassets->basket();
$this->app->jbassets->initJBPrice();
?>
<script type="text/javascript">
    $j(function(){
        $j('#basket').addClass('active');
        $j('#order_form, #pay_for_products').addClass('un_active');

        $j('.order_form, .pay_for_products, .required-info, #yoo-zoo h1').hide();
        $j('#item-submission').prev('h2').hide();

        //Переход на способ доставки
        $j('#go_to_order').click(function(){
            $j('#order_form').addClass('active').removeClass('un_active');
            $j('#basket').removeClass('active').addClass('un_active');

            $j('.basket').hide();
            $j('.order_form').show();
        });

        //Переход на способ оплаты
        $j('#go_to_paying').click(function(){
            var isDataValid = false;

            if($j('.order_form input[type="text"]').eq(0).val().length == 0
                || $j('.order_form input[type="text"]').eq(2).val().length == 0
                || $j('.order_form input[type="text"]').eq(3).val().length == 0){

                alert('Заполните поля, отмеченные *');
            }

            if(isDataValid){
                $j('#pay_for_products').addClass('active').removeClass('un_active');
                $j('#order_form').removeClass('active').addClass('un_active');

                $j('.order_form').hide();
                $j('.pay_for_products').show();
            }
        });
    });
</script>
<div id="basket">Покупки</div>
<div id="order_form">Оформление заказа</div>
<div id="pay_for_products">Оплата</div>

<div class="basket">
    <div class="jbbasket-table jsJBZooBasket">
	<div>
    <thead>
   <!--<div>
        <div>#</div>
        <div><?php echo JText::_('JBZOO_CART_ITEM_SKU'); ?></div>
        <div></div>
        <div><?php echo JText::_('JBZOO_CART_ITEM_NAME'); ?></div>
        <div style="min-width: 70px;"><?php echo JText::_('JBZOO_CART_ITEM_PRICE'); ?></div>
        <div><?php echo JText::_('JBZOO_CART_ITEM_QUANTITY'); ?></div>
        <div><?php echo JText::_('JBZOO_CART_ITEM_SUBTOTAL'); ?></div>
        <div></div>
    </div>-->
    </thead>

    <tbody>
    <?php
    $i = 0;
    $summa = 0;
    $count = 0;

    $currencyConvert = $view->appParams->get('global.jbzoo_cart_config.currency');
    $imageElementId = $view->appParams->get('global.jbzoo_cart_config.element-image');

    foreach ($view->basketItems as $hash => $basketItem) {

        $item = $basketItem['item'];

        $basketItem['price'] = $this->app->jbmoney->convert($basketItem['currency'], $currencyConvert, $basketItem['price']);

        $count += $basketItem['quantity'];

        $subtotal = $basketItem['quantity'] * $basketItem['price'];
        $summa += $subtotal;

        $image = $this->app->jbitem->renderImageFromItem($item, $imageElementId, true);

        echo '<div class="row-' . $hash . ' border_for_products" data-itemId="' . $item->id . '" data-hash="' . $hash . '">';
     //   echo '<td>' . ++$i . '</td>';
       // echo '<td>' . $basketItem['sku'] . '</td>';
        echo '<div class="for_image_product">' . $image . '</div>';
echo '<div class="about_buy_product">';
        echo '<div class="name_product">';
        echo '<a href="' . $this->app->route->item($item) . '" title="' . $item->name . '">' . $item->name . '</a>';

        if (isset($basketItem['priceParams']) && !empty($basketItem['priceParams'])) {
            foreach ($basketItem['priceParams'] as $key => $value) {
                if (!empty($value)) {
                    echo '<div><strong>' . $key . ':</strong> ' . $value . '</div>';
                }
            }
        }

        if (!empty($basketItem['priceDesc'])) {
            echo '<br/><span class="price-description">' . $basketItem['priceDesc'] . '</span>';
        }

        echo '</div>';
 echo '<div class="kolichestvo">';
        if ($basketItem['price']) {
            echo '<div class="jsPricevalue" price="' . $basketItem['price'] . '">'
                . $this->app->jbmoney->toFormat($basketItem['price'], $currencyConvert)
                . ' <span>*стоимость</span></div>';
        } else {
            echo '<div> - </div>';
        }

        echo '<div class="how_march_product"><input type="text" class="jsQuantity input-quantity" value="' . $basketItem['quantity'] . '" /><span>*количество</span></div>';
 echo '</div>';
        if ($basketItem['price']) {
            echo '<div class="jsSubtotal">' . $this->app->jbmoney->toFormat($subtotal, $currencyConvert) . '</div>';
        } else {
            echo '<div> - </div>';
        }

        echo '<div class="deleted_product jbbutton jsDelete" itemid="' . $item->id . '" ></div>';
        echo "</div>\n";
		 echo '</div>';
    }
    ?>
	 <div class="summa_products">
        <div><strong><?php echo JText::_('JBZOO_CART_TOTAL'); ?>:</strong></div>
        <div class="jsTotalCount"><?php echo $count; ?></div>
        <div class="jsTotalPrice"><?php echo $this->app->jbmoney->toFormat($summa, $currencyConvert); ?></div>
        <div class="delete_all">
            <input type="button" class="jbbutton jsDeleteAll" value="<?php echo JText::_('JBZOO_CART_REMOVE_ALL'); ?>"/>
        </div>
    </div>
    </tbody>
</div>
    <tfoot>
   
    </tfoot>
</div>
    <div id="go_to_order">Продолжить</div>
</div>

<script type="text/javascript">
    jQuery(function ($) {
        $('.jbzoo .jsJBZooBasket').JBZooBasket({
            'clearConfirm': "<?php echo JText::_('JBZOO_CART_CLEAR_CONFIRM');?>",
            'quantityUrl' : "<?php echo $this->app->jbrouter->basketQuantity($view->appId);?>",
            'deleteUrl'   : "<?php echo $this->app->jbrouter->basketDelete($view->appId);?>",
            'clearUrl'    : "<?php echo $this->app->jbrouter->basketClear($view->appId);?>"
        });
    });
</script>
