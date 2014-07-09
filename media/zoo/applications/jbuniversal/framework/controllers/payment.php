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
 * Class paymentJBUniversalController
 */
class paymentJBUniversalController extends JBUniversalController
{

    const TYPE_ROBOX  = 'Robokassa.ru';
    const TYPE_IKASSA = 'Interkassa.com';
    const TYPE_MANUAL = 'Manual';
    /**
     * @var Int
     */
    public $appId = null;

    /**
     * @var Item
     */
    public $order = null;

    /**
     * @var Int
     */
    public $orderId = null;

    /**
     * @var Int
     */
    public $itemId = null;

    /**
     * @var ElementJBBasketItems
     */
    public $orderDetails = null;

    /**
     * @var AppTemplate
     */
    public $template = null;

    /**
     * @var ParameterData
     */
    public $appParams = null;

    /**
     * @var JBUniversalApplication
     */
    public $application = null;

    /**
     * @var JBModelOrder
     */
    public $orderModel = null;

    /**
     * @var BasketRenderer
     */
    public $renderer = null;

    /**
     * @var String
     */
    public $systemType = null;

    /**
     * Init controller
     * @throws AppException
     */
    protected function _init()
    {
        $this->orderId = (int)$this->_jbrequest->get('order_id');
        $this->appId   = (int)$this->_jbrequest->get('app_id');

        $this->appParams = $this->application->getParams();

        if ($invId = (int)$this->_jbrequest->get('InvId')) {
            $this->systemType = self::TYPE_ROBOX;
            $this->orderId    = $invId;

        } else if ($ikPaymentId = (int)$this->_jbrequest->get('ik_payment_id')) {
            $this->systemType = self::TYPE_IKASSA;
            $this->orderId    = $ikPaymentId;
        }

        if (!$this->appId) {
            throw new AppException('Applciation id is no set');
        }

        if (!$this->template = $this->application->getTemplate()) {
            throw new AppException('No template selected');
        }

        if ((int)$this->appParams->get('global.jbzoo_cart_config.enable', 0) == 0) {
            throw new AppException('Application is not a basket');
        }

        if ((int)$this->appParams->get('global.jbzoo_cart_config.payment-enabled') == 0) {
            throw new AppException('Payment is not enabled');
        }

        if ($this->orderId) {

            $this->orderModel = JBModelOrder::model();
            if (!$this->order = $this->orderModel->getById($this->orderId)) {
                throw new AppException('Order #' . $this->orderId . ' no exists');
            }

            if (!$this->orderDetails = $this->orderModel->getDetails($this->order)) {
                throw new AppException('This type don\'t have JBPrice element');
            }
        }

        if (!$this->orderDetails) {
            throw new AppException('Order not found');
            die;
        }

        // set renderer
        $this->renderer = $this->app->renderer->create('basket')->addPath(array(
            $this->app->path->path('component.site:'),
            $this->template->getPath()
        ));
    }

    /**
     * Index action
     */
    function index()
    {
        if ((int)JFactory::getConfig()->get('debug') == 0) {
            //error_reporting(0);
        }

        $this->_init();

        $totalSumm         = $this->orderDetails->getTotalPrice();
        $totalSummFormated = $this->orderDetails->getTotalPrice(true);

        $appParams      = $this->app->data->create($this->appParams->get('global.jbzoo_cart_config.', array()));
        $this->payments = array();

        if ($this->orderDetails->getOrderStatus() == ElementJBBasketItems::ORDER_STATUS_PAID) {
            throw new AppException('Order has already been paid');
        }
        if ($totalSumm == 0) {
            throw new AppException('To pay for the cost should be greater than zero');
        }

        // robox
        if ((int)$appParams->get('robox-enabled', 0)) {
            $params               = new stdClass();
            $params->login        = JString::trim($appParams->get('robox-login'));
            $params->password1    = JString::trim($appParams->get('robox-password1'));
            $params->hash         = md5(implode(':', array($params->login, $totalSumm, $this->orderId, $params->password1)));
            $params->summ         = $totalSumm;
            $params->orderId      = $this->orderId;
            $params->summFormated = $totalSummFormated;
            $params->debug        = (int)$appParams->get('robox-debug', 0);

            $this->payments['robox'] = $this->app->data->create($params);
        }

        // ikassa
        if ((int)$appParams->get('ikassa-enabled', 0)) {
            $params               = new stdClass();
            $params->shopid       = JString::trim($appParams->get('ikassa-shopid'));
            $params->summ         = $totalSumm;
            $params->orderId      = $this->orderId;
            $params->summFormated = $totalSummFormated;

            $this->payments['ikassa'] = $this->app->data->create($params);
        }

        // manual
        if ((int)$appParams->get('manual-enabled', 0)) {
            $params          = new stdClass();
            $params->title   = $appParams->get('manual-title');
            $params->text    = $appParams->get('manual-text');
            $params->message = $appParams->get('manual-message');

            $this->payments['manual'] = $this->app->data->create($params);
        }

        // display
        $this->getview('payment')->addTemplatePath($this->template->getPath())->setLayout('payment')->display();
    }

