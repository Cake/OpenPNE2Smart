<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})
<section class="inviteForm" id="inviteSNSForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>友人を({$smarty.const.SNS_NAME})に招待する</h3>
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_NONE})
<p>現在、新規登録を停止しています。</p>
({else})
<div class="partsInfo">
<p>「({$smarty.const.SNS_NAME})」に招待したい方のメールアドレスを記入してください。</p>
</div>
({t_form_block m=pc a=page_h_invite_confirm _attr='data-ajax="false"'})
<div data-role="fieldcontain" class=">
<label for="mail">招待するアドレス</label>
<input type="email" class="input_text" name="mail" value="({$requests.mail})" placeholder="" autocapitalize="off">
({if $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_PC})
<p class="caution">※携帯メールアドレスには招待を送ることができません。</p>
({elseif $smarty.const.OPENPNE_REGIST_FROM == $smarty.const.OPENPNE_REGIST_FROM_KTAI})
<p class="caution">※PCメールアドレスには招待を送ることができません。</p>
({/if})
</div>
<div data-role="fieldcontain">
<label for="message">メッセージ (任意)</label>
<textarea name="message">({$requests.message})</textarea>
</div>
({if $smarty.const.OPENPNE_USE_CAPTCHA})
<div data-role="fieldcontain" class="">
<label for="captcha">確認キーワード</label>
<p>※下に表示されているキーワードをご記入下さい。</p>
<p><img src="./cap.php?rand=({math equation="rand(0,99999999)"})" alt="確認キーワード"></p>
<input type="text" class="input_text" name="captcha" value="" placeholder="" autocapitalize="off">
</div>
({/if})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="確認画面">
</div>
({/t_form_block})
</section>({*  }}} *})
({/if})

({if $inviting_member || $k_inviting_member})
({* {{{ recentList *})
<section class="commentListBox recentListBox" id="inviteListBox"  data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>招待中メールアドレス一覧</h3>
({t_form_block m=pc a=do_h_invite_delete_member _attr='data-ajax="false"'})
<input type="hidden" name="c_member_id[]" value="({$item.c_member_pre_id})">
<div data-role="fieldcontain">
({foreach from=$inviting_member item=item})
({$item.r_date|date_format:"%Y年%m月%d日"})
<input type="checkbox" class="input_checkbox" name="c_member_id[]" id="c_member_id-({$item.c_member_pre_id})" value="({$item.c_member_pre_id})">
<label for="c_member_id-({$item.c_member_pre_id})">({$item.regist_address})</label>
({/foreach})
({foreach from=$k_inviting_member item=item})
({$item.r_date|date_format:"%Y年%m月%d日"})
<input type="checkbox" class="input_checkbox" name="c_member_id[]" id="c_member_id-({$item.c_member_pre_id})" value="({$item.c_member_pre_id})">
<label for="c_member_id-({$item.c_member_pre_id})">({$item.regist_address})</label>
({/foreach})
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="削除">
</div>
({/t_form_block})
</section>
({* }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
