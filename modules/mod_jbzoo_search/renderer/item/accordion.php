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

$zoo = App::getInstance('zoo');
$zoo->jbassets->jqueryAccordion();
?>
<div class="filter-form jsAccordion">
    <?php
    for ($i = 1; $i <= 10; $i++) {
        echo $this->renderPosition('tab-' . $i, array(
                'moduleParams' => $params,
                'style'        => 'filter.tab',
            )
        );
    }
    ?>
</div>
