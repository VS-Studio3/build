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

if (!empty($elementHTML)) {

    // create label
    $label = '';
    if (isset($params['showlabel']) && $params['showlabel']) {
        $label .= '<h3>';
        $label .= ($params['altlabel']) ? $params['altlabel'] : $element->getConfig()->get('name');
        $label .= '</h3>';
    }

    // create class attribute
    $classes   = array();
    $classes[] = 'props-element';
    if ($params['first']) {
        $classes[] = 'first';
    }

    if ($params['last']) {
        $classes[] = 'last';
    }

    echo $label . '<div class="tab-body ' . implode(' ', $classes) . '">' . $elementHTML . '</div>';
}
