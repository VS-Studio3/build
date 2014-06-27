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

$propsHelper = new JBZooFilterPropsHelper($params);
$zoo         = App::getInstance('zoo');

if (!$zoo->jbcache->start($params->toArray(), 'mod_props')) {

    $zoo->jbdebug->mark('mod_jbzoo_props::start');

    // get params
    $type        = $params->get('type', 0);
    $application = $params->get('application', 0);
    $layout      = $params->get('layout', 0);

    if ($type && $application && $layout) {

        // prepeare
        $zoo->jbfilter->set($type, $application);

        // get application instance
        $application = $zoo->table->application->get($application);

        // set renderer
        $renderer = $zoo->renderer->create('filterProps')->addPath(array(dirname(__FILE__)));

        // render
        include(JModuleHelper::getLayoutPath('mod_jbzoo_props', $params->get('module-layout', 'default')));
    }

    $zoo->jbcache->stop();
    $zoo->jbdebug->mark('mod_jbzoo_props::finish');
}
