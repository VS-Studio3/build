<?php
/**
 * JBZoo App is universal Joomla CCK, application for YooTheme Zoo component
 *
 * @package     jbzoo
 * @version     2.x Pro
 * @author      JBZoo App http://jbzoo.com
 * @copyright   Copyright (C) JBZoo.com,  All rights reserved.
 * @license     http://jbzoo.com/license-pro.php JBZoo Licence
 * @coder       Denis Smetannikov <denis@jbzoo.com>
 */

// no direct access
defined('_JEXEC') or die('Restricted access');


/**
 * Class JBModelRelated
 */
class JBModelRelated extends JBModel
{

    /**
     * Create and return self instance
     * @return JBModelRelated
     */
    public static function model()
    {
        return new self();
    }

    /**
     * Get auto related items
     * @param Item $item
     * @param JSONData $config
     * @param JSONData $params
     * @return array
     */
    public function getRelated(Item $item, $config, $params)
    {
        $this->app->jbdebug->mark('model::getRelated::start');

        $cacheHash = sha1(serialize((array)$params) . '||' . serialize((array)$config) . '||itemid-' . $item->id);
        $cacheKey  = 'related-items';

        if (!($result = $this->app->jbcache->get($cacheHash, $cacheKey))) {

            $searchMethod = (int)$params->get('search-method', 2);

            $data   = $this->_getSearchData($item, $params);
            $rows   = $this->_getFromDatabase($item, $data, $searchMethod, $params);
            $result = $this->_sortByRelevant($rows, $params);

            $this->app->jbcache->set($cacheHash, $result, $cacheKey);
        }

        $this->app->jbdebug->mark('model::getRelated::loadItems');
        $result = $this->getZooItemsByIds(array_keys($result));

        $this->app->jbdebug->mark('model::getRelated::end');

        return $result;
    }

    /**
     * Sort db result by relevant
     * @param Array $rows
     * @param JSONData $params
     * @return array
     */
    protected function _sortByRelevant($rows, $params)
    {
        $resultTmp = array();
        foreach ($rows as $row) {
            $id = $row['id'];
            unset($row['id']);
            $resultTmp[$id] = $row;
        }

        $relevant = (int)$params->get('relevant', 5);
        
        $result = array();        
        foreach ($resultTmp as $itemId => $row) {
            $result[$itemId] = array_sum($row);
            
            if ($result[$itemId] == 0) {
                unset($result[$itemId]);
                continue;
            }

            if ($relevant > 0 && $result[$itemId] < $relevant) {
                unset($result[$itemId]);
            }

        }

        arsort($result);

        return array_slice($result, 0, (int)$params->get('count', 4), true);
    }

