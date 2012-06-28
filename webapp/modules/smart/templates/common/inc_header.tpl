({* {{{ header *})<div id="mainHeader" data-role="header">
({* Headline *})<h1 id="pageTitle">({if $_headline_link})<a href="({$_headline_link})">({/if})({$_headline|default:$smarty.const.SNS_NAME})({if $_headline_link})</a>({/if})</h1>
({* {{{ Home Button *})({if $_headline_link != $smarty.const.OPENPNE_URL})({strip})<a title="Home" data-icon="home" data-direction="reverse" data-iconshadow="true" data-shadow="true" data-corners="true" href="({t_url m=pc})" data-role="button" data-iconpos="notext" data-ajax="false">({$smarty.const.SNS_NAME})</a>({/strip})({/if})({* Home Button }}} *})
({* {{{ menuButton *})({strip})<a title="Menu" data-icon="grid" class="ui-btn-right" data-iconshadow="true" data-shadow="true" data-corners="true" href="javascript:void(0);" data-role="button" data-iconpos="notext"  onclick="menuToggle();">Menu</a>({/strip})({* menuButton }}} *})
</div>({* header }}} *})
({* {{{ Menu *})({ext_include file="common/inc_header_menu.tpl"})({* Menu }}} *})
({* {{{ Navi *})({strip})
({if 
	($INC_HEADER_page_name == 'fh_diary' && $type == "h")
	|| ($type == "h" && $INC_HEADER_page_name == 'fh_diary_list')
	|| $INC_HEADER_page_name == 'h_diary_add'
})({ext_include file="common/inc_header_nav_diary.tpl"})({/if})
({/strip})({* Menu }}} *})
