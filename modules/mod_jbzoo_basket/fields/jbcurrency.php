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

class JFormFieldJBCurrency extends JFormField
{

    protected $type = 'JBCurrency';

    public function getInput()
    {
        // get app
        $app = App::getInstance('zoo');

        $currencyLst = $app->jbmoney->getCurrencyList();

        // create select
        $options = array();
        foreach ($currencyLst as $key => $currency) {
            $options[] = $app->html->_('select.option', $key, $currency);
        }

        return $app->html->_(
            'select.genericlist',
            $options,
            "{$this->formControl}[{$this->group}][{$this->fieldname}]",
            '',
            'value',
            'text',
            $this->value
        );
    }

}
