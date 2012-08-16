<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="communityEditForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})設定変更</h3>
({t_form_block _enctype=file m=pc a=do_c_edit_update_c_commu _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_id" value="({$target_c_commu_id})" />
<div data-role="fieldcontain">
<label for="title" class="required">({$WORD_COMMUNITY})名</label>
<input type="text" class="input_text" name="name" value="({$c_commu.name})" placeholder="" />
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">カテゴリ</span></legend>
<select name="c_commu_category_id">
({foreach from=$c_commu_category_list item=item})
<option value="({$item.c_commu_category_id})"({if $item.c_commu_category_id == $c_commu.c_commu_category_id}) selected="selected"({/if})>({$item.name})</option>
({/foreach})
</select>
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">参加条件</span></legend>
<input type="radio" class="input_radio" name="is_admit" id="is_admit_public" value="public"({if $c_commu.is_admit == 'public'}) checked="checked"({/if}) /><label for="is_admit_public">誰でも参加可能</label>
<input type="radio" class="input_radio" name="is_admit" id="is_admit_auth" value="auth"({if $c_commu.is_admit == 'auth'}) checked="checked"({/if}) /><label for="is_admit_auth">管理人の承認が必要</label>
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">公開範囲</span></legend>
<input type="radio" class="input_radio" name="is_open" id="is_open_public" value="public"({if $c_commu.is_open == 'public'}) checked="checked"({/if}) /><label for="is_open_public">全員に公開</label>
<input type="radio" class="input_radio" name="is_open" id="is_open_member" value="member"({if $c_commu.is_open == 'member'}) checked="checked"({/if}) /><label for="is_open_member">({$WORD_COMMUNITY})参加者にのみ公開</label>
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">トピック作成権限</span></legend>
<input type="radio" class="input_radio" name="is_topic" id="is_topic_member" value="member"({if $c_commu.is_topic == 'member'}) checked="checked"({/if}) /><label for="is_topic_member">({$WORD_COMMUNITY})参加者が作成可能</label>
<li><input type="radio" class="input_radio" name="is_topic" id="is_topic_admin_only" value="admin_only"({if $c_commu.is_topic == 'admin_only'}) checked="checked"({/if}) /><label for="is_topic_admin_only">({$WORD_COMMUNITY})管理者のみが作成可能</label></li>
<input type="radio" class="input_radio" name="is_topic" id="is_topic_public" value="public"({if $c_commu.is_topic == 'public'}) checked="checked"({/if}) /><label for="is_topic_public">誰でも作成可能</label></li>
</fieldset>
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup">
<legend><span class="required">コメント作成権限</span></legend>
<input type="radio" class="input_radio" name="is_comment" id="is_comment_member" value="member"({if $c_commu.is_comment == 'member'}) checked="checked"({/if}) /><label for="is_comment_member">({$WORD_COMMUNITY})参加者のみ可能</label>
<input type="radio" class="input_radio" name="is_comment" id="is_comment_public" value="public"({if $c_commu.is_comment == 'public'}) checked="checked"({/if}) /><label for="is_comment_public">誰でもコメント可能</label>
</div>
({ext_include file="inc_tinymce_textarea.tpl" _name="info" _show_label=true _label_class="required" _title="$WORD_COMMUNITY説明文" _body=$c_commu.info|smarty:nodefaults})
<div data-role="fieldcontain">
<label for="image_filename">写真</label>
({if $c_commu.image_filename})
<img src="({t_img_url filename=$c_commu.image_filename w=120 h=120})" alt="" /><br />
<a title="削除" class="" href="javascript:void(0);" onclick="setConfirmDialog('本当に削除しますか？', '({t_url m=pc a=do_c_edit_image_delete_c_commu_image})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;sessid=({$PHPSESSID})', '({t_url m=pc a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})', 'deleteCommunity({$c_commu.c_commu_id})ImageConfirm'); openDialog('deleteCommunity({$c_commu.c_commu_id})ImageConfirm')" data-role="button" data-mini="false" data-ajax="true">削除</a>
({/if})
({if ($is_apple)})
<p>
({if $c_commu.image_filename})
新しい写真を登録する場合は今の写真を削除してください。<br>
({else})
以下のメールアドレスに写真を添付して送信してください。<br>
({t_mail_post mailto=$mail_address _linktxt=写真設定用アドレス})<br>
写真は1枚以上登録できません。<br>
タイトルと本文は反映されません。<br>
({$SNS_NAME})に登録したメールアドレスから投稿してください。<br>
({/if})
</p>
({else})
<input type="file" class="input_file" name="image_filename" id="image_filename" />
({/if})
</div>
({if !$is_unused_join_commu})
<div data-role="fieldcontain">
<label for="image_filename">参加お知らせメール受信設定</label>
<input type="radio" class="input_radio" name="is_send_join_mail" id="is_send_join_mail_1" value="1"({if $c_commu.is_send_join_mail}) checked="checked"({/if}) /><label for="is_send_join_mail_1">受信する</label>
<input type="radio" class="input_radio" name="is_send_join_mail" id="is_send_join_mail_0" value="0"({if !$c_commu.is_send_join_mail}) checked="checked"({/if}) /><label for="is_send_join_mail_0">受信しない</label>
<p>※({$WORD_COMMUNITY})に新しく参加者が加わった時に、管理者(あなた)にメールを送ります。</p>
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="変更を確定" />
</div>
({/t_form_block})
</section>({* formTable }}} *})


({if $c_commu.c_member_id_sub_admin != $u && $c_commu.c_member_id_admin == $u})
({if $is_topic})
({* {{{ simpleBox *})<section class="simpleBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})を削除する</h3>
<p>({$WORD_COMMUNITY})を削除するには、トピックをすべて削除する必要があります。<br />
トピックを全てを削除した後、このページに再度アクセスしてください。削除ボタンが表示されます。</p>
<p>削除の際はトラブル等を避けるため、あらかじめ参加者へ削除を告知してください。</p>
</section>({* simpleBox }}} *})

({else})
({* {{{ formTable *})<section class="formTable" id="community({$target_c_commu_id})DeleteForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>({$WORD_COMMUNITY})を削除する</h3>
<p>削除の際はトラブル等を避けるため、あらかじめ参加者へ削除を告知してください。</p>
({t_form_block m=pc a=page_c_edit_delete_c_commu_confirm})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})" />
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面" />
</div>
({/t_form_block})
</section>({* formTable }}} *})
({/if})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
