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
 * Class JBModelElementCountry
 */
class JBModelElementCountry extends JBModelElement
{

    /**
     * Prepare value
     * @param $value
     * @param $exact
     * @return mixed
     */
    protected function _prepareValue($value, $exact = false)
    {
        $values = $value;

        if ($exact) {
            return $values;

        } else {
            $options = $this->_getCountries();

            $result = array();
            if (!is_array($values)) {
                $values = array($values);
            }

            foreach ($values as $value) {
                if (isset($options[$value])) {
                    $result[] = $options[$value];
                }
            }

            return $result;
        }
    }

    /**
     * Get values
     * @return array
     */
    private function _getCountries()
    {
        $selectable_countries = $this->_config->get('selectable_country', array());
        $countries            = $this->app->country->getIsoToNameMapping();
        $keys                 = array_flip($selectable_countries);
        $countries            = array_intersect_key($countries, $keys);

        $result = array();
        foreach ($countries as $country) {
            $translated          = JText::_($country);
            $result[$translated] = $translated;
        }

        return $result;
    }
}
