({* {{{ Navi *})({ext_include file="common/inc_header_nav.tpl"})({* Navi }}} *})
({* {{{ header *})<header id="mainHeader" data-role="header">
({* {{{ SideNavi *})({strip})<a class="ui-btn ui-shadow ui-btn-corner-all ui-btn-icon-notext" data-iconpos="notext" data-icon="grid" href="javascript:void(0);" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" title="Navigation" id="headerNavButton" onclick="leftNavToggle();">
<span class="ui-btn-inner ui-btn-corner-all">
<span class="ui-btn-text">&nbsp;</span>
<span class="ui-icon ui-icon-grid ui-icon-shadow">&nbsp;</span>
</span>
</a>({/strip})({* SideNavi }}} *})
({* {{{ Home Button *})({if $_headline_link != $smarty.const.OPENPNE_URL})({strip})
<a class="ui-btn ui-shadow ui-btn-corner-all ui-btn-icon-notext" data-direction="reverse" data-iconpos="notext" data-icon="home" href="({t_url m=pc})" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" title="Home" data-ajax="false" id="headerHomeButton">
<span class="ui-btn-inner ui-btn-corner-all">
<span class="ui-btn-text">({$smarty.const.SNS_NAME})</span>
<span class="ui-icon ui-icon-home ui-icon-shadow">&nbsp;</span>
</span>
</a>({/strip})({/if})({* Home Button }}} *})
({* {{{ Search Box *})({strip})<a class="ui-btn-right ui-btn ui-shadow ui-btn-corner-all ui-btn-icon-notext " data-iconpos="notext" data-icon="search" href="({t_url m=pc a=page_h_search})" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" title="Search" id="headerSearchButton">
<span class="ui-btn-inner ui-btn-corner-all">
<span class="ui-btn-text">Search</span>
<span class="ui-icon ui-icon-search ui-icon-shadow">&nbsp;</span>
</span>
</a>({/strip})({* Search Box }}} *})
({* Headline *})<h1 id="pageTitle">({if $_headline_link})<a href="({$_headline_link})">({/if})({$_headline|default:$smarty.const.SNS_NAME})({if $_headline_link})</a>({/if})</h1>
</header>({* header }}} *})
