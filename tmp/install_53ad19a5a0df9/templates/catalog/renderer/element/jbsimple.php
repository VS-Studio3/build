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

// create label
$label = '';
if (isset($params['showlabel']) && $params['showlabel']) {
    $label = ($params['altlabel']) ? $params['altlabel'] : $element->config->get('name');
}

// render element
echo '<div>' . $label . ' ' . $element->render($params) . '</div> ';