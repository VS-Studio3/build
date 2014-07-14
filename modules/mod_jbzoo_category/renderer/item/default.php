<?php
/**
 * JBZoo App is universal Joomla CCK, application for YooTheme Zoo component
 *
 * @package     jbzoo
 * @version     2.x Pro
 * @author      JBZoo App http://jbzoo.com
 * @copyright   Copyright (C) JBZoo.com,  All rights reserved.
 * @license     http://jbzoo.com/license-pro.php JBZoo Licence
 * @coder       Vitaliy Yanovskiy <joejoker@jbzoo.com>
 */

// no direct access
defined('_JEXEC') or die('Restricted access');


?>
<div class="wrapper-item-desc">
    <div class="city_val">
    <?php if ($this->checkPosition('name')) : ?>
        <?php echo $this->renderPosition('name'); ?>
    <?php endif; ?>
    </div>
    
    <div class="address_val">
    <?php if ($this->checkPosition('address')) : ?>
        <?php echo $this->renderPosition('address'); ?>
    <?php endif; ?>
    </div>
    
    <div class="telephones_val">
    <?php if ($this->checkPosition('telephones')) : ?>
        <?php echo $this->renderPosition('telephones'); ?>
    <?php endif; ?>
    </div>
</div>