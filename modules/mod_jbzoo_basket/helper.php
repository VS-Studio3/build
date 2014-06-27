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


class JBZooBasketHelper
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
     * Get basket count
     * @return int
     */
    public function getCountSku()
    {
        $basketItems = $this->getBasketItems();

        return count($basketItems);
    }

    /**
     * Get total summ
     * @return int
     */
    public function getSumm()
    {
        $currency    = $this->_params->get('currency', 'RUB');
        $basketItems = $this->getBasketItems();

        $summ = 0;
        foreach ($basketItems as $basketItem) {
            $priceValue = $basketItem['quantity'] * $basketItem['price'];
            $summ += $this->app->jbmoney->convert($basketItem['currency'], $currency, $priceValue);
        }

        return $summ;
    }

    /**
     * Get currency
     * @return mixed
     */
    public function getCurrency()
    {
        return $this->_params->get('currency', 'RUB');
    }

    /**
     * Get basket items
     * @return mixed
     */
    public function getBasketItems()
    {
        $basketItems = $this->app->jbcart->getAllItems();

        return $basketItems;
    }

    /**
     * Get basket url
     * @return string
     */
    public function getBasketUrl()
    {
        $appId      = $this->_params->get('app_id');
        $menuItemId = $this->_params->get('menuitem');

        return $this->app->jbrouter->basket($menuItemId, $appId);
    }

    /**
     * Get application id
     * @return mixed
     */
    public function getAppId()
    {
        return (int)$this->_params->get('app_id');
    }

    /**
     * Get count SKU
     * @return int
     */
    public function getCount()
    {
        $basketItems = $this->getBasketItems();

        $count = 0;
        foreach ($basketItems as $basketItem) {
            $count += $basketItem['quantity'];
        }

        return $count;
    }
}
