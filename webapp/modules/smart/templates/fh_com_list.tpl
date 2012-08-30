<script language="JavaScript">
<!--
// swipe
var swipe_limit = (({$pager.total_page}) + 1)/5 - 1;
var pagerId = '#hCommunityPhotoTablePagerList';
var swipe_num = 0;

// ページャ
$(function() {
	$(".tab li").click(function() {
		var num = $(this).attr('title');
		var idContent = "#hCommunityPhotoTable"+num+"content";
		var content = $(idContent);

		$("section.photoTableBox ul").hide();
		content.show();
		$(".tab li").attr('class', 'ui-btn-up-c');
		$(this).attr('class', 'ui-btn-up-b')
	});
});

$('#({$INC_HEADER_page_name})').live('pageinit',function(event){
	$(".pagerAbsolute ul").css('width', 60 * ({$pager.total_page}));

	// swipe
({if $pager.total_page > 5})({literal})
	$(pagerId).bind("swipeleft", function(){
		carrouselSwipeLeft(pagerId+' ul li', '240');
	});
	$(pagerId).bind("swiperight", function(){
		carrouselSwipeRight(pagerId+' ul li', '240'
		);
	});
({/literal})({/if})
});
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $fh_com_list_user})

({* {{{ pagerList *})({capture name=pager})({strip})
<div class="pagerAbsolute" id="hCommunityPhotoTablePagerList">
<ul class="tab">
({foreach from=$page_list key=key item=page_num name=pager})
<li class="({if $page_num == $page})ui-btn-up-b({else})ui-btn-up-c({/if})" id="hCommunityPhotoTable({$page_num})" title="({$page_num})">({$page_num})</li>
({/foreach})
</ul>
</div>
({if $pager.total_page > 5})
<div class="pagerAbsoluteButton">
<a title="&lt;&lt;" id="pagerAbsoluteButtonLeft" data-icon="arrow-l" data-iconshadow="true" data-shadow="true" data-corners="true" href="javascript:void(0);" data-role="button" data-iconpos="notext" onclick="carrouselSwipeRight(pagerId+' ul li', '240');">&lt;&lt;</a>
<a title="&gt;&gt;" id="pagerAbsoluteButtonRight" data-icon="arrow-r" data-iconshadow="true" data-shadow="true" data-corners="true" href="javascript:void(0);" data-role="button" data-iconpos="notext" onclick="carrouselSwipeLeft(pagerId+' ul li', '240');">&&gt;&gt;</a>
</div>
({/if})
({/strip})({/capture})({* pagerList }}} *})

({* {{{ photoTable *})<section class="photoTableBox communityPhotoTableBox" id="communityPhotoTableBox" data-role="">
({foreach from=$page_list key=key item=page_num name=table})
<ul id="hCommunityPhotoTable({$page_num})content" class="photoTable" data-role="listview" data-inset="false">
({ext_include file="inc_com_table.tpl" com_list=$fh_com_list_user _start=$key*9})
</ul>
({/foreach})
</section>({* photoTable }}} *})

({$smarty.capture.pager|smarty:nodefaults})

({if $target_member.c_member_id == $u})<a href="({t_url m=pc a=page_h_manage_commu})" data-role="button" data-inline="false" data-ajax="true">({$WORD_COMMUNITY})管理</a>({/if})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<p>参加している({$WORD_COMMUNITY})はありません。</p>
</section>({* simpleBox }}} *})
({/if})

<div class="pagerRelative">
<a href="({t_url m=pc a=page_h_com_find_all})" data-role="button" data-inline="false" data-mini="false" data-ajax="true">({$WORD_COMMUNITY})検索</a>
</div>

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
