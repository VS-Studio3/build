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


$imageAlign = $item->params->get('template.item_image_align', false);
if (!$imageAlign) {
    $imageAlign = $item->getApplication()->params->get('global.template.item_image_align', 'left');
}

?>

<?php if ($this->checkPosition('title')) {?>
	<h1 class="title"><?php echo $this->renderPosition('title');?></h1>
<?php } ?>


<?php if ($this->checkPosition('props')) {
	echo '<div class="date">'.$this->renderPosition('props').'</div>';
} ?>


<?php if ($this->checkPosition('image')) { ?>
	<div class="image align-<?php echo $imageAlign;?>">
		<?php echo $this->renderPosition('image');?>
	</div>
<?php }


if ($this->checkPosition('text')) {
	echo '<div class="text">'.$this->renderPosition('text').'</div>';
}

if ($this->checkPosition('links')) {
	echo '<ul class="links">'.$this->renderPosition('links', array('style' => 'block')).'</ul>';
}

?>

<div class="clr"></div>
