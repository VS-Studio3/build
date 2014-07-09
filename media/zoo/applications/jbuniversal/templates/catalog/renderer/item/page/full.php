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
	
    
	<?php if ($this->checkPosition('text')) : ?>
		<?php echo $this->renderPosition('text', array('style' => 'block')); ?>
	<?php endif; ?>


    <?php if ($this->checkPosition('related')) { ?>
        <h3>See also:</h3>
        <ul>
            <?php echo $this->renderPosition('related'); ?>
        </ul>
    <?php } ?>    
    
    
    <?php if ($this->checkPosition('meta')) { ?>
        <h3>Meta:</h3>
        <ul>
            <?php echo $this->renderPosition('meta',array('style'=>'list')); ?>
        </ul>
    <?php } ?>
	
    
	<div class="clr"></div>
</div>		