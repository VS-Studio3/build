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


jimport('joomla.form.formfield');

// load config
require_once(JPATH_ADMINISTRATOR . '/components/com_zoo/config.php');

class JFormFieldJBZooInit extends JFormField
{

    protected $type = 'JBZooInit';

    public function getInput()
    {
        $zoo = App::getInstance('zoo');
        $zoo->system->language->load('com_jbzoo', $zoo->path->path('applications:jbuniversal'), null, true);
        $zoo->system->language->load('com_jbzoostd', $zoo->path->path('applications:jbuniversal'), null, true);

        return false;
    }

    public function getLabel()
    {
        return false;
    }

}