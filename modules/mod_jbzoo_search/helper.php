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

require_once(JPATH_ADMINISTRATOR . '/components/com_zoo/config.php');
require_once(JPATH_BASE . '/media/zoo/applications/jbuniversal/framework/jbzoo.php');


class JBZooFilterHelper
{
    /**
     * @var JRegistry
     */
    protected $_params = null;

    /**
     * @var App
     */
    protected $app = null;

    /**
     * Init Zoo
     * @param JRegistry $params
     */
    public function __construct(JRegistry $params)
    {
        $this->app     = App::getInstance('zoo');
        $this->_params = $params;

        JBZoo::init();
    }

    /**
     * Get pages
     * @return mixed
     */
    public function getPages()
    {
        $value = JRequest::getVar('limit', $this->_params->get('pages', 20));

        if ((int)$this->_params->get('pages_show', 1)) {

            $values = array('5', '10', '15', '20', '25', '30', '50', '100', 'all');

            $options = array();
            foreach ($values as $option) {
                $options[] = $this->app->html->_('select.option', $option, JText::_('JBZOO_' . $option));
            }

            $html = $this->app->html->_(
                'zoo.genericlist',
                $options,
                'limit',
                array(),
                'value',
                'text',
                $value,
                'filterEl_limit'
            );

        } else {
            $html = '<input type="hidden" name="limit" value="' . $value . '" />';
        }

        return $html;
    }

    /**
     * Get logic
     * @return string|null
     */
    public function getLogic()
    {
        $value = JRequest::getVar('logic', $this->_params->get('logic', 'and'));

        if ((int)$this->_params->get('logic_show', 1)) {

            $values = array('and', 'or');

            $options = array();
            foreach ($values as $option) {
                $options[] = $this->app->html->_('select.option', $option, JText::_('JBZOO_' . $option));
            }

            $html = $this->app->html->_(
                'select.radiolist',
                $options,
                'logic',
                array(),
                'value',
                'text',
                $value,
                'filterEl_logic'
            );

        } else {
            $html = '<input type="hidden" name="logic" value="' . $value . '" />';

        }

        return $html;
    }

    /**
     * Get ordering
     * @return mixed
     */
    public function getOrderings()
    {
        $value = JRequest::getVar('order', $this->_params->get('order', 'none'));

        if ((int)$this->_params->get('order_show', 1)) {

            $values  = $this->app->jborder->getOrderings();
            $options = array();

            foreach ($values as $key => $option) {
                $options[] = $this->app->html->_('select.option', $key, JText::_('JBZOO_SORT_' . strtoupper($key)));
            }

            $html = $this->app->html->_(
                'zoo.genericlist',
                $options,
                'order',
                array(),
                'value',
                'text',
                $value,
                'filterEl_orderings'
            );

        } else {
            $html = '<input type="hidden" name="order" value="' . $value . '" />';

        }

        return $html;
    }

}
