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
 * Class JBMoneyHelper
 */
class JBMoneyHelper extends AppHelper
{

    static $currencyList = null;
    static $formatList = null;

    protected $_serviceUrl = 'http://rate-exchange.appspot.com/currency';

    const BASE_CURRENCY = 'EUR';

    /**
     * @var array
     */
    protected $_config = array();

    /**
     * @param App $app
     */
    public function __construct($app)
    {
        parent::__construct($app);
        $this->_init();
    }

    /**
     * Get all currency values and cache in memory
     */
    protected function _init()
    {
        if (is_null(self::$currencyList)) {

            $xml = simplexml_load_file($this->app->path->path('jbconfig:jbcurrency.xml'));

            $this->_config = array(
                'load_from_google' => (int)(defined('JBZOO_CONFIG_CURRENCY_ONLINE') ? JBZOO_CONFIG_CURRENCY_ONLINE : 0),
            );

            self::$formatList = array();
            foreach ($xml->formatlist->children() as $name => $format) {
                self::$formatList[$name] = array();
                foreach ($format->attributes() as $key => $value) {
                    self::$formatList[$name][$key] = (string)$value;
                }
            }

            self::$currencyList = array();
            foreach ($xml->curencylist->children() as $code => $currency) {

                $code = JString::strtoupper($code);

                self::$currencyList[$code] = array(
                    'name' => JText::_('JBZOO_JBCURRENCY_' . $code),
                );

                foreach ($currency->attributes() as $key => $value) {
                    self::$currencyList[$code][$key] = (string)$value;
                }

                self::$currencyList[$code]['value'] = $this->clearValue(self::$currencyList[$code]['value']);
            }


            $this->_mergeWithOnline();
        }
    }

    /**
     * Load currency values from service
     * @return mixed
     */
    protected function _mergeWithOnline()
    {
        if (!(int)$this->_config['load_from_google']) {
            return false;
        }

        $cacheKey = 'currency-' . date('d-m-Y');
        $result   = $this->app->jbcache->get($cacheKey, 'currency', true);

        if (empty($result)) {

            $result = array(self::BASE_CURRENCY => 1);
            foreach (self::$currencyList as $code => $currency) {

                if ($code == self::BASE_CURRENCY) {
                    continue;
                }

                $response = $this->app->http->get($this->_serviceUrl . '?' . $this->app->jbrouter->query(array(
                    'from' => self::BASE_CURRENCY,
                    'to'   => $code,
                )));

                if ($response['body']) {
                    $data          = $this->app->data->create(json_decode($response['body']));
                    $result[$code] = (float)$this->clearValue($data->get('rate', 0));
                }

            }

            $this->app->jbcache->set($cacheKey, $result, 'currency', true);
        }

        if (!empty($result) && is_array($result)) {
            foreach ($result as $code => $value) {
                if ($value > 0) {
                    self::$currencyList[$code]['value'] = $value;
                }
            }
        }
    }

    /**
     * Clear price string
     * @param $value
     * @return mixed|string
     */
    public function clearValue($value)
    {
        return $value;
        $value = (string)$value;
        $value = JString::trim($value);
        $value = preg_replace('#[^0-9\,\.\-\+]#ius', '', $value);

        if (preg_match('#^([\+\-]{0,1})([0-9\.\,]*)$#ius', $value, $matches)) {
            $value = str_replace(',', '.', $matches[2]);
            return $matches[1] . (float)$value;
        }

        return 0;
    }

    /**
     * Convert currency
     * @param $from    string
     * @param $to      string
     * @param $value   float
     * @return mixed
     */
    public function convert($from, $to, $value)
    {
        $value = $this->clearValue($value);
        $from  = $this->clearCurrency($from);
        $to    = $this->clearCurrency($to);

        if ($from == $to) {
            return $value;
        }

        $result = 0;

        if (isset(self::$currencyList[$to]) && isset(self::$currencyList[$from])) {
            $normValue = $value / self::$currencyList[$from]['value'];
            $result    = $normValue * self::$currencyList[$to]['value'];
        }
        return $result;
    }

