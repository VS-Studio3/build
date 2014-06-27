<?php defined('_JEXEC') or die('Restricted access'); ?>

<?php if ($this->checkPosition('title')) : ?>
	<h1 class="title"><?php echo $this->renderPosition('title'); ?></h1>
<?php endif; ?>

<?php if ($this->checkPosition('gallery')) : ?>
    <div class="full-gallery">
        <?php echo $this->renderPosition('gallery'); ?>
    </div>
<?php endif; ?>
<div class="info-flat">
    <?php if ($this->checkPosition('properties')) : ?>
        <td>
            <div class="price">
                <?php echo $this->renderPosition('price'); ?>
            </div>
            <ul class="properties">
               <?php echo $this->renderPosition('properties', array('style'=>'list')); ?>
            </ul>
            <div class="agent">
                <?php echo $this->renderPosition('agent'); ?>
            </div>
        </td>
    <?php endif; ?>
</div>

<div class="clear clr"></div>
<?php if ($this->checkPosition('text')) : ?>
    <div class="description_text">
        <?php echo $this->renderPosition('text'); ?>
    </div>
<?php endif; ?>
<div class="clear clr"></div>