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

$this->app->jbassets->jqueryAccordion();
 $user =& JFactory::getUser();
?>


<p>Здравствуйте, <?php echo $this->renderPosition('name'); ?> <br>
Вы сделали покупку в <a href="http://traviuga.ru/">Интернет-магазине Лекарственные травы Юга России</a>. <br><br>

<b>Ваши доступы в личный кабинет:</b><br>
Логин - <?php echo $user->email ?> <br>
Пароль - <?php echo $user->email ?> <br><br>


<b>Номер заказа: <?php echo $item->id ?></b> </p>
<br>
<b>Вы заказали:</b>
<?php if ($this->checkPosition('items')) : ?>
    <?php echo $this->renderPosition('items'); ?>
<?php endif; ?>

<br>
<?php if ($this->checkPosition('buyer-info')) : ?>
    <div>Ваш заказ будет доставлен по адресу:</div>
    <ul class="buyer-info">
        <?php echo $this->renderPosition('buyer-info', array('style' => 'email'));?>
    </ul>
<?php endif; ?>

<p>В итоговую сумму не включена стоимость пересылки (она зависит от массы заказа и дальности доставки). Заказ будет отправлен в течение 2-х дней.</p> 

<p><strong>ВНИМАНИЕ</strong>. В связи с тем, что извещения часто теряются, просьба через 2-3 недели поинтересоваться о приходе бандероли на почте. Если Вы делаете заказ из-за рубежа, необходима предоплата. О подробностях Вы можете узнать по электронной почте.</p>
<p>Пожалуйста, подтвердите свой заказ в течение 48 часов, перейдя по ссылке: <strong><a href="<?php echo JURI::base(); ?>confirm.php?order_num=<?php echo $item->id ?>">ПОДТВЕРЖДЕНИЕ ЗАКАЗА</strong>, иначе он не будет выслан.</p>

<p><em>С уважением, Ольга Васильевна. <br>Лекарственные травы Юга России <br>e-mail: fito3@yandex.ru <br>travmag.ru</em></p>