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
<table class="filter-table">
    <tr>
        <td style="width:25%;"><?php echo  $this->renderPosition('cell_1_1', array('style' => 'filter.block'));?></td>
        <td style="width:25%;"><?php echo  $this->renderPosition('cell_1_2', array('style' => 'filter.block'));?></td>
        <td style="width:25%;"><?php echo  $this->renderPosition('cell_1_3', array('style' => 'filter.block'));?></td>
        <td style="width:25%;"><?php echo  $this->renderPosition('cell_1_4', array('style' => 'filter.block'));?></td>
    </tr>
    <tr>
        <td style="width:25%;"><?php echo  $this->renderPosition('cell_2_1', array('style' => 'filter.block'));?></td>
        <td style="width:25%;"><?php echo  $this->renderPosition('cell_2_2', array('style' => 'filter.block'));?></td>
        <td style="width:25%;"><?php echo  $this->renderPosition('cell_2_3', array('style' => 'filter.block'));?></td>
        <td style="width:25%;" class="controls">
            <input type="submit" name="submit" value="<?php echo JText::_('JBZOO_BUTTON_SUBMIT');?>" class="jsSubmit button rborder" />
        </td>
    </tr>
</table>

