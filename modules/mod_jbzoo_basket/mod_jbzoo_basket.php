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
require_once dirname(__FILE__) . DS . 'helper.php';

$zoo = App::getInstance('zoo');

$zoo->jbdebug->mark('mod_jbzoo_basket::start');

// render module
include(JModuleHelper::getLayoutPath('mod_jbzoo_basket', $params->get('module-layout', 'default')));

$zoo->jbdebug->mark('mod_jbzoo_basket::finish');
