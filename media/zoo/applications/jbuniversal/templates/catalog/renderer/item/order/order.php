<!-- Список городов по областям-->
<div id="cities_module_wrapper">
    <jdoc:include type="modules" name="cities_module" style="xhtml"/>
</div>
<!---->

<div class="order_form">
    <div id="order_title">Просим обязательно заполнять поля, отмеченные *.</div>
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
        <div id="vremya_dostavki_wrapper">
            <?php echo $this->renderPosition("vremya_dostavki"); ?>
        </div>
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
    $j(function() {
        $j('.pay_for_products input:radio:eq(0) + label').after('<div class="option">Вы можете оплатить Ваш заказ в ближайшем офисе продаж.</div><div class="print_order">Распечатать заказ</div>');
        $j('.pay_for_products input:radio:eq(1) + label').after('<div class="option">Вы можете оплатить заказ банковской картой.</div><div class="pay">Оплатить</div>');
        $j('.pay_for_products input:radio:eq(2) + label').after('<div class="option">Вы можете оплатить свой счет через любое отделение банка.</div><div class="get_bill">Выставить счет</div>');

        $j('.order_form strong').each(function(number) {
            var strongNumbersList = "0, 2, 3, 5, 6, 7";
            if (strongNumbersList.indexOf(number.toString()) != -1) {
                $j(this).text($j(this).text() + '*');
            }
            if (number == 8) {
                $j(this).text('Выберите дату доставки');
            }
        });
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
            /*var isDataValid = true;
             var isEmailValid = true;
             
             if ($j('.order_form input:text').eq(0).val().length == 0
             || $j('.order_form input:text').eq(2).val().length == 0
             || $j('.order_form input:text').eq(3).val().length == 0) {
             isDataValid = false;
             }
             
             if ($j('.order_form input:text').eq(3).val().length != 0) {
             var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
             if (!pattern.test($j('.order_form input:text').eq(3).val())) {
             isEmailValid = false;
             }
             }
             
             if (isDostavkaKureromChecked) {
             $j('#joomla_template_dostavka input:text').each(function() {
             if ($j(this).val().length == 0) {
             isDataValid = false;
             }
             });
             }
             
             if (isDataValid && isEmailValid) {*/
            $j('#pay_for_products').addClass('active').removeClass('un_active');
            $j('#order_form').removeClass('active').addClass('un_active');

            $j('.order_form').hide();
            $j('.pay_for_products').show();
            /*}
             else if (!isDataValid && isEmailValid) {
             alert('Заполните поля, отмеченные *');
             }
             else if (!isEmailValid && isDataValid) {
             alert('Введите корректный E-mail');
             }*/
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

        //Распечатать заказ
        $j('.print_order').click(function() {
            var order_id = '<?php echo uniqid(); ?>';
            var fio = $j('.order_form input:text:eq(0)').val();
            var telephone = $j('.order_form input:text:eq(2)').val();
            
            var order_date = '<?php echo date("d.m.Y H:i"); ?>';
            var firm_telephones = '';
            $j('.city_telephones_text div').each(function() {
                firm_telephones += $j(this).text() + ', ';
            });

            firm_telephones = firm_telephones.substr(0, firm_telephones.length - 2);

            var firm_city = $j('.city').text();
            var firm_city_address = $j('.city_address_text').text();
            var total_price = $j('.jsTotalPrice').text();

            var productList = '';
            var countProductList = '';
            var priceProductList = '';
            $j('.about_buy_product').each(function() {
                productList += $j(this).find('.name_product').text() + '|';
                countProductList += $j(this).find('.how_march_product input:text').val() + '|';
                var priceValue = $j(this).find('.jsPricevalue').clone();
                $j(priceValue).find('span').remove();
                priceProductList += $j(priceValue).text() + '|';
            });

            productList = productList.substr(0, productList.length - 1);
            countProductList = countProductList.substr(0, countProductList.length - 1);
            priceProductList = priceProductList.substr(0, priceProductList.length - 1);

            $j.post('/genaratingPDF.php', {order_id: order_id, order_date: order_date, fio: fio, telephone: telephone,
                firm_telephones: firm_telephones, firm_city: firm_city, firm_city_address: firm_city_address,
                total_price: total_price, productList: productList, countProductList: countProductList,
                priceProductList: priceProductList}, function(data) {
                window.location.href = "/printPDF.php";
            });
        });
    });
</script>