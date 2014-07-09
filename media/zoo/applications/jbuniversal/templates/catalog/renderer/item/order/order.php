<?php
/**
 * JBZoo is universal CCK based Joomla! CMS and YooTheme Zoo component
 * @category   JBZoo
 * @author     smet.denis <admin@joomla-book.ru>
 * @copyright  Copyright (c) 2009-2013, Joomla-book.ru
 * @license    http://joomla-book.ru/info/disclaimer
 * @link       http://joomla-book.ru/projects/jbzoo JBZoo project page
 */
defined('_JEXEC') or die('Restricted access');

$this->app->jbassets->jqueryAccordion();

?>

<?php if ($this->app->jbenv->isWidgetkit(false)) : ?>
    <div class="wk-accordion wk-accordion-default clearfix" data-widgetkit="accordion"
         data-options='{"style":"default","collapseall":1,"matchheight":true}'>
<?php else : ?>
    <div class="basket-info jsBasketInfo jsAccordion">
<?php endif; ?>

    <?php if ($this->checkPosition('billing')) : ?>
    <h3 class="toggler"><?php echo JText::_('JBZOO_CART_BILLING');?></h3>
    <div><div class="tab-body content wk-content clearfix">
        <?php echo $this->renderPosition('billing', array('style' => 'order.block'));?>
    </div></div>
    <?php endif; ?>


    <?php if ($this->checkPosition('shipping')) : ?>
    <h3 class="toggler"><?php echo JText::_('JBZOO_CART_SHIPPING');?></h3>
    <div><div class="tab-body content wk-content clearfix">
        <?php echo $this->renderPosition('shipping', array('style' => 'order.block'));?>
    </div></div>
    <?php endif; ?>


    <?php if ($this->checkPosition('payment')) : ?>
    <h3 class="toggler"><?php echo JText::_('JBZOO_CART_PAYMENT');?></h3>
    <div><div class="tab-body content wk-content clearfix">
        <?php echo $this->renderPosition('payment', array('style' => 'order.block'));?>
    </div></div>
    <?php endif; ?>


    <?php if ($this->checkPosition('other')) : ?>
    <h3 class="toggler"><?php echo JText::_('JBZOO_CART_OTHER');?></h3>
    <div><div class="tab-body content wk-content clearfix">
        <?php echo $this->renderPosition('other', array('style' => 'order.block'));?>
    </div></div>
    <?php endif; ?>

</div>
