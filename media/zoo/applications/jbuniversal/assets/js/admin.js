/**
 * JBZoo App is universal Joomla CCK, application for YooTheme Zoo component
 *
 * @package     jbzoo
 * @version     2.x Pro
 * @author      JBZoo App http://jbzoo.com
 * @copyright   Copyright (C) JBZoo.com,  All rights reserved.
 * @license     http://jbzoo.com/license-pro.php JBZoo Licence
 * @coder       Denis Smetannikov <denis@jbzoo.com>
 */

/**
 * Scripts for Joomla CP
 */
jQuery(function ($) {

    $.fn.JBZooAdminMenu = function (options) {

        var $obj = $(this),
            html = '';

        if ($obj.is('.disabled')) {
            $obj.append('<li class="disabled"><a>' + options.name + '</a>');
        } else {

            $.each(options.items, function (parentKey, items) {

                var attrs = '';

                if (typeof items.target != "undefined") {
                    attrs += 'target="' + items.target + '"';
                }

                if (items == 'divider') {
                    html += '<li class="separator divider"><span></span></li>';

                } else if (typeof items.children == 'undefined' || items.children.length == 0) {
                    html += '<li><a ' + attrs + ' class="' + parentKey + '-item parent-link" href="' + items.url + '">' + items.name + '</a></li>';

                } else {

                    var classes = parentKey + '-item dropdown-toggle parent-link';
                    if (typeof items.icon != "undefined") {
                        attrs += ' style="background-image:url(' + items.icon + ');" ';
                    }

                    html += '<li class="node dropdown-submenu">';
                    html += '<a ' + attrs + ' class="' + classes + '" data-toggle="dropdown" href="' + items.url + '">' +
                        items.name + '</a><ul class="dropdown-menu">';

                    $.each(items.children, function (childKey, item) {

                        var innerAttrs = '';
                        if (typeof item.target != "undefined") {
                            innerAttrs += ' target="' + items.target + '" ';
                        }

                        if (item == 'divider') {
                            html += '<li class="separator divider"><span></span></li>';

                        } else {
                            html += '<li><a ' + innerAttrs + ' class="' + childKey + '-item" href="' + item.url + '">' + item.name + '</a></li>';
                        }
                    });

                    html += '</ul></li>';
                }

            });

            $obj.append('<li class="dropdown" id="jbzoo-adminmenu">' +
                '<a class="dropdown-toggle" data-toggle="dropdown" href="#">' +
                options.name +
                ' <span class="caret"></span></a>' +
                '<ul class="dropdown-menu">' + html + '</ul></li>');
        }

    };

    /**
     * Pseudo jQuery plugin for form filed key-value
     * @param options
     * @constructor
     */
    $.fn.JBZooKeyValue = function (options) {
        $('body').on('click', '.jsKeyValue .jsKeyValueAdd', function () {

            var $addButton = $(this),
                $parent = $addButton.closest('.jsKeyValue'),
                $template = $parent.find('.jbkeyvalue-row:first').clone(),
                length = $parent.find('.jbkeyvalue-row').length;

            $template.find('input').attr('value', '');
            html = '<div class="jbkeyvalue-row">' + $template.html() + '</div>';
            html = html.replace('[0][key]', '[' + (length) + '][key]');
            html = html.replace('[0][value]', '[' + (length) + '][value]');

            $addButton.before(html);

            return false;
        });
    }

    /**
     * Pseudo jQuery plugin for form filed ItemOrder
     * @param options
     * @constructor
     */
    $.fn.JBZooItemOrder = function (options) {
        $('body').on('click', '.jsItemOrder .jsItemOrderAdd', function () {

            var $addButton = $(this),
                $parent = $addButton.closest('.jsItemOrder'),
                $template = $parent.find('.jbzoo-itemorder-row:first').clone(),
                length = $parent.find('.jbzoo-itemorder-row').length;

            $template.find('select option').removeAttr('selected');
            $template.find('input[type=checkbox]').removeAttr('checked');
            $template.find('label').removeAttr('for');

            html = '<div class="jbzoo-itemorder-row">' + $template.html() + '</div><br>';
            html = html.split(/_jbzoo_[0-9]_/).join('_jbzoo_' + length + '_');
            console.log(html);

            $addButton.before(html);

            return false;
        });
    }

    /**
     * Menu tabs hack
     */
    $('li[data-href-replace]').each(function (n, obj) {
        var $obj = $(obj),
            replace = $(obj).data('href-replace'),
            $link = $obj.children('a'),
            href = $link.attr('href');

        if (replace) {
            $link.attr('href', href.replace(replace, 'controller=item'));
        }
    });

    // init Joomla CP Scripts
    (function () {
        if (typeof JBAdminItems != 'undefined') {
            $('#menu').JBZooAdminMenu(JBAdminItems);
        }

        if ($("#nav [data-jbzooversion].active").length) {
            $('<span class="version" />')
                .text("JBZoo " + $("#nav [data-jbzooversion].active").data("jbzooversion"))
                .appendTo("#nav div.bar");
        }

        // some plugins
        $.fn.JBZooKeyValue();
        $.fn.JBZooItemOrder();
    }());

});
