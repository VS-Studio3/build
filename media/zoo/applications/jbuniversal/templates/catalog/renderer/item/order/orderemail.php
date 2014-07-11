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
 $user =& JFactory::getUser();
?>

<h3>Новый заказ № <u><?php echo $item->id ?></u></h3>
<?php if ($this->checkPosition('date')) : ?>
<h3>Дата заказа: <?php echo $this->renderPosition('date'); ?></h3>
<?php endif; ?>

<?php if ($this->checkPosition('items')) : ?>
    <?php echo $this->renderPosition('items'); ?>
<?php endif; ?>

<br>
    <h3>Информация о покупателе</h3>
    <ul class="buyer-info">
	    <li><b>Имя:</b> <?php echo $this->renderPosition('first-name'); ?></li>
	    <li><b>Отчество:</b> <?php echo $this->renderPosition('patronymic'); ?></li>
	    <li><b>Фамилия:</b> <?php echo $this->renderPosition('last-name'); ?></li>
	    <li><b>Индекс:</b> <?php echo $this->renderPosition('zip'); ?></li>
	    <li><b>Страна:</b> <?php echo $this->renderPosition('country'); ?></li>
	    <li><b>Область:</b> <?php echo $this->renderPosition('region'); ?></li>
	    <li><b>Район:</b> <?php echo $this->renderPosition('rayon'); ?></li>
	    <li><b>Населенный пункт:</b> <?php echo $this->renderPosition('city'); ?></li>
	    <li><b>Улица, дом, корпус, квартира:</b> <?php echo $this->renderPosition('address'); ?></li>
	    <li><b>Email:</b> <?php echo $user->email ?></li>

<?php if ($this->checkPosition('buyer-info')) : ?>
        <?php echo $this->renderPosition('buyer-info', array('style' => 'email'));?>
 <?php endif; ?>
    </ul>

<form action="<?php echo JURI::base() ?>blank1.php" enctype="multipart/form-data" method="post">
	<input type="hidden" name="fn" value="<?php echo trim($this->renderPosition('first-name')); ?>">
	<input type="hidden" name="ln" value="<?php echo trim($this->renderPosition('last-name')); ?>">
	<input type="hidden" name="p" value="<?php echo trim($this->renderPosition('patronymic')); ?>">
	<input type="hidden" name="z" value="<?php echo trim($this->renderPosition('zip')); ?>">
	<input type="hidden" name="co" value="<?php echo trim($this->renderPosition('country')); ?>">
	<input type="hidden" name="r" value="<?php echo trim($this->renderPosition('region')); ?>">
	<input type="hidden" name="ci" value="<?php echo trim($this->renderPosition('city')); ?>">
	<input type="hidden" name="ad" value="<?php echo trim($this->renderPosition('address')); ?>">
	<input type="submit" value="Печать первой страницы">
</form>

<form action="<?php echo JURI::base() ?>blank2.php" enctype="multipart/form-data" method="post">
	<input type="hidden" name="fn" value="<?php echo trim($this->renderPosition('first-name')); ?>">
	<input type="hidden" name="ln" value="<?php echo trim($this->renderPosition('last-name')); ?>">
	<input type="hidden" name="p" value="<?php echo trim($this->renderPosition('patronymic')); ?>">
	<input type="hidden" name="z" value="<?php echo trim($this->renderPosition('zip')); ?>">
	<input type="hidden" name="co" value="<?php echo trim($this->renderPosition('country')); ?>">
	<input type="hidden" name="r" value="<?php echo trim($this->renderPosition('region')); ?>">
	<input type="hidden" name="ci" value="<?php echo trim($this->renderPosition('city')); ?>">
	<input type="hidden" name="ad" value="<?php echo trim($this->renderPosition('address')); ?>">
	<input type="submit" value="Печать второй страницы">
</form>

<form action="<?php echo JURI::base() ?>blank3.php" enctype="multipart/form-data" method="post">
	<input type="submit" value="Печать описи">
	<div style="display:none; visibility: hidden;width: 0px;overflow: hidden;position: absolute;left: -9999px;"><textarea  name="items" cols="1" rows="1">
			<?php echo $this->renderPosition('items'); ?>
		</textarea></div>
	<input type="hidden" name="fio" value="<?php echo $this->renderPosition('last-name') .$this->renderPosition('first-name') . $this->renderPosition('patronymic'); ?>">
	
</form>