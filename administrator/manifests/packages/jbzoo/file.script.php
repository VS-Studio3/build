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
 * Class pkg_jbzooInstallerScript
 */
class pkg_jbzooInstallerScript
{

    /**
     * @param $parent
     */
    public function install($parent)
    {
    }

    /**
     * @param $parent
     */
    public function uninstall($parent)
    {
    }

    /**
     * @param $type
     * @param $parent
     * @return bool
     */
    public function preflight($type, $parent)
    {
        if (JFolder::exists(JPATH_ROOT . '/media/zoo/applications/jbuniversal')) {
            
            $parent->getParent()->abort(
                '<strong style="font-size:14px;color:red;">JBZoo is already installed. '.
                'Please, <a href="http://server.jbzoo.com/download#patches" target="_blank">use patches</a> for update!</strong>'
            );
            
            return false;
        }
    }

    /**
     * @param $parent
     */
    public function update($parent)
    {
    }

    /**
     * @param $type
     * @param $parent
     * @param $results
     */
    public function postflight($type, $parent, $results)
    {
        self::_enablePlugin('jbzoo');
    }

    /**
     * Enable plugin by name
     * @param $plugin
     */
    private static function _enablePlugin($plugin)
    {
        $db = JFactory::getDbo();

        $db->setQuery('UPDATE #__extensions SET enabled = 1 WHERE element = "' . $plugin . '"');
        $db->execute();
    }

}
