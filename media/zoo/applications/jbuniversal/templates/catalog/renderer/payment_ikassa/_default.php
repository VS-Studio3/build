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


$view = $this->getView();
$data = $vars['object'];

?>

<p style="height:36px;">
    <!--noindex-->
    <a href="http://www.interkassa.com/" target="_blank" rel="nofollow"><img
            src="media/zoo/applications/jbuniversal/assets/img/payments/interkassa.png"></a>
    <!--/noindex-->
</p>

<form name="payment" action="https://www.interkassa.com/lib/payment.php" method="post"
      enctype="application/x-www-form-urlencoded">

    <input type="hidden" name="ik_shop_id" value="<?php echo $data->get('shopid'); ?>">
    <input type="hidden" name="ik_payment_amount" value="<?php echo $data->get('summ'); ?>">
    <input type="hidden" name="ik_payment_id" value="<?php echo $data->get('orderId'); ?>">
    <input type="hidden" name="ik_payment_desc"
           value="Order #<?php echo $data->get('orderId'); ?> form <?php echo JUri::getInstance()->getHost(); ?>">

    <input type="submit" style="display:inline-block;" class="add-to-cart"
           value="<?php echo JText::_('JBZOO_PAYMENT_BUTTON'); ?>"/>
</form>