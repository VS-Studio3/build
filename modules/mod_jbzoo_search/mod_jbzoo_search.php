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

// load config
require_once dirname(__FILE__) . '/helper.php';

$filterHelper = new JBZooFilterHelper($params);
$zoo          = App::getInstance('zoo');

// get params
$type        = $params->get('type', 0);
$application = $params->get('application', 0);
$layout      = $params->get('layout', 0);

if ($type && $application && $layout) {

    // prepeare
    $zoo->jbfilter->set($type, $application);

    // get application instance
    $application = $zoo->table->application->get($application);

    // get categories html
    $pagesHTML     = $filterHelper->getPages();
    $orderingsHTML = $filterHelper->getOrderings();
    $logicHTML     = $filterHelper->getLogic();

    // set renderer
    $renderer = $zoo->renderer->create('filter')->addPath(
        array(dirname(__FILE__), $zoo->path->path('applications:' . JBZOO_APP_GROUP . '/catalog/renderer'))
    );

    // render
    include(JModuleHelper::getLayoutPath('mod_jbzoo_search', $params->get('module-layout', 'default')));
}
