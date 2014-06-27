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


class ElementJBGallery extends Element implements iSubmittable
{
    /**
     * @var string
     */
    protected $_uri = null;

    /**
     * @var string
     */
    protected $_root = null;

    /**
     * @var string
     */
    protected $_path = null;

    /**
     * @var int
     */
    static $galleryCount = 1;

    /**
     * Check, has value
     * @param array $params
     * @return bool
     */
    public function hasValue($params = array())
    {
        // init vars
        $value     = $this->_data->get('value');
        $directory = $this->config->get('directory');
        $directory = JPATH_ROOT . '/' . trim($directory, '/') . '/' . trim($value, '/');

        return !empty($value) && is_readable($directory) && is_dir($directory);
    }

    /**
     * Render action
     * @param array $params
     * @return null|string
     */
    public function render($params = array())
    {
        // init vars
        $this->_uri  = JURI::base();
        $this->_path =
                JPATH_ROOT . '/' . trim($this->config->get('directory'), '/') . '/' . trim($this->_data->get('value'), '/');


        // set params
        $parameter = $this->app->parameter->create()
                ->loadArray((array)$this->config)
                ->loadArray($params);

        // get thumbnails
        $thumbs = $this->_getThumbnails($parameter);

        // no thumbnails found
        if (!count($thumbs)) {
            return null;
        }

        // sort thumbnails
        $thumbs = $this->_sortThumbnails($thumbs, $parameter->get('order', 'asc'));

        // limit thumbnails to count
        $count = intval($parameter->get('count', 0));
        if ($count > 0 && $count < count($thumbs)) {
            $thumbs = array_slice($thumbs, 0, $count);
        }

        // init template vars
        $rel = $galleryId = 'gallery-' . self::$galleryCount++;

        // render layout
        if ($layout = $this->getLayout()) {
            return self::renderLayout($layout, compact('thumbs', 'galleryId', 'rel'));
        }

        return null;
    }

    /**
     * Edit action
     * @return null|string
     */
    public function edit()
    {
        // init vars
        $directory = 'root:' . $this->config->get('directory');

        if ($layout = $this->getLayout('edit.php')) {
            return self::renderLayout(
                $layout,
                array(
                    'element'   => $this->identifier,
                    'directory' => $directory,
                    'value'     => $this->_data->get('value')
                )
            );
        }

        return null;

    }

    /**
     * Get thumbnails
     * @param ParameterData $params
     * @return array
     */
    protected function _getThumbnails($params)
    {
        $thumbs = array();
        $width  = $params->get('width');
        $height = $params->get('height');
        $resize = $params->get('resize', 1);
        $title  = $this->_data->get('title', '');

        $files = JFolder::files($this->_path, '.', false, true, array('.svn', 'CVS', '.DS_Store'));
        $files = array_filter(
            $files, create_function('$file', 'return preg_match("#(\.bmp|\.gif|\.jpg|\.jpeg|\.png)$#i", $file);')
        );

        // set default thumbnail size, if incorrect sizes defined
        $width  = intval($width);
        $height = intval($height);
        if ($width < 1 && $height < 1) {
            $width  = 100;
            $height = null;
        }

        foreach ($files as $file) {

            $filename = basename($file);
            $thumb    = $this->app->zoo->resizeImage($file, $width, $height);

            // if thumbnail exists, add it to return value
            if (file_exists($thumb)) {

                // set image name or title if exsist
                $name = '';
                if (isset($desc_array[$filename])) {
                    $name = $desc_array[$filename];
                }

                // get image info
                list($thumb_width, $thumb_height) = @getimagesize($thumb);

                $thumbs[] = array(
                    'name'         => $name,
                    'filename'     => $filename,
                    'img'          => $this->_uri . $this->_getRelativePath($file),
                    'img_file'     => $file,
                    'thumb'        => $this->_uri . $this->_getRelativePath($thumb),
                    'thumb_width'  => $thumb_width,
                    'thumb_height' => $thumb_height
                );
            }
        }

        return $thumbs;
    }

    /**
     * Sort thumbnails
     * @param $thumbs
     * @param $order
     * @return array
     */
    protected function _sortThumbnails(&$thumbs, $order)
    {
        usort($thumbs, create_function('$a,$b', 'return strcmp($a["filename"], $b["filename"]);'));

        if ($order == 'random') {
            shuffle($thumbs);
        }

        if ($order == 'desc') {
            $thumbs = array_reverse($thumbs);
        }

        return $thumbs;
    }

    /**
     * Get relativePath
     * @param string $file
     * @return string
     */
    protected function _getRelativePath($file)
    {
        return JString::trim(str_replace('\\', '/', preg_replace('/^' . preg_quote(JPATH_ROOT, '/') . '/i', '', $file)), '/');
    }

    /**
     * Validate submission
     * @param JSONData $value
     * @param JSONData $params
     * @return array
     * @throws AppValidatorException
     */
    public function validateSubmission($value, $params)
    {
        $folder    = $value->get('value');
        $directory = $this->app->path->path('root:' . trim($this->config->get('directory'), '/\\') . '/' . trim($folder, '/\\'));

        if (!$directory) {
            throw new AppValidatorException('This directory does not exist');
        }

        return array(
            'value' => $value
        );
    }

    /**
     * @param array $params
     * @return null|string
     */
    public function renderSubmission($params = array())
    {
        return $this->edit($params);
    }

}
