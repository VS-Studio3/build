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

$zoo = App::getInstance('zoo');

$layout = $params->get('layout', 'default');

// init assets
$zoo->jbassets->filter($layout);

$formId = 'jbzoo-filter-' . $layout . '-' . $module->id;
?>

<?php if ((int)$params->get('autosubmit', 0)) : ?>
<script type="text/javascript">
    jQuery(function ($) {
        $('#<?php echo $formId;?> select, #<?php echo $formId;?> input[type=radio], #<?php echo $formId;?> input[type=checkbox]').change(function () {
            $(this).closest("form").submit();
        });
    });
</script>
<?php endif; ?>

<div class="jbzoo jbzoo-filter-wrapper">

    <form class="jbzoo-filter filter-<?php echo $layout;?>"
          id="<?php echo $formId;?>"
          method="get"
          action="<?php echo JRoute::_('index.php?Itemid='.$params->get('menuitem', JRequest::getVar('Itemid')));?>"
          name="<?php echo $formId;?>">

        <div class="filter-fields">
            <!--
                User fields
            -->
            <?php
            echo $renderer->render('item.' . $layout, array(
                'params'      => $params,
                'type'        => $type,
                'layout'      => $layout,
                'application' => $application,
            ));
            ?>

            <!--
                Static fields
            -->
            <div class="static-fields">
                <?php if ((int)$params->get('pages_show', 1)) : ?>
                <div class="jbzoofilter_row element pages">
                    <label for="filterEl_limit" class="label"><?php echo JText::_('JBZOO_PAGES');?></label>

                    <div class="field"><?php echo $pagesHTML;?></div>
                    <div class="clear"></div>
                </div>
                <?php else : ?><?php echo $pagesHTML; ?><?php endif; ?>


                <?php if ((int)$params->get('order_show', 1)) : ?>
                <div class="jbzoofilter_row element ordering">
                    <label for="filterEl_orderings" class="label"><?php echo JText::_('JBZOO_ORDER');?></label>

                    <div class="field"><?php echo $orderingsHTML;?></div>
                    <div class="clear"></div>
                </div>
                <?php else : ?><?php echo $orderingsHTML; ?><?php endif; ?>

                <?php if ((int)$params->get('logic_show', 1)) : ?>
                <div class="jbzoofilter_row element logic">
                    <label for="filterEl_logic" class="label"><?php echo JText::_('JBZOO_LOGIC');?></label>

                    <div class="field"><?php echo $logicHTML;?></div>
                    <div class="clear"></div>
                </div>
                <?php else : ?><?php echo $logicHTML; ?><?php endif; ?>
            </div>
        </div>

        <!--
            Submit and reset buttons
        -->
        <div class="controls">
            <?php if ((int)$params->get('button_submit_show', 1)) : ?>
            <input type="submit" name="send-form" value="<?php echo JText::_('JBZOO_BUTTON_SUBMIT');?>" class="jsSubmit button rborder" />
            <?php endif; ?>

            <?php if ((int)$params->get('button_reset_show', 1)) : ?>
            <input type="reset" name="reset-form" value="<?php echo JText::_('JBZOO_BUTTON_RESET');?>" class="reset button rborder" />
            <?php endif; ?>

            <div class="clear clr"></div>
        </div>

        <!--
            System required fields
        -->
        <input type="hidden" name="controller" value="search" />
        <input type="hidden" name="Itemid" value="<?php echo $params->get('menuitem', JRequest::getVar('Itemid')) ;?>" />
        <input type="hidden" name="option" value="com_zoo" />
        <input type="hidden" name="task" value="filter" />
        <input type="hidden" name="exact" value="<?php echo $params->get('exact', 0);?>" />
        <input type="hidden" name="type" value="<?php echo $type;?>" class="jsItemType" />
        <input type="hidden" name="app_id" value="<?php echo $application->id;?>" class="jsApplicationId" />
    </form>

</div>
