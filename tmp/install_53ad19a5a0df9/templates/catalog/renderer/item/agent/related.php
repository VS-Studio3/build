<?php defined('_JEXEC') or die('Restricted access'); ?>

<div class="agent_teaser">
    <?php if ($this->checkPosition('photo')) : ?>
        <div class="photo"><?php echo $this->renderPosition('photo'); ?></div>
    <?php endif; ?>
    <?php if ($this->checkPosition('title')) : ?>
        <div class="name"><?php echo $this->renderPosition('title'); ?></div>
    <?php endif; ?>
    <?php if ($this->checkPosition('rating')) : ?>
    <div class="name"><?php echo $this->renderPosition('rating'); ?></div>
    <?php endif; ?>
    <div class="clear clr"></div>
    <?php if ($this->checkPosition('contacts')) : ?>
        <ul class="contacts">
    	<?php echo $this->renderPosition('contacts', array('style' => 'list')); ?>
        </ul>
    <?php endif; ?>
</div>