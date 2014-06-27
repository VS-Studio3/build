<?php
defined('_JEXEC') or die('Restricted access');

?>
<div class="full_element">

	<?php if ($this->checkPosition('title')) : ?>
		<h1 class="title"><?php echo $this->renderPosition('title'); ?></h1>
	<?php endif; ?>

    <?php if ($this->checkPosition('company')) : ?>
        <h2><?php echo $this->renderPosition('company'); ?></h2>
    <?php endif; ?>

    <?php if ($this->checkPosition('image')) { ?>
		<div class="photo-agent"><?php echo $this->renderPosition('image');?></div>
	<?php } ?>

    <?php if ($this->checkPosition('text')) : ?>
        <?php echo $this->renderPosition('text', array('style' => 'block')); ?>
    <?php endif; ?>

    <?php if ($this->checkPosition('list')) {
		echo '<ul class="list conact-agent">'.$this->renderPosition('list',array('style'=>'list')).'</ul>';
	}?>
	
	<div class="clr clear"></div>
</div>
