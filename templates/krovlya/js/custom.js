$j = jQuery.noConflict();

$j(function(){
    //Текущее подменю
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
});