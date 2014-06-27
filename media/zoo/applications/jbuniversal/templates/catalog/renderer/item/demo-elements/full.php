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


?>
<div class="full_element">

    <?php if ($this->checkPosition('title')) : ?>
    <h1 class="title"><?php echo $this->renderPosition('title'); ?></h1>
    <?php endif; ?>


    <?php
    if ($this->checkPosition('elements')) : ?>
        <div id="tab-text">
            <?php
            echo $this->renderPosition('elements', array(
                'style'    => 'jbblock',
                'tag'      => 'div',
                'labelTag' => 'h3',
                'clear'    => true
            ));
            ?>
        </div>
        <?php
    endif;
    ?>

    <div class="clr"></div>
</div>
