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


class ElementJBRelatedAuto extends Element
{

    /**
     * Related items
     * @var array
     */
    protected $_relatedItems = null;

    /**
     * Check, has value
     * @param array $params
     * @return bool
     */
    public function hasValue($params = array())
    {
        $items = $this->_getRelatedAuto($params);

        return !empty($items);
    }

    /**
     * Edit action
     * @return bool
     */
    function edit()
    {
        return false;
    }

    /**
     * Get related items
     * @param $params
     * @return array|null
     */
    private function _getRelatedAuto($params)
    {
        if ($this->_relatedItems === null) {

            $item  = $this->getItem();
            $model = JBModelRelated::model();

            $this->_relatedItems = $model->getRelated($item, $this->config, $params);

            return $this->_relatedItems;
        }

        return $this->_relatedItems;
    }

    /**
     * Render action
     * @param array $params
     * @return mixed
     */
    public function render($params = array())
    {
        // init vars
        $params = $this->app->data->create($params);

        $items = $this->_getRelatedAuto($params);

        $renderer = $this->app->renderer->create('item')->addPath(array($this->app->path->path('component.site:'), $this->_item->getApplication()->getTemplate()->getPath()));

        // create output
        $layout      = $params->get('layout');
        $itemsOutput = array();

        foreach ($items as $item) {

            if ($layout) {
                $itemsOutput[] = $this->app->jblayout->renderItem($item, $layout, $renderer);

            } elseif ($params->get('link_to_item', false) && $item->getState()) {
                $itemsOutput[] = '<a href="' . $this->app->route->item($item) . '" title="' . $item->name . '">' . $item->name . '</a>';

            } else {
                $itemsOutput[] = $item->name;
            }

        }

        if ($params->get('layout', false)) {
            if ($layout = $this->getLayout()) {
                return self::renderLayout(
                    $layout, array(
                        'items'   => $itemsOutput,
                        'columns' => $params->get('columns', 1)
                    )
                );
            }
        }

        return $this->app->element->applySeparators($params->get('separated_by'), $itemsOutput);
    }

    /**
     * Sort items
     * @param array $items
     * @param mixed $order
     * @return array
     */
    protected function _orderItems($items, $order)
    {
        // if string, try to convert ordering
        if (is_string($order)) {
            $order = $this->app->itemorder->convert($order);
        }

        $items    = (array)$items;
        $order    = (array)$order;
        $sorted   = array();
        $reversed = false;

        // remove empty values
        $order = array_filter($order);

        // if random return immediately
        if (in_array('_random', $order)) {
            shuffle($items);

            return $items;
        }

        // get order dir
        if (($index = array_search('_reversed', $order)) !== false) {
            $reversed = true;
            unset($order[$index]);
        } else {
            $reversed = false;
        }

        // order by default
        if (empty($order)) {
            return $reversed ? array_reverse($items, true) : $items;
        }

        // if there is a none core element present, ordering will only take place for those elements
        if (count($order) > 1) {
            $order = array_filter($order, create_function('$a', 'return strpos($a, "_item") === false;'));
        }

        if (!empty($order)) {

            // get sorting values
            foreach ($items as $item) {
                foreach ($order as $identifier) {
                    if ($element = $item->getElement($identifier)) {
                        $sorted[$item->id] =
                            strpos($identifier, '_item') === 0
                                ? $item->{str_replace('_item', '', $identifier)}
                                : $element->getSearchData();
                        break;
                    }
                }
            }

            // do the actual sorting
            $reversed ? arsort($sorted) : asort($sorted);

            // fill the result array
            foreach (array_keys($sorted) as $id) {
                if (isset($items[$id])) {
                    $sorted[$id] = $items[$id];
                }
            }

            // attach unsorted items
            $sorted += array_diff_key($items, $sorted);


            // no sort order provided
        } else {
            $sorted = $items;
        }

        return $sorted;
    }

    /**
     * Get config form
     * @return mixed
     */
    public function getConfigForm()
    {
        return parent::getConfigForm()->addElementPath(dirname(__FILE__));
    }

}
