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

<?php if ($this->checkPosition('title')) : ?>
    <h3 class="item-title"><?php echo $this->renderPosition('title'); ?></h3>
<?php endif; ?>


<?php if ($this->checkPosition('subtitle')) : ?>
    <h4 class="item-title"><?php echo $this->renderPosition('subtitle'); ?></h4>
<?php endif; ?>


<?php if ($this->checkPosition('meta')) : ?>
    <p><i><?php echo $this->renderPosition('meta', array('style' => 'pipe')); ?></i></p> 
<?php endif; ?>


<?php if ($this->checkPosition('image')) : ?>
    <div class="item-image align-<?php echo $align;?>">
        <?php echo $this->renderPosition('image');?>
    </div>
<?php endif; ?>


<?php echo $this->renderPosition('text', array('style' => 'block')); ?>


<?php if ($this->checkPosition('links')) : ?>
    <p><?php echo $this->renderPosition('links', array('style' => 'pipe'));?></p>
<?php endif; ?>


<div class="clear clr"></div>
