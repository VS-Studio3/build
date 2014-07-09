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

<tr class="table-row item_<?php echo $item->id;?>">
    <td><?php echo $this->renderPosition('cell1'); ?></td>
    <td><?php
        if ($html = $this->renderPosition('cell2')) {
            echo $html;
        } else {
            echo ' - ';
        }
    ?></td>
    <td><?php echo $this->renderPosition('cell3'); ?></td>
    <td><?php echo $this->renderPosition('cell4'); ?></td>
    <td><?php echo $this->renderPosition('cell5'); ?></td>
    <td><?php echo $this->renderPosition('cell6'); ?></td>
    <td><?php echo $this->renderPosition('cell7'); ?></td>
    <td><?php echo $this->renderPosition('cell8'); ?></td>
</tr>