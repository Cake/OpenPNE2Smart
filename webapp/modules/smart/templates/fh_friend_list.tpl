<script language="JavaScript">
<!--
// swipe
var swipe_limit = (({$total_num}) + 1)/5 - 1;
var pagerId = '#member({$target_member.c_member_id})friendPhotoTablePagerList';
var swipe_num = 0;

// ページャ
$(function() {
	$(".tab li").click(function() {
		var num = $(this).attr('title');
		var idContent = "#member({$target_member.c_member_id})friendPhotoTable"+num+"content";
		var content = $(idContent);

		$("section.photoTableBox ul").hide();
		content.show();
		$(".tab li").attr('class', 'ui-btn-up-c');
		$(this).attr('class', 'ui-btn-up-b')
	});
});

$('#({$INC_HEADER_page_name})').live('pageinit',function(event){
	$(".pagerAbsolute ul").css('width', 60 * ({$total_num}));

	// swipe
({if $total_num > 5})({literal})
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

({if $target_friend_list_disp})
({* {{{ pagerList *})({capture name=pager})({strip})
<div class="pagerAbsolute" id="member({$target_member.c_member_id})friendPhotoTablePagerList">
<ul class="tab">
({foreach from=$page_num key=key item=item name=pager})
<li class="({if $item == $page})ui-btn-up-b({else})ui-btn-up-c({/if})" id="member({$target_member.c_member_id})friendPhotoTable({$item})" title="({$item})">({$item})</li>
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

<h3>({$WORD_FRIEND})リスト</h3>
({* {{{ photoTable *})<section class="photoTableBox" id="member({$target_member.c_member_id})friendPhotoTableBox" data-role="">
({foreach from=$page_num key=key item=num name=table})
<ul id="member({$target_member.c_member_id})friendPhotoTable({$num})content" class="photoTable" data-role="listview" data-inset="false">
({ext_include file="inc_member_table.tpl" member=$target_friend_list_disp _start=$key*9})
</ul>
({/foreach})
</section>({* photoTable }}} *})

({$smarty.capture.pager|smarty:nodefaults})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<h3>({$WORD_MY_FRIEND})一覧</h3>
<p>({$WORD_MY_FRIEND})登録がありません。</p>
</section>({* simpleBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
