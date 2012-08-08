<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $c_commu.member_count!=1})
({* {{{ formTable *})<section class="formTable" id="communitySendMessageForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})参加者全員にメッセージを送る</h3>
<p>({$c_commu.name})参加者にメッセージを送信します。<br />
※管理者からのメッセージ受信設定を「受け取らない」にしているメンバーには届きませんので注意してください。</p>

({t_form_block _enctype=file m=pc a=do_c_send_message _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<div data-role="fieldcontain">
<label for="subject" class="required">タイトル</label>
<input type="text" class="input_text" name="subject" value="({$requests.subject})" />
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="body" _show_label=true _label_class="required" _title="メッセージ" _body=$requests.body|smarty:nodefaults})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="送信する" />
</div>
({/t_form_block})
</section>({* formTable }}} *})

({else})
({* {{{ simpleBox *})<section class="simpleBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})参加者全員にメッセージを送る</h3>
<p>メッセージを送信するメンバーがいません。</p>
</section>({* simpleBox }}} *})

({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
