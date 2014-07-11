/**
 * Объект для работы с cookie'сами
 **/
CookieObject = {
    findAll: function () {
        var cookies = {};
        _(document.cookie.split(';'))
            .chain()
            .map(function (m) {
                return m.replace(/^\s+/, '').replace(/\s+$/, '');
            })
            .each(function (c) {
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

    find: function (name) {
        var cookie = null,
            list = this.findAll();

        _.each(list, function (value, key) {
            if (key === name) cookie = value;
        });
        return cookie;
    },

    create: function (name, value, time) {
        var today = new Date(),
            offset = (typeof time == 'undefined') ? (1000 * 60 * 60 * 24) : (time * 1000),
            expires_at = new Date(today.getTime() + offset);

        var cookie = _.map({
            name: value,
            expires: expires_at.toGMTString(),
            path: '/'
        },function (value, key) {
            return [(key == 'name') ? name : key, value].join('=');
        }).join(';');

        document.cookie = cookie;
        return this;
    },

    destroy: function (name, cookie) {
        if (cookie = this.find(name)) {
            this.create(name, null, -1000000);
        }
        return this;
    }
};

/**
 * Возврат 3 списков для певого пунка меню
 */
Get3UlMenu = {
    getHTMLFirstMenu: function () {
        var subMenu = $j('.krovlya + ul');
        var currentHtmlOfSubMenu = $j(subMenu).html();
        currentHtmlOfSubMenu = currentHtmlOfSubMenu.replace(/<\/ul><\/li>/g, '').replace(/<ul>/g, '</li>');
        $j(subMenu).remove();

        var reformatedList = '<ul>';
        var count = 0;
        $j($j('<ul>' + currentHtmlOfSubMenu + '</ul>')).find('li').each(function () {
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
ChangingCity = {
    getModalWindows: function (data) {
        var cities = data['elements']['126be91c-d8af-4d0e-807f-6b97e7e42708']['option'];
        var listOfCities = '<ul>';

        for (field in cities) {
            if (cities[field].name[0] == '-') {
                listOfCities += '<li class="second_level" onclick="onCityClick(this);">' + cities[field].name.substring(1) + '</li>';
            }
            else {
                listOfCities += '<li class="first_level">' + cities[field].name + '</li>';
            }
        }
        listOfCities += '</ul>';

        $j('#list_of_cities, .cities').html(listOfCities);

        if (CookieObject.find('city') == null) {
            $j('#modal_cities').show();
        }
        else {
            $j('.btn_city, .current_city').html(CookieObject.find('city'));
        }
    }
};

/**
 * Функция обработчик для события изменения города
 * **/
var onCityClick = function (e) {
    var city = $j(e).html();

    //Сохраняем город в cookie
    CookieObject.create('city', city);

    $j('.btn_city, .current_city').html(city);
    $j('#list_of_cities_div, #modal_cities').hide();
}

$j = jQuery.noConflict();
$j(function () {
    /**
     * FANCY BOX -> вывод модальных окон для заказа завяки и звонка
     * **/
    $j('a.btn_zayavka, a.btn_zvonok').fancybox({
        scrolling: 'no',
        autoScale: false
    });
    $j('.add-to-cart').attr('value', '');
    $j('.jsSubmit.button.rborder').attr('value', '');
    /**Выводит список доступных городов**/
    $j('.btn_city').click(function () {
        $j('#list_of_cities_div').toggle();
        return false;
    });

    /**Закрытие окна с выводом списка городов**/
    $j('.close').click(function () {
        $j('#list_of_cities_div').toggle();
    });

    $j('#zayavka .foxform .foxfield:eq(3), #zayavka .foxform .foxfield:eq(4)').addClass('fox_little_text');
    $j('#zayavka .foxform .foxfield:eq(5)').addClass('for_buttom');
});