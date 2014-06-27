<?php
/**
 * @version    $Id: index.php 20196 2011-01-09 02:40:25Z ian $
 * @package    Joomla.Site
 * @copyright  Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/* The following line gets the application object for things like displaying the site name */
$app = JFactory::getApplication();
$config = & JFactory::getConfig();
$menu = $app->getMenu();
$lang = JFactory::getLanguage();
$option = $_GET['option'];
$view = $_GET['view'];
$task = $_GET['task'];
  $itemid = JRequest::getVar('Itemid');
  $pmenu = $app->getMenu()->getActive();
  $pageclass = '';
 
  if (is_object($pmenu)) {
  	$pageclass = $pmenu->params->get('pageclass_sfx');
  }
?>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" >
<head>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<jdoc:include type="head" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/general.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/style.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/jquery.fancybox.css" type="text/css" />
<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/jquery.fancybox.pack.js"></script>
<script type="text/javascript">
	var $j = jQuery.noConflict();
    $j(document).ready(function(){
        $j('.fancybox').fancybox();
    });
</script>
</head>
<body  id="<?php echo $pageclass ? htmlspecialchars($pageclass) : 'default'; ?>" class="<?php echo $option.' '.$task. ' '. $view ; ?>">
<div id="wrapper">
	<div id="header" class="header">
		<div class="logos-area">
			<a href="<?php echo $this->baseurl ?>" class="logo">
                <jdoc:include type="modules" name="logo_module" style="xhtml"/>
			</a>
            <jdoc:include type="modules" name="main_menu__module" style="xhtml"/>
		</div>
		<jdoc:include type="modules" name="header" style="xhtml"/>
	</div><!-- #header-->

	<div id="middle">
		<div id="container">
            <jdoc:include type="modules" name="slider_module" style="xhtml"/>
            <jdoc:include type="modules" name="all_news_module" style="xhtml"/>
			<div id="content" class="content">
					<jdoc:include type="modules" name="top-content" style="xhtml"/>
					<jdoc:include type="message" />
					<jdoc:include type="component" />
					<jdoc:include type="modules" name="bottom-component" style="xhtml"/>
				
			</div><!-- #content-->
		</div><!-- #container-->

	</div><!-- #middle-->
</div><!-- #wrapper -->
<div id="footer" class="footer">
    <jdoc:include type="modules" name="footer_menu_module" style="xhtml"/>
		<jdoc:include type="modules" name="footer" style="xhtml"/>
</div>

<div style="display:none;">
    <div id="order-form">
    	<h3></h3>
		<jdoc:include type="modules" name="order-product-form" style="xhtml"/>
	</div>
</div>

</body>
</html>
