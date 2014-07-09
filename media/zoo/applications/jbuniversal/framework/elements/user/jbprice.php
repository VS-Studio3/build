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
 * Class JBCSVItemUserJBPrice
 */
class JBCSVItemUserJBPrice extends JBCSVItem
{
    /**
     * @return string|void
     */
    public function toCSV()
    {
        $result = array();

        if (!empty($this->_value)) {
            foreach ($this->_value as $self) {

                if (isset($self['sku'])) {
                    $result[] = implode(JBCSVItem::SEP_CELL, array(
                        (isset($self['sku']) ? $self['sku'] : ' '),
                        (isset($self['in_stock']) ? $self['in_stock'] : '0'),
                        (isset($self['value']) ? $self['value'] : '0'),
                        (isset($self['description']) ? $self['description'] : ''),
                    ));
                } else {
                    $result[] = implode(JBCSVItem::SEP_CELL, array(
                        (isset($self['value']) ? $self['value'] : '0'),
                        (isset($self['description']) ? $self['description'] : ''),
                    ));
                }
            }
        }

        return $result;
    }

    /**
     * @param $value
     * @param null $position
     * @return Item|void
     */
    public function fromCSV($value, $position = null)
    {
        $valuesTmp = $this->_getArray($value, JBCSVItem::SEP_CELL);

        if (count($valuesTmp) == 4) {
            $values = array(
                'sku'         => $valuesTmp[0],
                'in_stock'    => $valuesTmp[1],
                'value'       => $valuesTmp[2],
                'description' => $valuesTmp[3],
            );

        } else if (count($valuesTmp) == 3) {
            $values = array(
                'sku'         => $valuesTmp[0],
                'value'       => $valuesTmp[1],
                'description' => $valuesTmp[2],
            );

        } else if (count($valuesTmp) == 2) {
            $values = array(
                'value'       => $valuesTmp[0],
                'description' => $valuesTmp[1],
            );

        } else {
            $values = array(
                'value' => $valuesTmp[0],
            );
        }

        $data = ($position == 1) ? array() : $this->_element->data();

        $data[] = $values;
        $this->_element->bindData($data);

        return $this->_item;
    }

}
