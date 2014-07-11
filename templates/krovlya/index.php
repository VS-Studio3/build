<?php
defined('_JEXEC') or die;

/* The following line gets the application object for things like displaying the site name */
$app = JFactory::getApplication();
$config = JFactory::getConfig();
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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<jdoc:include type="head" />
    <meta charset="utf-8" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/system.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/system/css/general.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/style.css" type="text/css" />
<link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/jquery.fancybox.css" type="text/css" />
<script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/jquery.fancybox.pack.js"></script>

    <link rel="stylesheet" href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/css/jquery.fancybox.css" type="text/css" />
    <script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/fancyBox/source/jquery.fancybox.pack.js"></script>
    <script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template ?>/js/underscore.js"></script>

    <!--JS-Класс приложения-->
    <script type="text/javascript" src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template; ?>/js/custom.js"></script>
    <script type="text/javascript">
        $j(document).ready(function () {
            Get3UlMenu.getHTMLFirstMenu();
            $j.getJSON("<?php echo $this->baseurl ?>/media/zoo/applications/jbuniversal/types/product.config", function (data) {
                ChangingCity.getModalWindows(data);
            });
        });
    </script>
</head>
<body  id="<?php echo $pageclass ? htmlspecialchars($pageclass) : 'default'; ?>" class="<?php echo $option.' '.$task. ' '. $view ; ?>">
<!-- МОДАЛЬНОЕ ОКНО ДЛЯ ВЫБОРА ГОРОДА-->
    <div id="modal_cities">
        <div>Выберите пожалуйста Ваш город проживания</div>
        <div class="cities"></div>
    </div>
<!---->

<div id="wrapper">
	<div id="header" class="header">

        <div class="logotype">
            <a href="<?php echo $this->baseurl ?>"><img src="<?php
                echo $this->baseurl ?>/templates/<?php echo $this->template ?>/images/logotype.png"></a>
        </div>
        <div class="search">
            <div>
                <a href="#"><span class="twitter"></span></a>
                <a href="#"><span class="facebook"></span></a>
                <a href="#"><span class="vk"></span></a>
            </div>
            <div class="basket">
                <p>bla bla bla</p>
            </div>
        </div>
        <div class="contact">
            <p class="number">+7 (000) 000 00 00</p>

           <div class="only_for_btn"> <div class="btn_city" style="margin-bottom: 20px;"></div></div>
            <div id="list_of_cities_div">
                <a href="#" class="close">ЗАКРЫТЬ X</a>
                <div class="current_city"></div>
                <div id="list_of_cities"></div>
            </div>

            <p class="online"><a class="btn btn_zayavka" href="#zayavka"><span class="icon"></span>On-line заявка</a></p>
            <p><a class="btn btn_zvonok" href="#zvonok"><span class="icon_two"></span>заказать звонок</a></p>
        </div>

		<div class="logos-area">
			<a href="<?php echo $this->baseurl ?>" class="logo">
                <jdoc:include type="modules" name="logo_module" style="xhtml"/>
			</a>
            <jdoc:include type="modules" name="main_menu__module" style="xhtml"/>
		</div>
		<jdoc:include type="modules" name="header" style="xhtml"/>
	</div><!-- #header-->

	<div id="middle">
        <div id="zayavka">
            <jdoc:include type="modules" name="zayavka_module" style="xhtml"/>
        </div>

        <div id="zvonok">
            <jdoc:include type="modules" name="zvonok_module" style="xhtml"/>
        </div>

		<div id="container">
            <jdoc:include type="modules" name="slider_module" style="xhtml"/>

            <?php if ($this->countModules( 'all_news_module' )) : ?>
            <div class="newss">
            <jdoc:include type="modules" name="all_news_module" style="xhtml"/>
            </div>
            <?php endif; ?>

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
    <a href="#"><img src="<?php echo $this->baseurl ?>/templates/<?php echo $this->template
        ?>/images/footer_logotype.png"></a>
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
