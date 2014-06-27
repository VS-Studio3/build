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

$zoo          = App::getInstance('zoo');
$basketHelper = new JBZooBasketHelper($params);
$basketItems  = $basketHelper->getBasketItems();

echo '<div class="jbzoo">';
echo '<div class="jbzoo-basket-wraper jsJBZooModuleBasket" appId="' . $basketHelper->getAppId() . '" moduleId="' . $module->id . '">';

if (!empty($basketItems)) {

    $summa     = $basketHelper->getSumm($basketItems);
    $count     = $basketHelper->getCount($basketItems);
    $countSku  = $basketHelper->getCountSku($basketItems);
    $currency  = $basketHelper->getCurrency($basketItems);
    $basketUrl = $basketHelper->getBasketUrl();

    echo '<p>' . JText::_('JBZOO_CART_TOTAL_COUNT') . ': <span class="total-items">' . $count . ' ' . JText::_('JBZOO_CART_COUNT_ABR') . '</span></p>';
    echo '<p>' . JText::_('JBZOO_CART_TOTAL_SKU') . ': <span class="total-items">' . $countSku . ' ' . JText::_('JBZOO_CART_COUNT_ABR') . '</span></p>';

    echo '<p>' . JText::_('JBZOO_CART_TOTAL_PRICE') . ': <span class="price-total-value">'
        . $zoo->jbmoney->toFormat($summa, $currency) . '</span></p>';

    echo '<p class="basket-link">
            <a rel="nofollow" class="add-to-cart" style="display:inline-block;" href="' . $basketUrl . '">'
        . JText::_('JBZOO_CART_GOTO_BASKET') . '</a>
        </p>';

} else {
    echo '<p>' . JText::_('JBZOO_CART_ITEMS_NOT_FOUND') . '</p>';
}

echo '<div class="clr"></div>';
echo '</div>';
echo '</div>';
