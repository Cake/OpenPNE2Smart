<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if !$c_friend_list})
({* {{{ simpleBox *})<section class="simpleBox" id="eventInviteNoavailableComment" data-role="">
<h3>イベントお知らせメッセージ</h3>
<p>紹介できる({$WORD_MY_FRIEND})がいません。</p>
</section>({* simpleBox }}} *})

({else})
({* {{{ formTable *})<section class="formTable" id="eventInviteForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>イベントお知らせメッセージ</h3>
<p>このイベントを紹介したい({$WORD_MY_FRIEND})を一覧から選び、紹介メッセージを書いてください。</p>
({t_form_block _enctype=file m=pc a=do_c_event_invite _attr='data-ajax="false"'})
<input type="hidden" name="c_commu_id" value="({$c_commu_id})" />
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend>紹介先</legend>
({foreach from=$c_friend_list item=item})
<input type="checkbox" class="input_checkbox" id="m({$item.c_member_id})" name="c_member_id[]" value="({$item.c_member_id})" />
<label for="m({$item.c_member_id})">({$item.nickname})</label>
({/foreach})
</fieldset>
</div>
<div data-role="fieldcontain">
<label for="eventInviteBody">メッセージ (任意)</label>
<textarea name="body" id="eventInviteBody" rows="6" cols="50"></textarea>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信" />
</div>
({/t_form_block})
</section>({* formTable }}} *})
({/if})

<a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$c_commu_topic_id})" data-role="button" data-direction="reverse">イベントへ戻る</a>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
