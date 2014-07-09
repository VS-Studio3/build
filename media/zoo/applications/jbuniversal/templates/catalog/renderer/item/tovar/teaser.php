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
?>

teaser
<?php if ($this->checkPosition('title')) : ?>
<h3 class="item-title"><?php echo $this->renderPosition('title'); ?></h3>
<?php endif; ?>

<?php if ($this->checkPosition('image')) : ?>
<div class="span3 item-image align-<?php echo $align;?>">
    <?php echo $this->renderPosition('image');?>
</div>
<?php endif; ?>

<div class="product-props">

    <?php if ($this->checkPosition('properties')) : ?>
    <ul>
        <?php echo $this->renderPosition('properties', array('style' => 'list')); ?>
    </ul>
    <?php endif; ?>
</div>

<?php if ($this->checkPosition('price')) : ?>
    <div class="product-buttons span12">
        <?php echo $this->renderPosition('price'); ?>
    </div>
<?php endif; ?>
