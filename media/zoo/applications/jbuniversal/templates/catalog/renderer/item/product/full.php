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
$tabsId = uniqid('jbzoo-tabs-');



?>

<?php if ($this->checkPosition('image')) : ?>
    <div class="item-image align-<?php echo $align; ?>">
        <?php echo $this->renderPosition('image'); ?>
    </div>
<?php endif; ?>

<?php echo $this->renderPosition('title', array('style' => 'jbtitle')); ?>
<div class="clear clr"></div>

<div class="rborder item-body">
    <?php if ($this->checkPosition('price')) : ?>
        <div class="item-price-position">
            <?php echo $this->renderPosition('price'); ?>
        </div>
    <?php endif; ?>
</div>

<?php echo $this->renderPosition(''); ?>
