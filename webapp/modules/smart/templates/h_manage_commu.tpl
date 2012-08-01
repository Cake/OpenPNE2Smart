<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})

({if $c_commu_list})
({* {{{ manageList *})
<section class="manageListBox" id="communityManageListBox" data-role="collapsible-set">
<h3>({$WORD_COMMUNITY})管理</h3>
<ul id="communityManageList" class="pictureIconList" data-role="listview" data-inset="false" data-split-theme="c"> 
({foreach from=$c_commu_list item=item})
({ext_include file="inc_commu_manage_list.tpl"})
({/foreach})
</ul>
</section>({* manageList }}} *})

({if $pager.next_page})
<div class="pagerRelative" id="communityManageListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_manage_commu_ajax})', 'asc', 'li.commentList', 'communityManageListNextPager', '({$pager.total_page})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<h3>({$WORD_COMMUNITY})管理</h3>
<p>({$WORD_COMMUNITY})登録がありません。</p>
</section>({* simpleBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
