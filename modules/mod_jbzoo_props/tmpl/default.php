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
$zoo->jbassets->filterprops($layout);
?>

<div class="jbzoo jbzoo-props props-list-<?php echo $layout;?>">
    <?php echo $renderer->render('item.' . $params->get('layout', 'default'), array(
    'type'        => $type,
    'layout'      => $layout,
    'application' => $application,
    'params'      => $params,
    'module'      => $module
)); ?>
</div>