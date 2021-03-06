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
 * Class JBItemHelper
 */
class JBItemHelper extends AppHelper
{
    /**
     * @var string
     */
    protected $_defaultAlign = 'left';

    /**
     * Get align for media position for item
     * @param Item $item
     * @param string $layout
     * @return string
     */
    public function getMediaAlign(Item $item, $layout)
    {
        $paramName = str_replace('.' . $item->type . '.', '.', $layout);
        $paramName = str_replace('.', '_', $paramName);
        $paramName = 'template.' . $paramName . '_image_align';

        $align = $item->params->get($paramName, false);

        if ($align === false) {
            $align = $item->getApplication()->params->get('global.' . $paramName, $this->_defaultAlign);
        }

        return $align;
    }

    /**
     * Render HTML image form item by elementId
     * @param Item $item
     * @param $elementId
     * @param bool $isLink
     * @return string|null
     */
    public function renderImageFromItem(Item $item, $elementId, $isLink = false)
    {
        if (empty($elementId)) {
            return null;
        }

        if (is_array($elementId)) {
            $result = '';
            foreach ($elementId as $elementIdrow) {
                $result .= "\n " . $this->renderImageFromItem($item, $elementIdrow, $isLink);
            }

            return $result;
        }

        $element = $item->getElement($elementId);
        if (JString::strtolower(get_class($element)) == 'elementjbimage') {

            return $element->render(array(
                'width'    => 285,
                'height'   => 285,
                'template' => $isLink ? 'itemlink' : 'default',
                'display'  => 'first',
            ));

        } else if (JString::strtolower(get_class($element)) == 'elementimage') {

            return $element->render(array(
                'width'  => 285,
                'height' => 285,
            ));
            
        } else if (JString::strtolower(get_class($element)) == 'elementimagepro') {

            return $element->render(array(
                'specific._width'  => 285,
                'specific._height' => 285,
            ));            
            
        }

        return null;
    }
}