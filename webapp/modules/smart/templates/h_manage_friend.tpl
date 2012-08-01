<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})

({if $c_friend_list})
({* {{{ manageList *})
<section class="manageListBox" id="friendManageListBox" data-role="collapsible-set">
<h3>({$WORD_MY_FRIEND})管理</h3>
<ul id="friendManageList" class="pictureIconList" data-role="listview" data-inset="false" data-split-theme="c"> 
({foreach from=$c_friend_list item=item})
({ext_include file="inc_friend_manage_list.tpl"})
({/foreach})
</ul>
</section>({* manageList }}} *})

({if $pager.next})
<div class="pagerRelative" id="friendManageListNextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_h_manage_friend_ajax})', 'asc', 'li.commentList', 'friendManageListNextPager', '({$pager.total_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<h3>({$WORD_MY_FRIEND})管理</h3>
<p>({$WORD_MY_FRIEND})登録がありません。</p>
</section>({* simpleBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
