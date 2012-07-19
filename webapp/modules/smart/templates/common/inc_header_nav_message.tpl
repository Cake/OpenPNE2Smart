({* {{{ navMessage *})<div id="navMessage" class="topNav" data-theme="e">
<ul class="ui-grid-c" id="messageCategoryVav">
<li class="ui-block-a"><a href="({t_url m=pc a=page_h_message_box})&amp;box=inbox" class="({if $box == 'inbox'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">受信</a></li>
<li class="ui-block-b"><a href="({t_url m=pc a=page_h_message_box})&amp;box=outbox" class="({if $box == 'outbox'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">送信済</a></li>
<li class="ui-block-c"><a href="({t_url m=pc a=page_h_message_box})&amp;box=savebox" class="({if $box == 'savebox'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">下書き</a></li>
<li class="ui-block-d"><a href="({t_url m=pc a=page_h_message_box})&amp;box=trash" class="({if $box == 'trash'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">ごみ箱</a></li>
</ul></div>({* navMessage }}} *})
