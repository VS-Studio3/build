<?php
/**
 * JBZoo App is universal Joomla CCK, application for YooTheme Zoo component
 *
 * @package     jbzoo
 * @version     2.x Pro
 * @author      JBZoo App http://jbzoo.com
 * @copyright   Copyright (C) JBZoo.com,  All rights reserved.
 * @license     http://jbzoo.com/license-pro.php JBZoo Licence
 * @coder       Denis Smetannikov <denis@jbzoo.com>
 */

// no direct access
defined('_JEXEC') or die('Restricted access');


/**
 * Class JBModelElementItemtag
 */
class JBModelElementItemtag extends JBModelElement
{

    /**
     * Set AND element conditions
     * @param JBDatabaseQuery $select
     * @param string $elementId
     * @param string|array $value
     * @param int $i
     * @param bool $exact
     * @return JBDatabaseQuery
     */
    public function conditionAND(JBDatabaseQuery $select, $elementId, $value, $i = 0, $exact = false)
    {
        return array($this->_getWhere($value, $elementId, $exact));
    }

    /**
     * Set OR element conditions
     * @param JBDatabaseQuery $select
     * @param string $elementId
     * @param string|array $value
     * @param int $i
     * @param bool $exact
     * @return array
     */
    public function conditionOR(JBDatabaseQuery $select, $elementId, $value, $i = 0, $exact = false)
    {
        return array($this->_getWhere($value, $elementId, $exact));
    }

    /**
     * Get conditions for search
     * @param $value
     * @param $elementId
     * @param $exact
     * @return array
     */
    protected function _getWhere($value, $elementId, $exact = false)
    {
        $values    = $this->_prepareValue($value);
        $elementId = $this->_jbtables->getFieldName($elementId, 's');

        $result = array();
        foreach ($values as $value) {
            if ($exact) {
                $result[] = 'tIndex.' . $elementId . ' = ' . $this->_quote($value);
            } else {
                $result[] = 'tIndex.' . $elementId . ' LIKE ' . $this->_quote('%' . $value . '%');
            }
        }

        return implode(' OR ', $result);
    }

    /**
     * @param array|string $value
     * @param bool $exact
     * @return array|mixed
     */
    protected function _prepareValue($value, $exact = false)
    {
        if (!is_array($value)) {
            $value = array($value);
        }

        return $value;
    }

}
