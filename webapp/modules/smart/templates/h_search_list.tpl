<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})


({* {{{ searchCategoryList *})<section class="searchCategoryList" id="searchList" data-role="collapsible-set" data-content-theme="c">
<h3>検索項目の一覧</h3>
<p>※数字は各項目を全体に公開しているメンバーの数です。</p>
({foreach from=$profile_list item=profile})
({if $profile.disp_search && ($profile.form_type == 'select' || $profile.form_type == 'checkbox' || $profile.form_type == 'radio')})
({if $profile.public_flag_edit || $profile.public_flag_default == 'public'})
<div data-role="collapsible" data-collapsed="false">
<h4>({$profile.caption})</h4>
({foreach from=$profile.options name=$profile.name item=item})
<a href="({t_url m=pc a=page_h_search_result})&amp;profile%5B({$profile.name})%5D=({$item.c_profile_option_id})" data-role="button" data-inline="true" data-mini="false" data-ajax="true">({$item.value})(({$count_list[$item.c_profile_option_id]|default:0}))</a>
({/foreach})
</div>
({/if})
({/if})
({/foreach})
</section>({* searchCategoryList }}} *})

<div class="pagerRelative">
<a class="" href="({t_url m=pc a=page_h_search})" data-role="button" data-mini="false" data-ajax="true">メンバー検索</a>
</div>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
