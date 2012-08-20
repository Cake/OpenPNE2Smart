<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容で登録します。確認のうえ、登録ボタンをクリックしてください。"})

({* {{{ formTable *})<dl id="registProfConfirm">
({capture name="nick"})
<dt class="required">({$WORD_NICKNAME})</dt>
<dd>({$prof.nickname})</dd>
({/capture})
({capture name="birth"})
<dt class="required">生まれた年</dt>
<dd>({$prof.birth_year})</dd>
({if $prof.public_flag_birth_year == 'friend' || $prof.public_flag_birth_year == 'private'})
<dd>({if $prof.public_flag_birth_year == 'friend'})（({$WORD_MY_FRIEND})まで公開）({elseif $prof.public_flag_birth_year == 'private'})（公開しない）({/if})</dd>
({/if})
<dt class="required">誕生日</dt>
<dd>({$prof.birth_month})月({$prof.birth_day})日</dd>
({if $prof.public_flag_birth_month_day == 'friend' || $prof.public_flag_birth_month_day == 'private'})
<dd>({if $prof.public_flag_birth_month_day == 'friend'})({$WORD_MY_FRIEND})まで公開）({elseif $prof.public_flag_birth_month_day == 'private'})（公開しない）({/if})</dd>
({/if})
({/capture})
({foreach from=$profile_list item=profile})
({strip})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK
  && !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_nick"})
({counter assign="_cnt_birth"})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({/if})

({if !$_cnt_nick && $profile.sort_order >= $smarty.const.SORT_ORDER_NICK})
({counter assign="_cnt_nick"})
({$smarty.capture.nick|smarty:nodefaults})
({/if})

({if !$_cnt_birth && $profile.sort_order >= $smarty.const.SORT_ORDER_BIRTH})
({counter assign="_cnt_birth"})
({$smarty.capture.birth|smarty:nodefaults})
({/if})

({/strip})
({if $profile.disp_regist})
<dt({if $profile.is_required}) class="required"({/if})>({$profile.caption})</dt>
<dd>({if $prof.profile[$profile.name].value})
({strip})
({if $profile.form_type == 'textarea'})
    ({$prof.profile[$profile.name].value|nl2br|t_url2cmd:'profile'|t_cmd:'profile'})
({elseif $profile.form_type == 'checkbox'})
    ({$prof.profile[$profile.name].value|@t_implode:", "})
({else})
    ({$prof.profile[$profile.name].value})
({/if})
({/strip})
({/if})
</dd>
({if $prof.profile[$profile.name].public_flag == 'friend' || $prof.profile[$profile.name].public_flag == 'private'})
<dd>({if $prof.profile[$profile.name].public_flag == 'friend'})（({$WORD_MY_FRIEND})まで公開）({elseif $prof.profile[$profile.name].public_flag == 'private'})（公開しない）({/if})</dd>
({/if})
({/if})
({/foreach})
({if !$_cnt_nick && !$_cnt_birth})
({if $smarty.const.SORT_ORDER_NICK > $smarty.const.SORT_ORDER_BIRTH})
({$smarty.capture.birth|smarty:nodefaults})
({$smarty.capture.nick|smarty:nodefaults})
({else})
({$smarty.capture.nick|smarty:nodefaults})
({$smarty.capture.birth|smarty:nodefaults})
({/if})
({else})
({if !$_cnt_nick})({$smarty.capture.nick|smarty:nodefaults})({/if})
({if !$_cnt_birth})({$smarty.capture.birth|smarty:nodefaults})({/if})
({/if})
</dl>
<div class="operation">
({t_form_block m=pc a=do_h_regist_prof _attr='data-ajax="false"'})
<input type="hidden" name="mode" value="register" />
<input type="submit" class="input_submit" value="登録" />
({/t_form_block})
({t_form_block m=pc a=do_h_regist_prof _attr='data-ajax="false"'})
<input type="hidden" name="mode" value="input" />
<input type="submit" class="input_submit" value="修正" />
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
