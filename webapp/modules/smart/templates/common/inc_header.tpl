({* {{{ header *})<header id="mainHeader" data-role="header">
({* Home Button *})({if $_headline_link != $smarty.const.OPENPNE_URL})
<a class="ui-btn ui-shadow ui-btn-corner-all ui-btn-icon-notext" data-direction="reverse" data-iconpos="notext" data-icon="home" href="({t_url m=pc})" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" title="Home" data-ajax="false">
<span class="ui-btn-inner ui-btn-corner-all">
<span class="ui-btn-text">({$smarty.const.SNS_NAME})</span>
<span class="ui-icon ui-icon-home ui-icon-shadow">&nbsp;</span>
</span>
</a>({/if})
({* Headline *})<h1>({if $_headline_link})<a href="({$_headline_link})">({/if})({$_headline|default:$smarty.const.SNS_NAME})({if $_headline_link})</a>({/if})</h1>
({* Search Box *})<a class="ui-btn-right ui-btn ui-shadow ui-btn-corner-all ui-btn-icon-notext " data-iconpos="notext" data-icon="search" href="({t_url m=pc a=page_h_search})" data-corners="true" data-shadow="true" data-iconshadow="true" data-wrapperels="span" title="Search">
<span class="ui-btn-inner ui-btn-corner-all">
<span class="ui-btn-text">Search</span>
<span class="ui-icon ui-icon-search ui-icon-shadow">&nbsp;</span>
</span>
</a>
</header>({* header }}} *})
