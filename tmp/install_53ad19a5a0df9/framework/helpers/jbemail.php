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


class JBEmailHelper extends AppHelper
{
    /**
     * Send email by item template render
     * @param array  $recipients
     * @param string $emailSubject
     * @param Item   $item
     * @param string $layout
     */
    public function sendByItem($recipients, $emailSubject, Item $item, $layout)
    {
        // workaround to make sure JSite is loaded
        $this->app->loader->register('JSite', 'root:includes/application.php');

        // init vars
        $siteName     = $this->app->system->application->getCfg('sitename');
        $userItemUrl  = $this->app->route->item($item);
        $adminItemUrl = $this->app->jbrouter->adminItem($item);

        // render item
        $renderer = $this->app->renderer->create('item')->addPath(array(
            $this->app->path->path('component.site:'),
            $item->getApplication()->getTemplate()->getPath()
        ));

        $path = 'item';
        $type = $item->getType()->id;
        if ($renderer->pathExists($path . '/' . $type)) {
            $path .= '/' . $type;
        }

        $layoutPath = explode('.', $layout);

        $output = false;
        if (in_array($layoutPath[2], $renderer->getLayouts($path))) {
            $output = $renderer->render($layout, array(
                'item'         => $item,
                'siteName'     => $siteName,
                'userItemUrl'  => $userItemUrl,
                'adminItemUrl' => $adminItemUrl,
            ));
            $output = $this->_filterBody($output);
        }

        if ($output) {
            // send email to $recipients
            $recipients = explode(',', $recipients);
            foreach ($recipients as $email) {

                $email = JString::trim($email);

                if (empty($email)) {
                    continue;
                }

                $mail = $this->app->mail->create();

                foreach ($item->getElements() as $element) {
                    if ('ElementDownload' == get_class($element) && $element->hasValue()) {
                        $file = $this->app->path->path('root:' . $element->get('file'));
                        $mail->addAttachment($file, basename($element->get('file')));
                    }
                }

                $mail->setSubject($emailSubject . ' - ' . $siteName);
                $mail->setBody($output);
                $mail->isHTML(true);
                $mail->addRecipient($email);
                $mail->Send();
            }
        }
    }

    /**
     * Filter email body
     * @param $html
     * @return mixed
     */
    protected function _filterBody($html)
    {
        $html = preg_replace("#<script.*?/script>#ius", '', $html);
        $html = preg_replace("#<style.*?/style>#ius", '', $html);
        $html = preg_replace("#<!--.*?-->#ius", '', $html);
        $html = JString::trim($html);

        return $html;
    }
}

;