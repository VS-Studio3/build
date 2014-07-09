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

    <div class="color_cart">Карта цветов</div>
    <?php if ($this->checkPosition('color')) : ?>
        <div class="item-color-position">
            <?php echo $this->renderPosition('color'); ?>
        </div>

        <script type="text/javascript">
            $j = jQuery.noConflict();

            var colorsList = {red: 'Красный', orange: 'Оранжевый'};

            var currentColorsListString = $j('.item-color-position').html();
            console.log(currentColorsListString);
            $j('.item-color-position').empty();

            var insertColorsDOMElement = '';

            for (field in colorsList) {
                var valueOfField = colorsList[field];

                if (currentColorsListString.indexOf(valueOfField) != -1) {
                    insertColorsDOMElement += '<div class="' + field + '"></div>';
                }
            }

            $j('.item-color-position').html(insertColorsDOMElement);
        </script>
    <?php endif; ?>

    <div class="description">
        <?php if ($this->checkPosition('description')) : ?>
            <div>Описание и технические характеристики:</div>
            <?php echo $this->renderPosition('description'); ?>
        <?php endif; ?>
    </div>

    <div class="others">

    </div>
</div>


