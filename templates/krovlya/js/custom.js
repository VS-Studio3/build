$j = jQuery.noConflict();

$j(function(){
    var subMenu = $j('.krovlya + ul');
    var currentHtmlOfSubMenu = $j(subMenu).html();
    currentHtmlOfSubMenu = currentHtmlOfSubMenu.replace(/<\/ul><\/li>/g,'').replace(/<ul>/g, '</li>');
    $j(subMenu).remove();

    var reformatedList = '<ul>';
    var count = 0;
    $j($j('<ul>' + currentHtmlOfSubMenu + '</ul>')).find('li').each(function(){
        if(count == 10 || count == 20){
            reformatedList += '</ul><ul>';
        }
        reformatedList += '<li>' + $j(this).html() + '</li>';
        count++;
    });
    reformatedList += '</ul>';
    $j('.krovlya').parent().append('<div>' + reformatedList + '</div>');

    /**FANCY BOX**/
    $j('a.btn_zayavka').fancybox();

    $j('a.btn_zvonok').fancybox();

    /**CITY CHANGING**/
    $j('.btn_city').click(function () {
        $j('#list_of_cities_div').toggle();
        return false;
    });

    $j('.close').click(function(){
        $j('#list_of_cities_div').toggle();
    });

    //чтение cookie
    function getCookie(name) {
        var pattern = "(?:; )?" + name + "=([^;]*);?";
        var regexp  = new RegExp(pattern);

        if (regexp.test(document.cookie))
            return decodeURIComponent(RegExp["$1"]);

        return false;
    }

});