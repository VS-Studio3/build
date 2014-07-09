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
 * Class JBModelElementJBImage
 */
class JBModelElementJBImage extends JBModelElement
{

    const IMAGE_EXISTS    = '__IMAGE_EXISTS__';
    const IMAGE_NO_EXISTS = '__IMAGE_NO_EXISTS__';

    /**
     * Set AND element conditions
     * @param JBDatabaseQuery $select
     * @param string $elementId
     * @param array|string $value
     * @param int $i
     * @param bool $exact
     * @return JBDatabaseQuery
     */
    public function conditionAND(JBDatabaseQuery $select, $elementId, $value, $i = 0, $exact = false)
    {
        return $this->_getWhere($value, $elementId);
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
        return $this->_getWhere($value, $elementId);
    }

    /**
     * @param $value
     * @param $elementId
     * @return array
     */
    private function _getWhere($value, $elementId)
    {
        $result = array();

        if (self::IMAGE_EXISTS == $value || self::IMAGE_NO_EXISTS == $value) {
            $elementId = $this->_jbtables->getFieldName($elementId);

            $result[] = 'tIndex.' . $elementId . ' = ' . $this->_quote($value);
        }

        return $result;
    }

}
