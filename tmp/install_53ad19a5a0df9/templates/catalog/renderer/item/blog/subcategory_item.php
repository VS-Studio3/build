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

<?php if ($this->checkPosition('image')) : ?>
    <div class="item-image align-<?php echo $align;?>">
        <?php echo $this->renderPosition('image');?>
    </div>
<?php endif; ?>


<?php if ($this->checkPosition('date')) : ?>
    <p class="jbzoo-date"><?php echo $this->renderPosition('date'); ?></p>
<?php endif; ?>


<?php if ($this->checkPosition('title')) : ?>
    <span class="item-title"><?php echo $this->renderPosition('title'); ?></span>
<?php endif; ?>


<div class="clear clr"></div>
