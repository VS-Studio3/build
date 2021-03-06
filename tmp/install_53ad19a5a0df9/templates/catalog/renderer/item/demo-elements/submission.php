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

?>

<fieldset class="pos-content creation-form">
	<legend><?php echo $item->getType()->name; ?></legend>

	<?php if ($this->checkPosition('content')) : ?>
	<?php echo $this->renderPosition('content', array('style' => 'submission.block')); ?>
	<?php endif; ?>

</fieldset>

<?php if ($this->checkPosition('media')) : ?>
<fieldset class="pos-media creation-form">
	<legend><?php echo JText::_('Media'); ?></legend>

	<?php echo $this->renderPosition('media', array('style' => 'submission.block')); ?>

</fieldset>
<?php endif; ?>

<?php if ($this->checkPosition('meta')) : ?>
<fieldset class="pos-meta creation-form">
	<legend><?php echo JText::_('Meta'); ?></legend>

	<?php echo $this->renderPosition('meta', array('style' => 'submission.block')); ?>

</fieldset>
<?php endif; ?>

<?php if ($this->checkPosition('administration')) : ?>
<fieldset class="pos-administration creation-form">
	<legend><?php echo JText::_('Administration'); ?></legend>

	<?php echo $this->renderPosition('administration', array('style' => 'submission.block')); ?>

</fieldset>
<?php endif; ?>