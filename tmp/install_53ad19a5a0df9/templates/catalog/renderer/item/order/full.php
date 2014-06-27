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

$user = JFactory::getUser();

if ($user->id != $item->created_by) {
    JError::raiseError('Access denied', 500);
}

?>

<?php if ($this->checkPosition('items')) : ?>
    <h2><?php echo JText::_('JBZOO_CART_ITEMS');?></h2>
    <?php echo $this->renderPosition('items'); ?>
<?php endif; ?>


<h2><?php echo JText::_('JBZOO_CART_ABOUT_USER');?></h2>
<div class="basket-info jsBasketInfo jsAccordion">

    <?php if ($this->checkPosition('billing')) : ?>
    <ul class="tab-body">
        <?php echo $this->renderPosition('billing', array('style' => 'email'));?>
    </ul>
    <?php endif; ?>

    <?php if ($this->checkPosition('shipping')) : ?>
    <h2><?php echo JText::_('JBZOO_CART_SHIPPING');?></h2>
    <ul class="tab-body">
        <?php echo $this->renderPosition('shipping', array('style' => 'email'));?>
    </ul>
    <?php endif; ?>

    <?php if ($this->checkPosition('payment')) : ?>
    <h2><?php echo JText::_('JBZOO_CART_PAYMENT');?></h2>
    <ul class="tab-body">
        <?php echo $this->renderPosition('payment', array('style' => 'email'));?>
    </ul>
    <?php endif; ?>

    <?php if ($this->checkPosition('other')) : ?>
    <h2><?php echo JText::_('JBZOO_CART_OTHER');?></h2>
    <ul class="tab-body">
        <?php echo $this->renderPosition('other', array('style' => 'email'));?>
    </ul>
    <?php endif; ?>

</div>
