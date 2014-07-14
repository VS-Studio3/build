<div class="order_form">
    <?php echo $this->renderPosition("fio"); ?>
    <?php echo $this->renderPosition("company"); ?>
    <?php echo $this->renderPosition("telephone"); ?>
    <?php echo $this->renderPosition("email"); ?>

    <div id="joomla_template_samovuvoz">
        <?php echo $this->renderPosition("sposob_dostavki"); ?>
    </div>

    <div id="joomla_template_dostavka">
    Адрес доставки:
    <?php echo $this->renderPosition("city"); ?>
    <?php echo $this->renderPosition("street"); ?>
    <?php echo $this->renderPosition("house"); ?>
    <?php echo $this->renderPosition("data_dostavki"); ?>
    <div id="current_date"></div>
    <?php echo $this->renderPosition("vremya_dostavki"); ?>
    </div>
    
    <?php echo $this->renderPosition("comments"); ?>

    <div id="go_to_paying">Продолжить</div>
</div>

<div class="pay_for_products">
    <?php echo $this->renderPosition("sposob_oplati"); ?>
</div>