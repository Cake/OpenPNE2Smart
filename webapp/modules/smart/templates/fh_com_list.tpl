<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $fh_com_list_user})
({* {{{ photoTable *})
<section class="photoTableBox communityPhotoTableBox" id="hCommunityPhotoTableBox" data-role="">
<ul id="communityPhotoTable" class="photoTable" data-role="listview" data-inset="false">
({foreach from=$fh_com_list_user item=item})
<li class="photoCell" id="community({$item.c_commu_id})Column" data-icon="arrow-u"({if $item && $item.c_member_id_admin == $target_member.c_member_id}) data-theme="e"({/if})>
<a class="listItemLink" href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$item.c_commu_id})" id="communityLink({$item.c_commu_id})">
<div class="photo" id="community({$item.c_commu_id})photo"><img class="" src="({t_img_url filename=$item.image_filename w=76 h=76 noimg=no_image})" alt="({$item.name})"></div>
<div class="itemData caption" id="community({$item.c_commu_id})Name">({$item.name})</div>
</a></li>
({/foreach})
</ul>
</section>({* photoTable }}} *})

<ul class="ui-grid-a pagerRelative" id="communityPhotoTablePager_({$page})">
<li class="ui-block-a" id="communityPhotoTablePrevPager_({$page})">({if $pager.prev_page})<a href="({t_url m=pc a=page_fh_com_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page-1})" data-role="button" data-icon="arrow-l" data-iconpos="left" data-corners="true" data-transition="slide" data-rel="back" data-ajax="true">前</a>({/if})</li>
<li class="ui-block-b" id="communityPhotoTableNextPager_({$page})">({if $pager.next_page})<a href="({t_url m=pc a=page_fh_com_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page+1})" data-role="button" data-icon="arrow-r" data-iconpos="right" data-corners="true" data-transition="slide" data-ajax="true">次</a>({/if})</li>
</ul>

({else})
({* {{{ simpleBox *})<section class="simpleBox" id="topicNoavailableComment" data-role="">
<p>参加している({$WORD_COMMUNITY})はありません。</p>
</section>({* simpleBox }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
