<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容で変更します。確認のうえ変更ボタンをクリックしてください。"})

({* {{{ formTable *})<dl id="registProfConfirm">
<dt class="required">検索設定</dt>
<dd>({if $prof.is_search_result == '1'})公開({elseif $prof.is_search_result == '0'})公開しない({/if})
</dd>
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
({t_form_block m=pc a=do_h_config_prof _attr='data-ajax="false"'})
<input type="hidden" name="mode" value="register">
<input type="hidden" name="is_search_result" value="({$prof.is_search_result})">
<input type="hidden" name="nickname" value="({$prof.nickname})">
<input type="hidden" name="birth_year" value="({$prof.birth_year})">
<input type="hidden" name="birth_month" value="({$prof.birth_month})">
<input type="hidden" name="birth_day" value="({$prof.birth_day})">
<input type="hidden" name="public_flag_birth_year" value="({$prof.public_flag_birth_year})">
<input type="hidden" name="public_flag_birth_month_day" value="({$prof.public_flag_birth_month_day})">
({strip})
({foreach from=$prof.profile key=key item=item})
({if is_array($item.c_profile_option_id)})
    ({foreach from=$item.c_profile_option_id item=i})
    ({if $i})
    <input type="hidden" name="profile[({$key})][]" value="({$i})">
    ({/if})
    ({/foreach})
({elseif $item.c_profile_option_id})
    <input type="hidden" name="profile[({$key})]" value="({$item.c_profile_option_id})">
({else})
    <input type="hidden" name="profile[({$key})]" value="({$item.value})">
({/if})
<input type="hidden" name="public_flag[({$key})]" value="({$item.public_flag})">
({/foreach})
({/strip})
<input type="submit" class="input_submit" value="変更">
({/t_form_block})
({t_form_block m=pc a=do_h_config_prof _attr='data-ajax="false"'})
<input type="hidden" name="mode" value="input">
<input type="hidden" name="is_search_result" value="({$prof.is_search_result})">
<input type="hidden" name="nickname" value="({$prof.nickname})">
<input type="hidden" name="birth_year" value="({$prof.birth_year})">
<input type="hidden" name="birth_month" value="({$prof.birth_month})">
<input type="hidden" name="birth_day" value="({$prof.birth_day})">
<input type="hidden" name="public_flag_birth_year" value="({$prof.public_flag_birth_year})">
<input type="hidden" name="public_flag_birth_month_day" value="({$prof.public_flag_birth_month_day})">
({strip})
({foreach from=$prof.profile key=key item=item})
({if is_array($item.c_profile_option_id)})
    ({foreach from=$item.c_profile_option_id item=i})
    ({if $i})
    <input type="hidden" name="profile[({$key})][]" value="({$i})">
    ({/if})
    ({/foreach})
({elseif $item.c_profile_option_id})
    <input type="hidden" name="profile[({$key})]" value="({$item.c_profile_option_id})">
({else})
    <input type="hidden" name="profile[({$key})]" value="({$item.value})">
({/if})
<input type="hidden" name="public_flag[({$key})]" value="({$item.public_flag})">
({/foreach})
({/strip})
<input type="submit" class="input_submit" value="修正">
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
