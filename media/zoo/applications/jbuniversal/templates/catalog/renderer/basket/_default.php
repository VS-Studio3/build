<?php
defined('_JEXEC') or die('Restricted access');

function jsonRemoveUnicodeSequences_2($struct) {
   return preg_replace("/\\\\u([a-f0-9]{4})/e", "iconv('UCS-4LE','UTF-8',pack('V', hexdec('U$1')))", json_encode($struct));
}


$view = $this->getView();
$this->app->jbassets->basket();
$this->app->jbassets->initJBPrice();
?>

<div id="basket">Покупки &gt;</div>
<div id="order_form">Оформление заказа &gt;</div>
<div id="pay_for_products">Оплата &gt;</div>

<div class="basket">
    <div id="basket_title">Перед оформлением заказа проверьте Ваш список покупок</div>
    <table class="jsJBZooBasket" style="width: 100%;">

        <tbody>
            <?php
            $i = 0;
            $summa = 0;
            $count = 0;

            $currencyConvert = $view->appParams->get('global.jbzoo_cart_config.currency');
            $imageElementId = $view->appParams->get('global.jbzoo_cart_config.element-image');

            foreach ($view->basketItems as $hash => $basketItem) {
                
                $item = $basketItem['item'];

                $isBoxNeeded = 'false';
                $checkBoxElement = $item->elements;
                $boxElement = substr($checkBoxElement, 0, strpos($checkBoxElement, '84081cd8-d154-4247-8363-ec2e9b89aa94'));
                if(strpos($boxElement, 'option') && strpos($boxElement, 'da')){
                    $isBoxNeeded = 'true';
                }
                
                $countType = substr($checkBoxElement, 0, strpos($checkBoxElement, '888260d0-e4b7-49ca-949a-063f17dedab1'));
                $countType = substr($countType, strpos($countType, 'value'));
                $countType = substr($countType, 9);
                $countType = substr($countType, 0, strpos($countType, '}'));
                $countType = jsonRemoveUnicodeSequences_2($countType);
                
                $countType =  str_replace('\"\n\t\t"', '', $countType);
                $countType =  str_replace('"', '', $countType);
                $countType =  str_replace('\\', '', $countType);

                $basketItem['price'] = $this->app->jbmoney->convert($basketItem['currency'], $currencyConvert, $basketItem['price']);

                $count += $basketItem['quantity'];

                $subtotal = $basketItem['quantity'] * $basketItem['price'];
                $summa += $subtotal;

                $image = $this->app->jbitem->renderImageFromItem($item, $imageElementId, true);

                echo '<tr type="' . $countType . '" box="' . $isBoxNeeded .'" class="row-' . $hash . '" data-itemId="' . $item->id . '" data-hash="' . $hash . '"><td><div class="border_for_products">';
                // echo '<div>' . ++$i . '</div>';
                // echo '<div>' . $basketItem['sku'] . '</div>';
                echo '<div class="for_image_product">' . $image . '</div>';
                echo '<div class="about_buy_product">';
                echo '<div class="name_product">';
                echo '<a href="' . $this->app->route->item($item) . '" title="' . $item->name . '">' . $item->name . '</a>';



                echo '</div>';

                echo '<div class="kolichestvo">';
                echo '<div class="params-box left">';

                if (isset($basketItem['priceParams']) && !empty($basketItem['priceParams'])) {
                    foreach ($basketItem['priceParams'] as $key => $value) {
                        if (!empty($value) && $key != 'Города') {
                            echo '<div class="product-param">' . $key . ': ' . $value . '</div>';
                        }
                    }
                }
                echo '</div>';

                if (!empty($basketItem['priceDesc'])) {
                    echo '<br/><span class="price-description">' . $basketItem['priceDesc'] . '</span>';
                }

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
                    echo '<div class="cart-sub-totalprice">Итого: <span class="jsSubtotal">' . $this->app->jbmoney->toFormat($subtotal, $currencyConvert) . '</span></div>';
                } else {
                    echo '<div> - </div>';
                }

                echo '<div class="deleted_product jbbutton jsDelete" itemid="' . $item->id . '" ></div>';
                echo "</div></td></tr>\n";
            }
            ?>
        </tbody>
        <tfoot>
            <tr>
                <td>
                    <div class="summa_products">
                        <div><strong><?php echo JText::_('JBZOO_CART_TOTAL'); ?>:</strong></div>
                        <div class="jsTotalCount"><?php echo $count; ?></div>
                        <div class="jsTotalPrice"><?php echo $this->app->jbmoney->toFormat($summa, $currencyConvert); ?></div>
                        <div class="delete_all">
                            <input type="button" class="jbbutton jsDeleteAll" value="<?php echo JText::_('JBZOO_CART_REMOVE_ALL'); ?>"/>
                        </div>
                    </div>
                </td>
            </tr>
        </tfoot>

    </table>


    <div id="go_to_order">Продолжить</div>
</div>
<script type="text/javascript">
    jQuery(function($) {
        $('.jbzoo .jsJBZooBasket').JBZooBasket({
            'clearConfirm': "<?php echo JText::_('JBZOO_CART_CLEAR_CONFIRM'); ?>",
            'quantityUrl': "<?php echo $this->app->jbrouter->basketQuantity($view->appId); ?>",
            'deleteUrl': "<?php echo $this->app->jbrouter->basketdelete($view->appId); ?>",
            'clearUrl': "<?php echo $this->app->jbrouter->basketClear($view->appId); ?>"
        });
    });
</script>
