$j = jQuery.noConflict();

var setSamovivozContent = function(currentCity, data){
    $j('.samovivoz_description').html('<div class="notice">Вы можете самостоятельно забрать продукцию со склада в г.' + currentCity + '</div><div class="city">' + 'г.' + currentCity + "</div>");
    $j(data).find('.city_val').each(function() {
        if ($j.trim($j(this).text()) == currentCity) {
            $j('.samovivoz_description').html($j('.samovivoz_description').html() + 
                    '<div class="city_address_text">' + $j.trim($j(this).next('.address_val').text()) + '</div><div class="city_telephones_text">' + 
                    $j.trim($j(this).next('.address_val').next('.telephones_val').html()) + '</div>' +
                    '<div class="notice_bottom">ВНИМАНИЕ!Бесплатная погрузка в автомобили с открытым верхом(кузов без тента).<br />Длина кузова автомобиля должна быть не менее длины листов!<br />Возможна погрузка крытых автомобилей за дополнительную плату.</div>');
        }
    });
}

citiesData = null;
/**
 * Объект для работы с cookie'сами
 **/
CookieObject = {
    findAll: function() {
        var cookies = {};
        _(document.cookie.split(';'))
                .chain()
                .map(function(m) {
                    return m.replace(/^\s+/, '').replace(/\s+$/, '');
                })
                .each(function(c) {
                    var arr = c.split('='),
                            key = arr[0],
                            value = null;
                    var size = _.size(arr);
                    if (size > 1) {
                        value = arr.slice(1).join('');
                    }
                    cookies[key] = value;
                });
        return cookies;
    },
    find: function(name) {
        var cookie = null,
                list = this.findAll();

        _.each(list, function(value, key) {
            if (key === name)
                cookie = value;
        });
        return cookie;
    }
};

/**
 * Возврат 3 списков для певого пунка меню
 */
Get3UlMenu = {
    getHTMLFirstMenu: function() {
        var subMenu = $j('.krovlya + ul');
        var currentHtmlOfSubMenu = $j(subMenu).html();
        currentHtmlOfSubMenu = currentHtmlOfSubMenu.replace(/<\/ul><\/li>/g, '').replace(/<ul>/g, '</li>');
        $j(subMenu).remove();

        var reformatedList = '<ul>';
        var count = 0;
        $j($j('<ul>' + currentHtmlOfSubMenu + '</ul>')).find('li').each(function() {
            if (count == 10 || count == 20) {
                reformatedList += '</ul><ul>';
            }
            reformatedList += '<li>' + $j(this).html() + '</li>';
            count++;
        });
        reformatedList += '</ul>';
        $j('.krovlya').parent().append('<div>' + reformatedList + '</div>');
    }
};

/**
 * Объект для вывода списка доступных городов
 * **/
var ChangingCity = {
    getModalWindows: function(data) {
        var citiesData = $j(data);
        var listOfCities = '<ul>';
        $j(citiesData).find('.category-wrapper').each(function() {
            listOfCities += '<li class="first_level">' + $j(this).find('.jbcategory-link').text() + '</li>';
            $j(this).find('.wrapper-item-desc').each(function() {
                listOfCities += '<li class="second_level" onclick="onCityClick(this);">' + $j(this).find('.city_val').text() + '</li>';
            });
        });
        listOfCities += '</ul>';
        $j('#list_of_cities, .cities').html(listOfCities);
    }
};

/**
 * Функция обработчик для события изменения города
 * **/
var onCityClick = function(e) {
    var city = $j.trim($j(e).html());

    //Сохраняем город в cookie
    var today = new Date();
    var offset = 1000 * 60 * 60 * 24;
    var expires_at = new Date(today.getTime() + offset).toGMTString();

    var cookie = "city=value; path=/; expires=" + expires_at;
    document.cookie = cookie.replace('value', city);

    $j(citiesData).find('.category-wrapper').each(function() {
        $j(this).find('.wrapper-item-desc').each(function() {
            if ($j.trim($j(this).find('.city_val').text()) == city) {
                var currentTelephone = $j(this).find('.telephones_val div:first-child').text();
                $j('.contact .number').html($j.trim(currentTelephone));
            }
        });
    });

    $j('.btn_city, .current_city').html(city);
    $j('#list_of_cities_div, #modal_cities').hide();
    $j('#current_city_form input:text').val(city);
    
    //Динамический контент для самовывоза
    setSamovivozContent(city, citiesData);
    
    location.reload();
}


$j(function() {

    /**
     * FANCY BOX -> вывод модальных окон для заказа завяки и звонка
     * **/
    $j('a.btn_zayavka, a.btn_zvonok').fancybox();
    $j('.add-to-cart').attr('value', '');
    $j('.jsSubmit.button.rborder').attr('value', '');
    /**Выводит список доступных городов**/
    $j('.only_for_btn').click(function() {
        $j('#list_of_cities_div').toggle();
        return false;
    });

    /**Закрытие окна с выводом списка городов**/
    $j('.close').click(function() {
        $j('#list_of_cities_div').toggle();
    });

    $j('#zayavka .foxform .foxfield:eq(3), #zayavka .foxform .foxfield:eq(4)').addClass('fox_little_text');
    $j('#zayavka .foxform .foxfield:eq(5)').addClass('for_buttom');
});