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


jimport('joomla.plugin.plugin');
jimport('joomla.filesystem.file');

/**
 * Class plgSystemJBZoo
 */
class plgSystemJBZoo extends JPlugin
{

    /**
     * When these components use, JBZoo doesn't init (backend only)
     * @var array
     */
    protected $_disableInitBackEnd = array(
        'com_seoboss'
    );

    /**
     * When these components use, JBZoo doesn't init (frontend only)
     * @var array
     */
    protected $_disableInitFrontEnd = array(
        'com_seoboss'
    );

    /**
     * @var JBZooSystemPlugin
     */
    protected $_jbzooSystemPlg = null;

    /**
     * Init Zoo && JBZoo Framework
     */
    protected function _initFramework()
    {
        if (!isset($_SERVER['REQUEST_TIME_FLOAT'])) { // hack for performance test
            $_SERVER['REQUEST_TIME_FLOAT'] = microtime(true);
        }

        if (!$this->_getExtCompatibility()) {
            return false;
        }

        $compEnabled = JComponentHelper::getComponent('com_zoo', true)->enabled;
        if (!$compEnabled) {
            return;
        }

        $mainConfig = JPATH_ADMINISTRATOR . '/components/com_zoo/config.php';
        if (!JFile::exists($mainConfig)) {
            return;
        }

        require_once($mainConfig);
        if (!class_exists('App')) {
            return;
        }

        $zoo = App::getInstance('zoo');
        if ($id = $zoo->request->getInt('changeapp')) {
            $zoo->system->application->setUserState('com_zooapplication', $id);
        }

        $jbzooBootstrap = JPATH_ROOT . '/media/zoo/applications/jbuniversal/framework/jbzoo.php';
        if (JFile::exists($jbzooBootstrap)) {
            require_once($jbzooBootstrap);

            JBZoo::init();

            $this->_jbzooSystemPlg = JBZooSystemPlugin::getInstance();
        }
    }

    /**
     * Check campatibility with external componetns
     */
    protected function _getExtCompatibility()
    {
        $joomlaApp = JFactory::getApplication();
        $jInput    = $joomlaApp->input;
        $isSite    = $joomlaApp->isSite();
        $compName  = $jInput->getCmd('option');

        if (
            ($isSite && in_array($compName, $this->_disableInitFrontEnd, true)) ||
            (!$isSite && in_array($compName, $this->_disableInitBackEnd, true))
        ) {
            return false;
        }

        return true;
    }

    /**
     * Joomla Event onAfterInitialise
     */
    public function onAfterInitialise()
    {
        $this->_initFramework();
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onAfterInitialise();
        }
    }

    /**
     * Joomla Event onAfterRoute
     */
    public function onAfterRoute()
    {
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onAfterRoute();
        }
    }

    /**
     * Joomla Event onAfterDispatch
     */
    public function onAfterDispatch()
    {
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onAfterDispatch();
        }
    }

    /**
     * Joomla Event onBeforeRender
     */
    public function onBeforeRender()
    {
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onBeforeRender();
        }
    }

    /**
     * Joomla Event onAfterRender
     */
    public function onAfterRender()
    {
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onAfterRender();
        }
    }

    /**
     * Joomla Event onBeforeCompileHead
     */
    public function onBeforeCompileHead()
    {
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onBeforeCompileHead();
        }
    }

    /**
     * Joomla Event onSearch
     */
    public function onSearch()
    {
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onSearch();
        }
    }

    /**
     * Joomla Event onSearchAreas
     */
    public function onSearchAreas()
    {
        if ($this->_jbzooSystemPlg) {
            $this->_jbzooSystemPlg->onSearchAreas();
        }
    }

}
