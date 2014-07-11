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
<script type="text/javascript">
    $j(function(){
        $j('.little_img img').attr({'width' : 50, 'height' : 50});
        $j('.little_img .preview_img').click(function(){
            $j('.prev_img_container').show();
            $j('.img_sourse').html($j('.first_img img').clone().attr({'width' : 500, 'height' : 500}));
        });
        $j('.close_img').click(function(){
            $j('.prev_img_container').hide();
        });
    });
</script>
<div class="prev_img_container">
    <div class="close_img">Закрыть</div>
    <div class="img_sourse"></div>
</div>
<div id="full_product_description">
    <?php if ($this->checkPosition('image')) : ?>
        <div class="little_img">
            <?php echo $this->renderPosition('image'); ?>
            <div class="preview_img">Preview</div>
        </div>
        <div class="first_img item-image align-<?php echo $align; ?>">
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
        <?php endif; ?>
    </div>

    <?php if ($this->checkPosition('description')) : ?>
        <div class="description">
            <div>Описание и технические характеристики:</div>
            <div class="text_about">
                <?php echo $this->renderPosition('description'); ?>
            </div>
        </div>
    <?php endif; ?>

    <?php if ($this->checkPosition('related')) : ?>
        <div class="others">
            <?php echo $this->renderPosition('related'); ?>
        </div>
    <?php endif; ?>

</div>

<script type="text/javascript">
    $j = jQuery.noConflict();

    $j(function () {
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
    })
</script>