    /**
     * Get all item from database
     * @param Item $item
     * @param Array $data
     * @param Int $searchMethod
     * @param Array $params
     * @return array
     */
    protected function _getFromDatabase(Item $item, $data, $searchMethod, $params)
    {
        $having       = array();
        $selectFields = array('tItem.id AS id');

        $itemType  = $item->getType()->id;
        $tableName = $this->_jbtables->getIndexTable($itemType, 'str');
        $columns   = $this->_jbtables->getFields($this->_jbtables->getIndexTable($item->getType()->id));

        $select = $this->_getItemSelect()
            ->clear('select')
            ->leftJoin($tableName . ' AS tIndex ON tIndex.item_id = tItem.id')
            ->where('tItem.id <> ?', $item->id)
            ->group('tItem.id');

        foreach ($data as $elementId => $elemValues) {

            $elemValues = $this->_toCleanArray((array)$elemValues, $searchMethod);
            if (is_null($elemValues)) {
                continue;
            }

            $tableFieldName = 'tIndex.' . $elementId;

            if ($elementId == $this->_jbtables->getFieldName('_itemname')) {
                $tableFieldName = 'tItem.name';

            } else if ($elementId == $this->_jbtables->getFieldName('_itemtag')) {
                $select->leftJoin(ZOO_TABLE_TAG . ' AS tTag ON tTag.item_id = tItem.id');
                $tableFieldName = 'tTag.name';

            } else if ($elementId == $this->_jbtables->getFieldName('_itemcategory')) {
                $select->leftJoin(ZOO_TABLE_CATEGORY_ITEM . ' AS tCategoryItem ON tCategoryItem.item_id = tItem.id');
                $tableFieldName = 'tCategoryItem.category_id';

            } else if (!in_array($elementId, $columns, true)) {
                continue;
            }

            if ($searchMethod == 1) {
                $selectFields[] = 'SUM(('
                    . ' IF(' . $tableFieldName . ' = ' . implode(', 1, 0) + IF(' . $tableFieldName . ' = ', $elemValues) . ', 1, 0))'
                    . ') AS ' . $elementId;

            } else {
                $selectFields[] = 'SUM(('
                    . ' IF(' . $tableFieldName
                    . ' LIKE "%' . implode('%", 1, 0) + IF(' . $tableFieldName . ' LIKE "%', $elemValues) . '%", 1, 0))'
                    . ') AS ' . $elementId;
            }

            // collect where data
            $having[] = $elementId . ' = ""';
        }

        $select->select($selectFields);

        if (!empty($having)) {
            $select->having('NOT (' . implode("\n AND ", $having) . ')');
        }

        if ((int)$params->get('check_app', 0)) {
            $select->where('tItem.application_id = ?', $item->application_id);
        }

        if ((int)$params->get('check_type', 0)) {
            $select->where('tItem.type = ?', $item->getType()->id);
        }

        if ($checkCategory = (int)$params->get('check_category', 1)) {

            if ($checkCategory == 1) {
                $categoryId = $item->getPrimaryCategoryId();
                $select
                    ->leftJoin(ZOO_TABLE_CATEGORY_ITEM . ' AS tCategory ON tCategory.item_id = tItem.id')
                    ->where('tCategory.category_id = ?', $categoryId);
            }

            if ($checkCategory == 2) {
                $categoryIds = $item->getRelatedCategoryIds();
                $select
                    ->innerJoin(ZOO_TABLE_CATEGORY_ITEM . ' AS tCategory ON tCategory.item_id = tItem.id')
                    ->where('tCategory.category_id IN (' . implode(',', $categoryIds) . ')');
            }
        }

        // clean query for optimization
        $db = JFactory::getDbo();
        $db->setQuery((string)$select);
        $rows = $db->loadAssocList();

        return $rows;
    }

    /**
     * Check is value empty
     * @param $value
     * @return bool
     */
    protected function _isEmpty($value)
    {
        return (empty($value) && ($value !== 0 || $value !== "0"));
    }

    /**
     * Convert data to clean array
     * @param $elemValues
     * @param $searchMethod
     * @return array
     */
    protected function _toCleanArray($elemValues, $searchMethod = 1)
    {

        foreach ($elemValues as $key => $elemValue) {

            if (is_array($elemValue)) {

                foreach ($elemValue as $innerKey => $innerValue) {
                    if ($this->_isEmpty($innerValue)) {
                        unset($elemValue[$innerKey]);
                    }
                }

                $elemValues[$key] = $elemValue;

            } else if ($this->_isEmpty($elemValue)) {
                unset($elemValues[$key]);
            }
        }

        $elemValues = $this->_quote($elemValues);

        if ($searchMethod != 1) {
            foreach ($elemValues as $key => $elemValue) {
                $elemValues[$key] = JString::trim($elemValue, '\'"');
            }
        }

        return (!empty($elemValues) ? $elemValues : null);
    }


    /**
     * Get search data from item
     * @param Item $item
     * @param JSONData $params
     * @return array
     */
    protected function _getSearchData(Item $item, $params)
    {
        $tmpConds       = $params->get('conditions', array());
        $checkedFields  = $params->get('check_fields', array());
        $itemCategories = JBModelSearchindex::model()->getRelatedCategoryIds($item->id);

        // get manualy conditions
        $conds = array();
        foreach ($tmpConds as $cond) {
            if (isset($cond['key']) && !empty($cond['key'])) {
                $key         = preg_replace('#[^0-9a-z\_\-]#i', '', $cond['key']);
                $conds[$key] = $cond['value'];
            }
        }

        // get search data
        $tmpResult = array(
            '_itemcategory'  => $itemCategories,
            '_itemfrontpage' => (int)in_array('0', $itemCategories, true),
            '_itemname'      => $item->name,
            '_itemtag'       => $item->getTags(),
        );

        $elements = $item->getElements();
        foreach ($elements as $element) {
            if ($data = $element->getSearchData()) {
                $tmpResult[$element->identifier] = JString::trim($data);
            }
        }

        $tmpResult = array_merge($tmpResult, $conds);

        // build result
        $result = array();
        foreach ($tmpResult as $id => $values) {

            if (!empty($checkedFields) && !in_array($id, $checkedFields, true)) {
                continue;
            }

            $result[$this->_jbtables->getFieldName($id)] = $values;
        }

        return $result;
    }

}
