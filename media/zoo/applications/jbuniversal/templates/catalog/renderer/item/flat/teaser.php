<?php
defined('_JEXEC') or die('Restricted access');
?>

<?php

if ($this->checkPosition("marked")&& trim($this->renderPosition("marked")) == "Yes"):?>
    <div class="realty-row item_<?php echo $item->id;?> marked-element">
<?php else: ?>
    <div class="realty-row item_<?php echo $item->id;?>">
<?php endif; ?>
    <div class="teaser-image"><div class="mark-vip"></div><?php echo $this->renderPosition('image'); ?></div>
    <div class="main-info">
        <?php echo $this->renderPosition('price'); ?>
        <div class="rooms clearfix">
            <div class="beds <?php if (!$this->renderPosition('baths')): ?>no-baths<?php endif;?> <?php if (!$this->renderPosition('baths')): ?>no-beds<?php endif;?>">
                <div class="value-beds marked-realty"><?php echo $this->renderPosition('beds'); ?></div>
                <div class="label-beds">Beds</div>
            </div>
            <?php if ($this->checkPosition('baths')): ?>
                <div class="baths">
                    <div class="value-baths marked-realty"><?php echo $this->renderPosition('baths'); ?></div>
                    <div class="label-baths">Baths</div>
                </div>
            <?php endif; ?>
        </div>
        <div class="realty-save">
            <?php echo $this->renderPosition('save'); ?>
        </div>
    </div>
    <div class="more-info">
        <div class="listing-date"><?php echo $this->renderPosition('date'); ?></div>
        <p class="address">
            <?php echo $this->renderPosition('address'); ?>
        </p>
        <div class="left-info">
            <?php if($this->checkPosition('year')): ?>
                <div>
                    Year Build:
                    <span><?php echo $this->renderPosition('year'); ?></span>
                </div>
            <?php endif; ?>
            <?php if($this->checkPosition('sqft')): ?>
                <div>
                    Sq Ft:
                    <span><?php echo $this->renderPosition('sqft'); ?></span>
                </div>
            <?php endif;?>
            <?php if($this->checkPosition('compare')): ?>
                <div class="realty-compare">
                    <?php echo $this->renderPosition('compare'); ?>
                </div>
            <?php endif;?>
        </div>
        <div class="right-info">
            <?php if($this->checkPosition('type')): ?>
                <div>
                    Type building:
                    <span><?php echo $this->renderPosition('type'); ?></span>
                </div>
            <?php endif;?>
            <?php if($this->checkPosition('additionally')): ?>
                <div>
                    Additionally:
                    <span><?php echo $this->renderPosition('additionally'); ?></span>
                </div>
            <?php endif;?>
            <?php if($this->checkPosition('agent')): ?>
                <div class="agent-info">
                    Listing courtesy of <?php echo $this->renderPosition('agent'); ?>
                </div>
            <?php endif;?>
        </div>


    </div>

</div>