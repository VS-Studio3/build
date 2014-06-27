/* Copyright (C) YOOtheme GmbH, http://www.gnu.org/licenses/gpl.html GNU/GPL */
/* zoo v 3.0.8 */
jQuery(function(a){var c=a('form[name="adminForm"]'),e=a('[name="boxchecked"]:hidden',c);a("#submenu li").addClass(function(){return"item"+(a(this).index()+1)});a("select.auto-submit").bind("change",function(){c.submit()});a("table.stripe tbody tr").addClass(function(a){return a%2?"even":"odd"});c.delegate("input.check-all","click",function(){var b=a(this).is(":checked"),d=a('[name="cid[]"]:checkbox',c).attr("checked",function(){return b});e.val(d.filter(":checked").length)});c.delegate('[name="cid[]"]:checkbox',
"click",function(){var b=parseInt(e.val());e.val(a(this).is(":checked")?b+1:b-1)});c.delegate('table tr a[rel^="task-"]',"click",function(b){b.preventDefault();b=a(this).closest("tr").find('input[name="cid[]"]').val();a('input[name="task"]',c).val(a(this).attr("rel").replace(/task-/,""));c.append('<input type="hidden" name="cid" value="'+b+'" />');c.submit()});a("#parameter-accordion").accordionMenu({mode:"slide",display:0});a.each(["apply","save","save-new"],function(b,d){var e=a("#toolbar-"+d+" a, #toolbar-"+
d+" button");if(e.length){var f=e.attr("onclick").toString().replace(/\n*/gi,"").replace(/.*submitbutton\(['|"](.*)['|"]\).*/g,"$1");e.removeAttr("onclick").bind("click",function(){var b=a.Event("validate.adminForm");a(this).trigger(b);b.isDefaultPrevented()||(c.find(".placeholder:text").val(""),submitbutton(f))})}});a("#nav li.level1 a").each(function(){a(this).attr("title",a.trim(a(this).text()))});a("#nav [data-zooversion].active").length&&a('<span class="version" />').text("ZOO "+a("#nav [data-zooversion].active").data("zooversion")).appendTo("#nav div.bar");
a("#nav").MenuResize();a.Message=function(b){if(b=a.parseJSON(b)){if("info"==b.group)return;if("error"==b.group){alert(b.title+"-"+b.text);return}}window.location="index.php"}});
(function(a){var c=function(){};a.extend(c.prototype,{name:"MenuResize",initialize:function(e,b){this.options=a.extend({},this.options,b);var d=this;this.nav=e;this.spans=e.find("li.level1 > .level1 > span");this.widths=[];this.padding_lefts=[];this.padding_rights=[];this.spans.each(function(b){d.widths[b]=parseInt(a(this).css("width").replace("px",""));d.padding_lefts[b]=parseInt(a(this).css("padding-left").replace("px",""));d.padding_rights[b]=parseInt(a(this).css("padding-right").replace("px",
""))});this.width=0;e.find("li.level1").each(function(){d.width+=a(this).outerWidth(!0)});this.initial_width=this.width;this.resizeTabs();a(window).bind("resize",function(){d.resizeTabs()})},resizeTabs:function(){var e=this,b=this.nav.innerWidth(),d=[],c=[],f=[];this.spans.each(function(a){d[a]=e.widths[a];c[a]=e.padding_lefts[a];f[a]=e.padding_rights[a]});for(this.width=this.initial_width;b<=this.width;){var g=0,i=!1;this.spans.each(function(a){0<c[a]&&(e.width-=1,c[a]-=1,i=!0);0<f[a]&&(e.width-=
1,f[a]-=1,i=!0);d[a]>d[g]&&(g=a)});!1===i&&(this.width-=10,d[g]-=10)}this.spans.each(function(b){a(this).css("width")!=d[b]+"px"&&a(this).css("width",d[b]+"px");a(this).css("padding-left")!=c[b]+"px"&&a(this).css("padding-left",c[b]+"px");a(this).css("padding-right")!=f[b]+"px"&&a(this).css("padding-right",f[b]+"px")})}});a.fn[c.prototype.name]=function(){var e=arguments,b=e[0]?e[0]:null;return this.each(function(){var d=a(this);if(c.prototype[b]&&d.data(c.prototype.name)&&"initialize"!=b)d.data(c.prototype.name)[b].apply(d.data(c.prototype.name),
Array.prototype.slice.call(e,1));else if(!b||a.isPlainObject(b)){var h=new c;c.prototype.initialize&&h.initialize.apply(h,a.merge([d],e));d.data(c.prototype.name,h)}else a.error("Method "+b+" does not exist on jQuery."+c.name)})}})(jQuery);
