<?php
/**
 * JBZoo App is universal Joomla CCK, application for YooTheme Zoo component
 *
 * @package     jbzoo
 * @version     2.x Pro
 * @author      JBZoo App http://jbzoo.com
 * @copyright   Copyright (C) JBZoo.com,  All rights reserved.
 * @license     http://jbzoo.com/license-pro.php JBZoo Licence
 * @coder       Vitaliy Yanovskiy <joejoker@jbzoo.com>
 */

// no direct access
defined('_JEXEC') or die('Restricted access');


$uniqId = uniqid('jbzoo-accordion-');
$borderClass = (int)$params->get('category_display_border', 0) ? 'jbzoo-rborder' : '';
$classes = array(
    'yoo-zoo',
    'jbzoo',
    $borderClass,
    'jbzoo-category-module',
    'jbcategory-layout-accordion'
);

?>
<div id="<?php echo $uniqId ?>" class='<?php echo implode(' ', $classes); ?>'>
    <?php if (!empty($categories)): ?>
        <?php foreach ($categories as $catId => $category): ?>
            <div class="jbaccordion-header">
                <?php if (!empty($category['image'])): ?>
                    <?php echo '<div class="align-' . $params->get('category_image_align', 'left') . '">' . $category['image'] . '</div>' ?>
                <?php endif; ?>

                <div class="jbcategory-header">
                    <?php
                    echo $category['category_name'];
                    if (!empty($category['item_count'])) {
                        echo ' (' . $category['item_count'] . ')';
                    }
                    ?>
                </div>

                <div class="clear"></div>
            </div>

            <?php if (!empty($category['items'])) {
                echo '<div class="jbcategory-items">';

                if (!empty($category['desc'])) {
                    echo '<p class="jbcategory-desc">' . $category['desc'] . '</p>';
                }

                $layout = $params->get('item_layout', 'default');
                foreach ($category['items'] as $itemId => $item) {
                    $itemClasses = array(
                        'jbzoo-item',
                        'jbzoo-item-' . $layout,
                        'jbzoo-item-' . $item->type,
                        'jbzoo-item-' . $item->id,
                        'rborder',
                    );
                    ?>
                    <div class="<?php echo implode(' ', $itemClasses); ?>">
                        <?php echo $renderer->render('item.' . $layout, array('item' => $item, 'params' => $params)) ?>
                        <div class="clear"></div>
                    </div>
                <?php
                }
                echo '</div>';
            }
            ?>
        <?php endforeach;
    endif; ?>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        $("#<?php echo $uniqId ?>").JBZooAccordion({headerWidget: '.jbaccordion-header'});
    });
</script>
