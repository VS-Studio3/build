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
    <legend>Summary</legend>
    <?php if ($this->checkPosition('main')) : ?>
        <?php echo $this->renderPosition('main', array('style' => 'submission.block')); ?>
    <?php endif; ?>
</fieldset>
<fieldset class="pos-content creation-form">
    <legend>Options Apartment / House</legend>
    <?php if ($this->checkPosition('properties')) : ?>
        <?php echo $this->renderPosition('properties', array('style' => 'submission.block')); ?>
    <?php endif; ?>
</fieldset>