<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $fh_com_list_user})
({* {{{ photoTable *})
<section class="photoTableBox communityPhotoTableBox" id="hCommunityPhotoTableBox" data-role="collapsible-set">
<ul id="communityPhotoTable" class="photoTable" data-role="listview" data-inset="false">
({foreach from=$fh_com_list_user item=item})
({ext_include file="inc_com_table.tpl"})
({/foreach})
({if $pager.next_page})<li class="pagerTable" id="communityPhotoTableNextPager"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_fh_com_list_ajax})&amp;target_c_member_id=({$target_member.c_member_id})', 'asc', 'li.photoCell', 'communityPhotoTableNextPager', '({$pager.total_page})', true); return false;" data-role="" data-icon="arrow-r" data-iconpos="bottom" data-corners="true" data-ajax="true">続き</a></li>({/if})
</ul>
</section>({* photoTable }}} *})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<p>参加している({$WORD_COMMUNITY})はありません。</p>
</section>({* simpleBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
