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


class JBModelElementItemDate extends JBModelElement
{

    const DATE_FORMAT = 'Y-m-d';

    protected $_fieldname = 'date';

    /**
     * Set AND element conditions
     * @param JBDatabaseQuery $select
     * @param string          $elementId
     * @param string|array    $value
     * @param int             $i
     * @param bool            $exact
     * @return JBDatabaseQuery
     */
    public function conditionAND(JBDatabaseQuery $select, $elementId, $value, $i = 0, $exact = false)
    {
        $value = $this->_prepareValue($value);
        return $select->where($this->_getWhere($value));
    }

    /**
     * Set OR element conditions
     * @param JBDatabaseQuery $select
     * @param string          $elementId
     * @param string|array    $value
     * @param int             $i
     * @param bool            $exact
     * @return array
     */
    public function conditionOR(JBDatabaseQuery $select, $elementId, $value, $i = 0, $exact = false)
    {
        $value = $this->_prepareValue($value);
        return $this->_getWhere($value);
    }

    /**
     * Prepare and validate value
     * @param string|array $value
     * @return string|array
     */
    protected function _prepareValue($value)
    {
        if (isset($value['range']) && is_array($value['range'])) {
            $value = array(
                ($value['range'][0] ? $value['range'][0] : '1970-01-01') . ' 00:00:00',
                ($value['range'][1] ? $value['range'][1] : '2099-12-31') . ' 23:59:59'
            );

        } else if (isset($value['range-date']) && is_array($value['range-date'])) {
            $value = array(
                ($value['range-date'][0] ? $value['range-date'][0] : '1970-01-01') . ' 00:00:00',
                ($value['range-date'][1] ? $value['range-date'][1] : '2099-12-31') . ' 23:59:59'
            );

        } else {
            $date  = date(self::DATE_FORMAT, strtotime($value));
            $value = array(
                $date . ' 00:00:00',
                $date . ' 23:59:59'
            );
        }

        return $value;
    }

    /**
     * Get conditions for search
     * @param string|array $value
     * @return string
     */
    protected function _getWhere($value)
    {
        $result = "tItem." . $this->_fieldname
                . " BETWEEN STR_TO_DATE('" . $value[0] . "', '%Y-%m-%d %H:%i:%s')"
                . " AND STR_TO_DATE('" . $value[1] . "', '%Y-%m-%d %H:%i:%s')";

        return $result;
    }

}