<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})

({if $c_member_list})
({* {{{ manageList *})
<section class="manageListBox" id="community({$c_commu.c_commu_id})MemberManageListBox" data-role="collapsible-set">
<h3>メンバー管理</h3>
<ul id="communityMemberManageList" class="pictureIconList" data-role="listview" data-inset="false" data-split-icon="gear" data-split-theme="c"> 
({foreach from=$c_member_list item=item})
({ext_include file="inc_commu_member_manage_list.tpl"})
({/foreach})
</ul>
</section>({* manageList }}} *})

({if $is_next})
<div class="pagerRelative" id="community({$c_commu.c_commu_id})MemberManageListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_c_edit_member_ajax})&amp;target_c_commu_id=({$requests.target_c_commu_id})', 'asc', 'li.commentList', 'community({$c_commu.c_commu_id})MemberManageListNextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})

({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
