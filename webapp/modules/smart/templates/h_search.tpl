<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ formTable *})<section class="formTable" id="searchForm" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>メンバー検索</h3>
({t_form_block _method=get m=pc a=page_h_search_result _attr='data-ajax="false"'})
<div data-role="fieldcontain">
<label for="nickname">({$WORD_NICKNAME})</label>
<input type="text" class="input_text" name="nickname" id="nickname" placeholder="">
</div>
<div data-role="fieldcontain">
<fieldset data-role="controlgroup" data-type="horizontal">
<legend>生年月日</legend>
<input type="text" class="input_text width_80" name="birth_year" maxlength="4" maxlength="4" placeholder="" autocapitalize="off"> 年
<input type="text" class="input_text width_40" name="birth_month" maxlength="2" maxlength="2" placeholder="" autocapitalize="off"> 月
<input type="text" class="input_text width_40" name="birth_day" maxlength="2" maxlength="2" placeholder="" autocapitalize="off"> 日
</fieldset>
</div>
({foreach from=$profile_list item=profile})
({if $profile.disp_search})
({if $profile.public_flag_edit || $profile.public_flag_default == 'public'})
<div data-role="fieldcontain">
<label for="profile[({$profile.name})]">({$profile.caption})</label>
({strip})
({if $profile.form_type == 'select' || $profile.form_type == 'radio'})
    <select name="profile[({$profile.name})]" id="profile_({$profile.name})">
    <option value="0" selected="selected">指定しない</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'checkbox'})
({* 単一選択パターン *})
    <select name="profile[({$profile.name})]" id="profile_({$profile.name})">
    <option value="0" selected="selected">指定しない</option>
    ({foreach from=$profile_list[$profile.name].options item=item})
    <option value="({$item.c_profile_option_id})">({$item.value})</option>
    ({/foreach})
    </select>
({elseif $profile.form_type == 'text' || $profile.form_type == 'textlong' || $profile.form_type == 'textarea'})
    <input type="text" class="input_text" name="profile[({$profile.name})]" id="profile_({$profile.name})">
({/if})
({/strip})
</div>
({/if})
({/if})
({/foreach})
<div data-role="fieldcontain">
<legend>写真の有無</legend>
<fieldset data-role="controlgroup">
<input type="checkbox" class="input_checkbox" name="image" id="image" value="1"><label for="image">有のみ</label>
</fieldset>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="検索">
</div>
({/t_form_block})
</section>({* formTable }}} *})

<div class="pagerRelative">
<a class="" href="({t_url m=pc a=page_h_search_list})" data-role="button" data-mini="false" data-ajax="true">検索項目の一覧</a>
<p>検索項目の一覧と各項目のメンバー数を表示します。</p>
</div>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