    /**
     * Currency list
     * @param bool $isShort
     * @return array
     */
    public function getCurrencyList($isShort = false)
    {
        $result = array();
        foreach (self::$currencyList as $code => $currency) {

            if ($isShort) {
                $result[$code] = $code;
            } else {
                $result[$code] = $code . ' - ' . JText::_('JBZOO_JBCURRENCY_' . $code);
            }
        }

        return $result;
    }

    /**
     * convert number to money formated string
     * @param $value
     * @param $code
     * @return null|string
     */
    public function toFormat($value, $code = null)
    {
        $value  = $this->clearValue($value);
        $format = self::$formatList['default'];

        if (empty($code)) {
            return number_format($value, $format['decimals'], $format['dec_point'], $format['thousands_sep']);
        }

        $code = JString::trim(JString::strtoupper($code));
        if ($code == '%') {

            $formated = abs(number_format($value, $format['decimals'], $format['dec_point'], $format['thousands_sep']));
            $sign     = '';
            if ($value[0] == '+' || $value[0] == '-') {
                $sign = $value[0];
            }

            return $sign . $formated . '%';

        } else if (isset(self::$currencyList[$code])) {

            $params = self::$currencyList[$code];

            $formatNum = $params['format'];

            if (isset(self::$formatList['format_' . $formatNum])) {
                $format = self::$formatList['format_' . $formatNum];
            }

            $formated = number_format($value, $format['decimals'], $format['dec_point'], $format['thousands_sep']);

            return (!empty($params['prefix']) ? $params['prefix'] : '')
            . $formated
            . (!empty($params['postfix']) ? ' ' . $params['postfix'] : '');
        }

        return null;

    }

    /**
     * Check currency
     * @param $currency
     * @param string $default
     * @return string
     */
    public function clearCurrency($currency, $default = 'EUR')
    {
        $currency = trim(strtoupper($currency));

        if ($currency == '%') {
            return '%';
        }

        if (isset(self::$currencyList[$currency])) {
            return $currency;
        }

        return $default;
    }

    /**
     * Calculate total value
     * @param float $value
     * @param string $baseCurrency
     * @param float $addValue
     * @param string $currency
     * @return float
     */
    public function calc($value, $baseCurrency, $addValue, $currency)
    {
        $value        = $this->clearValue($value);
        $baseCurrency = $this->clearCurrency($baseCurrency);
        $addValue     = $this->clearValue($addValue);
        $currency     = $this->clearCurrency($currency, $baseCurrency);

        $sign = '';
        if ($addValue[0] == '-' || $addValue[0] == '+') {
            $sign = $addValue[0];
        }

        if ($currency == '%') {
            $addValue = (float)($sign . abs($value * $addValue / 100));
        } else {
            $addValue = (float)($sign . abs($this->convert($currency, $baseCurrency, $addValue)));
        }

        if ($sign == '-' || $sign == '+') {
            $result = $value + $addValue;
        } else {
            $result = $addValue;
        }

        if ($result <= 0) {
            return 0;
        }

        return $result;
    }

    /**
     * Calculate with discount value
     * @param $value
     * @param $baseCurrency
     * @param $addValue
     * @param $currency
     * @return float
     */
    public function calcDiscount($value, $baseCurrency, $addValue, $currency)
    {
        $value        = $this->clearValue($value);
        $baseCurrency = $this->clearCurrency($baseCurrency);
        $addValue     = $this->clearValue($addValue);
        $currency     = $this->clearCurrency($currency, $baseCurrency);

        if ($currency == '%') {
            $addValue = $value * $addValue / 100;
        } else {
            $addValue = $this->convert($currency, $baseCurrency, $addValue);
        }

        $result = $value + $addValue;
        if ($result <= 0) {
            return 0;
        }

        return $result;
    }

    /**
     * To default number format
     * @param $value
     * @return string
     */
    public function toNumberFormat($value)
    {
        $value = $this->clearValue($value);
        return number_format($value, 0, '.', ' ');
    }
}
