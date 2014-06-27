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

<div class="item-author-related">
    
    <?php if ($this->checkPosition('image')) : ?>
        <div class="item-image align-<?php echo $align;?>">
            <?php echo $this->renderPosition('image');?>
        </div>
    <?php endif; ?> 

    <?php if ($this->checkPosition('properties')) : ?>
       <ul class="item-properties">
           <?php echo $this->renderPosition('properties', array('style' => 'list'));?>
       </ul>
    <?php endif; ?>
    
</div>

<div class="clear clr"></div>
