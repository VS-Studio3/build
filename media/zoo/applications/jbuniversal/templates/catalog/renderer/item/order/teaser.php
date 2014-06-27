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

$itemLink = $this->app->route->item($item);

$orderDetails = JBModelOrder::model()->getDetails($item);
?>
<tr class="table-row item-<?php echo $item->id;?>">
    <td>
        <p><a href="<?php echo $itemLink;?>"><?php echo JText::_('JBZOO_ORDER_NAME');?> #<?php echo $item->id;?></p>
    </td>
    <td>
        <p class="date">
            <?php echo $this->renderPosition('date'); ?>
        </p>
    </td>
    <td>
        <p class="price">
            <?php echo $this->renderPosition('price'); ?>
        </p>
    </td>
    <td>
        <p class="payment-status">
            <?php echo $this->renderPosition('payment-status', array('style' => 'jbsimple')); ?>
        </p>
    </td>
</tr>
