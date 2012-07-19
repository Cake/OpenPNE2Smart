<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})

({* {{{ searchFormLine *})
({if $box == "inbox" || !$box })
<section class="searchFormBox searchFormLine" id="searchMessageFormBox" data-role="collapsible" data-collapsed="({if $keyword || $requests.target_c_member_id})false({else})true({/if})" data-content-theme="c">
<h3>検索</h3>
<p>({t_form_block _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})" />
<div data-role="fieldcontain" class="ui-hide-label">
<label for="keyword">キーワード</label> <input type="search" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" placeholder="" />
</div>
<div data-role="fieldcontain">
<label for="target_c_member_id">送信者</label>
<select name="target_c_member_id" id="target_c_member_id">
<option value="">指定なし</option>
({foreach from=$c_message_sender_list item=item})
<option value="({$item.c_member_id_from})"({if $target_c_member_id == $item.c_member_id_from}) selected="selected"({/if})>({$item.nickname})</option>
({/foreach})
</select>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="検索" />
</div>
({/t_form_block})</p>
</section>

({elseif $box == "outbox"})
<section class="searchFormBox searchFormLine" id="searchMessageFormBox" data-role="collapsible" data-collapsed="({if $keyword || $requests.target_c_member_id})false({else})true({/if})" data-content-theme="c">
<h3>検索</h3>
<p>({t_form_block _method=get m=pc a=page_h_message_box})
<input type="hidden" name="box" value="({$box})" />
<div data-role="fieldcontain" class="ui-hide-label">
<label for="keyword">キーワード</label> <input type="search" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})" placeholder="" />
</div>
<div data-role="fieldcontain">
<label for="target_c_member_id">宛先</label>
<select name="target_c_member_id" id="target_c_member_id">
<option value="">指定なし</option>
({foreach from=$c_message_receiver_list item=item})
<option value="({$item.c_member_id_to})"({if $target_c_member_id == $item.c_member_id_to}) selected="selected"({/if})>({$item.nickname})</option>
({/foreach})
</select>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="検索" />
</div>
({/t_form_block})</p>
</section>
({/if})
({* searchFormLine }}} *})

({* {{{ messageList *})
({* {{{ recentListBox *})
<section class="commentListBox messageListBox" id="messageListBox" data-role="collapsible-set">
<ul id="messageList" class="pictureIconList" data-role="listview" data-inset="false"> 
({if $box == "inbox" || !$box})
({foreach from=$c_message_ru_list item=item})
({ext_include file="inc_h_message_list.tpl"})
({/foreach})
({elseif $box == "outbox"})
({foreach from=$c_message_s_list item=item})
({ext_include file="inc_h_message_list.tpl"})
({/foreach})
({elseif $box == "savebox"})
({foreach from=$c_message_save_list item=item})
({ext_include file="inc_h_message_list.tpl"})
({/foreach})
({elseif $box == "trash"})
({foreach from=$c_message_trash_list item=item})
({ext_include file="inc_h_message_list.tpl"})
({/foreach})
({/if})
</ul>
</section>({* messageList }}} *})

({* {{{ Pager *})({strip})
({if $ru_data.is_ru_next})
<div class="pagerRelative" id="ruMessageListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPageName('({t_url m=pc a=page_h_message_box_ajax})&amp;box=inbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})', 'ru_page', 'asc', 'li.commentList', 'ruMessageListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({if $s_data.is_s_next})
<div class="pagerRelative" id="sMessageListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPageName('({t_url m=pc a=page_h_message_box_ajax})&amp;box=outbox&amp;keyword=({$url_keyword})&amp;target_c_member_id=({$target_c_member_id})', 's_page', 'asc', 'li.commentList', 'sMessageListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({if $save_data.is_save_next})
<div class="pagerRelative" id="saveMessageListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPageName('({t_url m=pc a=page_h_message_box_ajax})&amp;box=savebox', 'save_page', 'asc', 'li.commentList', 'saveMessageListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({if $trash_data.is_trash_next})
<div class="pagerRelative" id="trashMessageListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPageName('({t_url m=pc a=page_h_message_box_ajax})&amp;box=trash', 'trash_page', 'asc', 'li.commentList', 'trashMessageListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
