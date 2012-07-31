<script language="JavaScript">
<!--
// swipe
var swipe_limit = (({$total_c_event_member}) + 1)/5 - 1;
var pagerId = '#event({$c_topic.c_commu_topic_id})memberPhotoTablePagerList';
var swipe_num = 0;

// ページャ
$(function() {
	$(".tab li").click(function() {
		var num = $(this).attr('title');
		var idContent = "#event({$c_topic.c_commu_topic_id})memberPhotoTable"+num+"content";
		var content = $(idContent);

		$("section.photoTableBox ul").hide();
		content.show();
		$(".tab li").attr('class', 'ui-btn-up-c');
		$(this).attr('class', 'ui-btn-up-b')
	});
});

$('#({$INC_HEADER_page_name})').live('pageinit',function(event){
	$(".pagerAbsolute ul").css('width', 60 * ({$total_c_event_member}));

	// swipe
({if $total_c_event_member > 5})({literal})
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

({if $c_topic.member_num})
({* {{{ pagerList *})({capture name=pager})({strip})
<div class="pagerAbsolute" id="event({$c_topic.c_commu_topic_id})memberPhotoTablePagerList">
<ul class="tab">
({foreach from=$page_num key=key item=item name=pager})
<li class="({if $item == $page})ui-btn-up-b({else})ui-btn-up-c({/if})" id="event({$c_topic.c_commu_topic_id})memberPhotoTable({$item})" title="({$item})">({$item})</li>
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

<h3>イベント参加者一覧</h3>
({* {{{ photoTable *})<section class="photoTableBox" id="#event({$c_topic.c_commu_topic_id})memberPhotoTableBox" data-role="">
({foreach from=$page_num key=key item=num name=table})
<ul id="event({$c_topic.c_commu_topic_id})memberPhotoTable({$num})content" class="photoTable" data-role="listview" data-inset="false">
({ext_include file="inc_member_table.tpl" member=$c_event_member_list _start=$key*9})
</ul>
({/foreach})
</section>({* photoTable }}} *})

({$smarty.capture.pager|smarty:nodefaults})

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<h3>イベント参加者一覧</h3>
<p>イベントへの参加者がいません。</p>
</section>({* simpleBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
