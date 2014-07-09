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

<?php if ($this->checkPosition('title')) : ?>
    <h1 class="item-title"><?php echo $this->renderPosition('title'); ?></h1>
<?php endif; ?>

<?php if ($this->checkPosition('properties')) : ?>
    <h3>Detail information</h3>
    <table class="jbtable">
        <?php echo $this->renderPosition('properties', array('style' => 'jbtable')); ?>
    </table>
<?php endif; ?>


<?php if ($this->checkPosition('text')) : ?>
    <?php echo $this->renderPosition('text', array('style' => 'block')); ?>
<?php endif; ?>


<?php if ($this->checkPosition('others')) : ?>
    <h3>Others</h3>
    <table class="jbtable">
        <?php echo $this->renderPosition('others', array('style' => 'jbtable')); ?>
    </table>
<?php endif; ?>

<div class="clear clr"></div>
