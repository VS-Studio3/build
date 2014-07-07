$j = jQuery.noConflict();

$j(function(){
    var menuListItems = [];

    $j('.menu > li').each(function(){
        menuListItems = [];

        if($j(this).has('ul')){
            var copyOfCurrentSubMenu = $j(this).find('ul').clone();
            $j(this).find('ul').remove();

            $j(copyOfCurrentSubMenu).find('li').each(function(){
                //если есть подменю
                if($j(this).hasClass('parent')){
                    var parentHref = $j(this).find('a').attr('href');
                    var parentTitle = $j(this).find('a').html();
                    menuListItems.push('<li><a href="' + parentHref + '">' + parentTitle +'</a></li>');

                    $j(this).find('ul').find('li').each(function(){
                        menuListItems.push('<li class="gray_link">' + $j(this).html() + '</li>');
                    });
                }
                else{
                    menuListItems.push('<li>' + $j(this).html() + '</li>');
                }
            });

            var listOfElements = '<div><ul>';
            var count = 0;

            for(var i=0; i< menuListItems.length; i++){
                if(count == 10 || count == 20){
                    listOfElements += '</ul><ul>';
                }
                listOfElements += menuListItems[i];
                count++;
            }
            listOfElements += '</ul></div>';

            $j(this).append(listOfElements);
        }
    });
});