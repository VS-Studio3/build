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


class ElementJBCommentsRender extends Element implements iSubmittable
{
    /**
     * Has value
     * @param array $params
     * @return bool
     */
    public function hasValue($params = array())
    {
        return true;
    }

    /**
     * Render action
     * @param array $params
     * @return mixed
     */
    public function render($params = array())
    {
        $view = $this->app->jblayout->getView();

		if ($view) {
			!defined('JBZOO_COMMENTS_RENDERED') && define('JBZOO_COMMENTS_RENDERED', true);
			return $this->app->comment->renderComments($view, $this->getItem());
		} else {
			return null;
		}
    }

    /**
     * Edit action
     * @return bool
     */
    function edit()
    {
        // no params for item
        return false;
    }

    /**
     * Validate submission
     * @param $value
     * @param $params
     * @return array
     */
    public function validateSubmission($value, $params)
    {
        return array('value' => $value->get('value'));
    }

    /**
     * Render submition action
     * @param array $params
     * @return mixed
     */
    public function renderSubmission($params = array())
    {
        return $this->edit();
    }

}
