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

class JFormFieldFilename extends JFormField
{

    protected $type = 'Filename';

    /**
     * Render control HTML
     * @return mixed
     */
    public function getInput()
    {
        // get app
        $app = App::getInstance('zoo');

        // create select
        $path    = dirname(dirname(__FILE__)) . $this->element->attributes()->path;
        $options = array();

        if (is_dir($path)) {
            foreach (JFolder::files($path, '^([-_A-Za-z0-9]*)\.php$') as $tmpl) {
                $tmpl      = basename($tmpl, '.php');
                $options[] = $app->html->_('select.option', $tmpl, ucwords($tmpl));
            }
        }

        return $app->html->_(
            'select.genericlist', $options, "{$this->formControl}[{$this->group}][{$this->fieldname}]", '', 'value',
            'text', $this->value
        );
    }

}