    /**
     * @throws AppException
     */
    public function paymentCallback()
    {
        $this->_init();

        if ($this->orderDetails->getOrderStatus() == ElementJBBasketItems::ORDER_STATUS_PAID) {
            throw new AppException('Order has already been paid');
        }

        $totalsumm = $this->orderDetails->getTotalPrice();

        if ($this->systemType == self::TYPE_ROBOX) {

            if ((float)$totalsumm != (float)$_REQUEST['OutSum']) {
                throw new AppException('No valid summ');
            }

            $password2 = JString::trim($this->appParams->get('global.jbzoo_cart_config.robox-password2'));
            $crc       = strtoupper($_REQUEST["SignatureValue"]);
            $myCrc     = strtoupper(md5(implode(':', array($_REQUEST['OutSum'], $this->orderId, $password2))));

            if ($crc === $myCrc) {

                // get request vars
                $args = array(
                    'date'            => $this->app->date->create()->toSQL(),
                    'system'          => $this->systemType,
                    'additionalState' => null
                );

                // execute callback method
                $this->orderDetails->callback('paymentCallback', $args);

                jexit('OK' . $this->orderId);

            } else {
                throw new AppException('No valid hash');
            }

        } else if ($this->systemType == self::TYPE_IKASSA) {

            $myCrcData = implode(':', array(
                $this->_jbrequest->get('ik_shop_id', ''),
                $this->_jbrequest->get('ik_payment_amount', ''),
                $this->_jbrequest->get('ik_payment_id', ''),
                $this->_jbrequest->get('ik_paysystem_alias', ''),
                $this->_jbrequest->get('ik_baggage_fields', ''),
                $this->_jbrequest->get('ik_payment_state', ''),
                $this->_jbrequest->get('ik_trans_id', ''),
                $this->_jbrequest->get('ik_currency_exch', ''),
                $this->_jbrequest->get('ik_fees_payer', ''),
                JString::trim($this->appParams->get('global.jbzoo_cart_config.ikassa-key'))
            ));

            $myCrc         = strtoupper(md5($myCrcData));
            $crc           = strtoupper($this->_jbrequest->get('ik_sign_hash'));
            $shopid        = $this->appParams->get('global.jbzoo_cart_config.ikassa-shopid');
            $requestShopid = $this->_jbrequest->get('ik_shop_id');
            $totalSumm     = (float)$this->orderDetails->getTotalPrice();
            $requestAmount = (float)$this->_jbrequest->get('ik_payment_amount');

            if ($crc === $myCrc &&
                $totalSumm == $requestAmount &&
                $requestShopid === $shopid
            ) {
                // get request vars
                $args = array(
                    'date'            => $this->app->date->create()->toSQL(),
                    'system'          => $this->systemType,
                    'additionalState' => $this->_jbrequest->get('ik_payment_state')
                );

                // execute callback method
                $this->orderDetails->callback('paymentCallback', $args);

                jexit('OK' . $this->orderId);

            } else {
                throw new AppException('No valid hash');
            }

        } else {
            throw new AppException('Unknown system');
        }
    }

    /**
     * Payment success page
     */
    public function paymentSuccess()
    {
        $this->_init();

        // display
        $this->getview('payment_success')->addtemplatepath($this->template->getpath())->setlayout('payment_success')->display();
    }

    /**
     * Payment success page (manual)
     */
    public function paymentManual()
    {
        $this->_init();

        $appParams = $this->app->data->create($this->appParams->get('global.jbzoo_cart_config.', array()));

        if ((int)$appParams->get('manual-enabled', 0)) {

            $this->manual = $this->app->data->create(array(
                'title'   => $appParams->get('manual-title'),
                'text'    => $appParams->get('manual-text'),
                'message' => $appParams->get('manual-message'),
            ));

            $this->orderDetails->callback('paymentCallback', array(
                'date'   => $this->app->date->create()->toSQL(),
                'system' => self::TYPE_MANUAL,
            ));

            if ($appParams->get('manual-message')) {
                $this->app->jbnotify->notice($appParams->get('manual-message'));
            }

        } else {
            $this->app->jbnotify->error('Manual paymant is disabled');
        }

        // display
        $this->getview('payment_success')->addTemplatepath($this->template->getpath())->setlayout('payment_success')->display();
    }

    /**
     * Payment fail page
     */
    public function paymentFail()
    {
        $this->_init();
        $this->app->document->setTitle(JText::_('JBZOO_PAYMENT_FAIL_PAGE_TITLE'));

        // display
        $this->getview('payment_fail')->addtemplatepath($this->template->getpath())->setlayout('payment_fail')->display();
    }
}

