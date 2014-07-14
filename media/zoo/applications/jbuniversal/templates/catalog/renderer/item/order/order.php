<!-- Список городов по областям-->
<div id="cities_module_wrapper">
    <jdoc:include type="modules" name="cities_module" style="xhtml"/>
</div>
<!---->

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
        <div id="current_city_form">
            <?php echo $this->renderPosition("city"); ?>
        </div>
        <?php echo $this->renderPosition("street"); ?>
        <?php echo $this->renderPosition("house"); ?>

        <div id="current_date_form">
            <?php echo $this->renderPosition("data_dostavki"); ?>
            <div id="current_date"></div>
        </div>
        <?php echo $this->renderPosition("vremya_dostavki"); ?>
    </div>

    <?php echo $this->renderPosition("comments"); ?>

    <div id="go_back_products">Назад</div>
    <div id="go_to_paying">Продолжить</div>
</div>

<div class="pay_for_products">
    <?php echo $this->renderPosition("sposob_oplati"); ?>
    <div id="go_back_paying">Назад</div>
</div>

<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script type="text/javascript">
    $j.datepicker.regional['ru'] = {
        closeText: 'Закрыть',
        prevText: '&#x3c;Пред',
        nextText: 'След&#x3e;',
        currentText: 'Сегодня',
        monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь',
            'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        monthNamesShort: ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн',
            'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
        dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
        dayNamesShort: ['вск', 'пнд', 'втр', 'срд', 'чтв', 'птн', 'сбт'],
        dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
        weekHeader: 'Не',
        dateFormat: 'dd.mm.yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''};
    $j.datepicker.setDefaults($j.datepicker.regional['ru']);

    $j('#basket').addClass('active');
    $j('#order_form, #pay_for_products').addClass('un_active');

    $j('.order_form, .pay_for_products, .required-info, #yoo-zoo h1, #joomla_template_dostavka').hide();
    $j('#item-submission').prev('h2').hide();

    $j("#joomla_template_samovuvoz input:radio").eq(0).prop("checked", true);
    $j("#joomla_template_dostavka input:radio").eq(0).prop("checked", true);

    $j("#joomla_template_dostavka input:text:last").datepicker({
        onSelect: function(dateText, inst) {
            $j('#current_date').html(inst.selectedDay);
        }
    });

    var isDostavkaKureromChecked = false;

    //Самовывоз или доставка курьером
    $j('#joomla_template_samovuvoz input:radio').click(function() {
        if ($j(this).val() == 'dostavka-kurerom') {
            $j('#joomla_template_dostavka').slideDown(500);
            isDostavkaKureromChecked = true;
        }
        else {
            $j('#joomla_template_dostavka').slideUp(500);
            isDostavkaKureromChecked = false;
        }
    });

    //Переход на способ доставки
    $j('#go_to_order').click(function() {
        $j('#order_form').addClass('active').removeClass('un_active');
        $j('#basket').removeClass('active').addClass('un_active');

        $j('.basket').hide();
        $j('.order_form').show();
    });

    //Переход на способ оплаты
    $j('#go_to_paying').click(function() {
        var isDataValid = true;

        if ($j('.order_form input:text').eq(0).val().length == 0
                || $j('.order_form input:text').eq(2).val().length == 0
                || $j('.order_form input:text').eq(3).val().length == 0) {
            isDataValid = false;
        }

        if (isDostavkaKureromChecked) {
            $j('#joomla_template_dostavka input:text').each(function() {
                if ($j(this).val().length == 0) {
                    isDataValid = false;
                }
            });
        }

        if (isDataValid) {
            $j('#pay_for_products').addClass('active').removeClass('un_active');
            $j('#order_form').removeClass('active').addClass('un_active');

            $j('.order_form').hide();
            $j('.pay_for_products').show();
        }
        else
            alert('Заполните поля, отмеченные *');
    });
    
    //Назад к товарам
    $j('#go_back_products').click(function() {
        $j('#basket').addClass('active').removeClass('un_active');
            $j('#order_form').removeClass('active').addClass('un_active');

            $j('.order_form').hide();
            $j('.basket').show();
    });
    
    //Назад к оформлению
    $j('#go_back_paying').click(function() {
        $j('#order_form').addClass('active').removeClass('un_active');
            $j('#pay_for_products').removeClass('active').addClass('un_active');

            $j('.pay_for_products').hide();
            $j('.order_form').show();
    });
    
    var citiesList = $j('#cities_module_wrapper');
    
    setSamovivozContent(CookieObject.find('city'), citiesData);
</script>