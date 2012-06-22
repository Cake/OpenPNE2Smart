({* {{{ Navi *})({ext_include file="common/inc_header_nav.tpl"})({* Navi }}} *})
({* {{{ header *})<header id="mainHeader" data-role="header">
({* {{{ SideNavi *})({strip})<a title="Navi" data-icon="grid" data-wrapperels="span" data-iconshadow="true" data-shadow="true" data-corners="true" href="javascript:void(0);" data-role="button" data-iconpos="notext"  onclick="leftNavToggle();">Navi</a>({/strip})({* SideNavi }}} *})
({* Headline *})<h1 id="pageTitle">({if $_headline_link})<a href="({$_headline_link})">({/if})({$_headline|default:$smarty.const.SNS_NAME})({if $_headline_link})</a>({/if})</h1>
({* {{{ Home Button *})({if $_headline_link != $smarty.const.OPENPNE_URL})({strip})<a  class="ui-btn-right" title="Home" data-icon="home" data-direction="reverse" data-wrapperels="span" data-iconshadow="true" data-shadow="true" data-corners="true" href="({t_url m=pc})" data-role="button" data-iconpos="notext" data-ajax="false">({$smarty.const.SNS_NAME})</a>({/strip})({/if})({* Home Button }}} *})
</header>({* header }}} *})
