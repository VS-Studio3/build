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
    $j(function() {
        $j.datepicker.regional['ru'] = {
            closeText: 'Закрыть',
            prevText: '&#x3c;Пред',
            nextText: 'След&#x3e;',
            currentText: 'Сегодня',
            monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
                'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
            monthNamesShort: ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
                'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
            dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
            dayNamesShort: ['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
            dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
            weekHeader: 'Не',
            dateFormat: 'dd.mm.yy',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''};
        $j.datepicker.setDefaults($j.datepicker.regional['ru']);

        $j('#basket').addClass('active');
        $j('#order_form, #pay_for_products').addClass('un_active');

        $j('.order_form, .pay_for_products, .required-info, #yoo-zoo h1, #joomla_template_dostavka').hide();
        $j('#item-submission').prev('h2').hide();

        $j("#joomla_template_samovuvoz input:radio").eq(0).prop("checked", true);
        $j("#joomla_template_dostavka input:radio").eq(0).prop("checked", true);

        $j("#joomla_template_dostavka input:text:last").datepicker({
            onSelect: function(dateText, inst) {
                $j('#current_date').html(inst.selectedDay);
            }
        });

        var isDostavkaKureromChecked = false;

        //Самовывоз или доставка курьером
        $j('#joomla_template_samovuvoz input:radio').click(function() {
            if ($j(this).val() == 'dostavka-kurerom') {
                $j('#joomla_template_dostavka').slideDown(500);
                isDostavkaKureromChecked = true;
            }
            else {
                $j('#joomla_template_dostavka').slideUp(500);
                isDostavkaKureromChecked = false;
            }
        });

        //Переход на способ доставки
        $j('#go_to_order').click(function() {
            $j('#order_form').addClass('active').removeClass('un_active');
            $j('#basket').removeClass('active').addClass('un_active');

            $j('.basket').hide();
            $j('.order_form').show();
        });

        //Переход на способ оплаты
        $j('#go_to_paying').click(function() {
            var isDataValid = true;

            if ($j('.order_form input:text').eq(0).val().length == 0
                    || $j('.order_form input:text').eq(2).val().length == 0
                    || $j('.order_form input:text').eq(3).val().length == 0) {
                isDataValid = false;
            }

            if (isDostavkaKureromChecked) {
                $j('#joomla_template_dostavka input:text').each(function() {
                    if ($j(this).val().length == 0) {
                        isDataValid = false;
                    }
                });
            }

            if (isDataValid) {
                $j('#pay_for_products').addClass('active').removeClass('un_active');
                $j('#order_form').removeClass('active').addClass('un_active');

                $j('.order_form').hide();
                $j('.pay_for_products').show();
            }
            else
                alert('Заполните поля, отмеченные *');
        });


    });
</script>
<div id="basket">Покупки</div>
<div id="order_form">Оформление заказа</div>
<div id="pay_for_products">Оплата</div>

<div class="basket">
<<<<<<< HEAD
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
=======
    <table class="jbbasket-table jsJBZooBasket">
        <thead>
            <tr>
                <th>#</th>
                <th><?php echo JText::_('JBZOO_CART_ITEM_SKU'); ?></th>
                <th></th>
                <th><?php echo JText::_('JBZOO_CART_ITEM_NAME'); ?></th>
                <th style="min-width: 70px;"><?php echo JText::_('JBZOO_CART_ITEM_PRICE'); ?></th>
                <th><?php echo JText::_('JBZOO_CART_ITEM_QUANTITY'); ?></th>
                <th><?php echo JText::_('JBZOO_CART_ITEM_SUBTOTAL'); ?></th>
                <th></th>
            </tr>
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

                echo '<tr class="row-' . $hash . '" data-itemId="' . $item->id . '" data-hash="' . $hash . '">';
                echo '<td>' . ++$i . '</td>';
                echo '<td>' . $basketItem['sku'] . '</td>';
                echo '<td>' . $image . '</td>';

                echo '<td>';
                echo '<a href="' . $this->app->route->item($item) . '" title="' . $item->name . '">' . $item->name . '</a>';

                if (isset($basketItem['priceParams']) && !empty($basketItem['priceParams'])) {
                    foreach ($basketItem['priceParams'] as $key => $value) {
                        if (!empty($value)) {
                            echo '<div><strong>' . $key . ':</strong> ' . $value . '</div>';
                        }
                    }
                }
>>>>>>> 777f224dbdb430f14792a0087a7f436cbccf7009

                if (!empty($basketItem['priceDesc'])) {
                    echo '<br/><span class="price-description">' . $basketItem['priceDesc'] . '</span>';
                }

                echo '</td>';

<<<<<<< HEAD
        echo '<div class="row-' . $hash . ' border_for_products" data-itemId="' . $item->id . '" data-hash="' . $hash . '">';
     //   echo '<td>' . ++$i . '</td>';
       // echo '<td>' . $basketItem['sku'] . '</td>';
        echo '<div class="for_image_product">' . $image . '</div>';
echo '<div class="about_buy_product">';
        echo '<div class="name_product">';
        echo '<a href="' . $this->app->route->item($item) . '" title="' . $item->name . '">' . $item->name . '</a>';
=======
                if ($basketItem['price']) {
                    echo '<td class="jsPricevalue" price="' . $basketItem['price'] . '">'
                    . $this->app->jbmoney->toFormat($basketItem['price'], $currencyConvert)
                    . ' </td>';
                } else {
                    echo '<td> - </td>';
                }

                echo '<td><input type="text" class="jsQuantity input-quantity" value="' . $basketItem['quantity'] . '" /></td>';
>>>>>>> 777f224dbdb430f14792a0087a7f436cbccf7009

                if ($basketItem['price']) {
                    echo '<td class="jsSubtotal">' . $this->app->jbmoney->toFormat($subtotal, $currencyConvert) . '</td>';
                } else {
                    echo '<td> - </td>';
                }

                echo '<td><input type="button" class="jbbutton jsDelete" itemid="' . $item->id . '" value="' . JText::_('JBZOO_CART_DELETE') . '" /></td>';
                echo "</tr>\n";
            }
<<<<<<< HEAD
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
=======
            ?>
        </tbody>

        <tfoot>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td><strong><?php echo JText::_('JBZOO_CART_TOTAL'); ?>:</strong></td>
                <td class="jsTotalCount"><?php echo $count; ?></td>
                <td class="jsTotalPrice"><?php echo $this->app->jbmoney->toFormat($summa, $currencyConvert); ?></td>
                <td>
                    <input type="button" class="jbbutton jsDeleteAll" value="<?php echo JText::_('JBZOO_CART_REMOVE_ALL'); ?>"/>
                </td>
            </tr>
        </tfoot>
    </table>
>>>>>>> 777f224dbdb430f14792a0087a7f436cbccf7009
    <div id="go_to_order">Продолжить</div>
</div>

<script type="text/javascript">
    jQuery(function($) {
        $('.jbzoo .jsJBZooBasket').JBZooBasket({
            'clearConfirm': "<?php echo JText::_('JBZOO_CART_CLEAR_CONFIRM'); ?>",
            'quantityUrl': "<?php echo $this->app->jbrouter->basketQuantity($view->appId); ?>",
            'deleteUrl': "<?php echo $this->app->jbrouter->basketDelete($view->appId); ?>",
            'clearUrl': "<?php echo $this->app->jbrouter->basketClear($view->appId); ?>"
        });
    });
</script>
