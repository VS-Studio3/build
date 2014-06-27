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


$imageAlign = $item->params->get('template.item_teaser_image_align', 'left');
?>

<?php if ($this->checkPosition('title')) {?>
	<h3 class="title"><?php echo $this->renderPosition('title');?></h3>
<?php } ?>


<?php if ($this->checkPosition('image')) { ?>
<div class="image align-<?php echo $imageAlign;?>">
	<?php echo $this->renderPosition('image');?>
</div>
<?php } ?>


<?php if ($this->checkPosition('date')) { ?>
    <div class="date"><?php echo $this->renderPosition('date');?></div>
<?php } ?>


<?php if ($this->checkPosition('anons')) { ?>
    <div class="anons"><?php echo $this->renderPosition('anons');?></div>
<?php } ?>


<?php if ($this->checkPosition('category')) { ?>
    <div class="categories-list"><?php echo $this->renderPosition('category');?></div>
<?php } ?>

<div class="clr"></div>
