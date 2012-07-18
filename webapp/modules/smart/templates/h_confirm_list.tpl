<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ searchResultList *})
<section class="searchResultListBox" id="friendRequestListBox" data-role="collapsible" data-collapsed="({if $anatani_c_friend_confirm_num})false({else})true({/if})">
<h3>({$WORD_FRIEND})要請 <span class="small">(({$anatani_c_friend_confirm_num})件)</span></h3>
({if $anatani_c_friend_confirm_list})
<p>以下の人があなたに({$WORD_FRIEND})要請しています。<br />参加の承認または拒否を選択してください。</p>
<ul id="friendRequestList" class="pictureIconList searchResultList" data-role="listview" data-inset="false">
({foreach from=$anatani_c_friend_confirm_list item=item})
({ext_include file="inc_h_confirm_list.tpl" _type='friend_confirm'})
({/foreach})
</ul>
({else})
<p>現在({$WORD_FRIEND})要請はありません。</p>
({/if})
</section>({* searchResultList }}} *})

({* {{{ searchResultList *})
<section class="searchResultListBox" id="joinCommunityRequestListBox" data-role="collapsible" data-collapsed="({if $anatani_c_commu_member_confirm_num})false({else})true({/if})">
<h3>({$WORD_COMMUNITY})参加要請 <span class="small">(({$anatani_c_commu_member_confirm_num})件)</span></h3>
({if $anatani_c_commu_member_confirm_list})
<p>以下の人があなたが管理している({$WORD_COMMUNITY})への参加を要請しています。<br />参加の承認または拒否を選択してください。</p>
<ul id="joinCommunityRequestList" class="pictureIconList searchResultList" data-role="listview" data-inset="false">
({foreach from=$anatani_c_commu_member_confirm_list item=item})
({ext_include file="inc_h_confirm_list.tpl" _type='commu_member_confirm'})
({/foreach})
</ul>
({else})
<p>現在({$WORD_COMMUNITY})参加要請はありません。</p>
({/if})
</section>({* searchResultList }}} *})

({* {{{ searchResultList *})
<section class="searchResultListBox" id="changeCommunityAdminRequestListBox" data-role="collapsible" data-collapsed="({if $anatani_c_commu_admin_confirm_num})false({else})true({/if})">
<h3>({$WORD_COMMUNITY})管理者交代要請 <span class="small">(({$anatani_c_commu_admin_confirm_num})件)</span></h3>
({if $anatani_c_commu_admin_confirm_list})
<p>以下の人があなたに({$WORD_COMMUNITY})管理者交代を要請しています。<br />交代の承認または拒否を選択してください。</p>
<ul id="changeCommunityAdminRequestList" class="pictureIconList searchResultList" data-role="listview" data-inset="false">
({foreach from=$anatani_c_commu_admin_confirm_list item=item})
({ext_include file="inc_h_confirm_list.tpl" _type='commu_admin_confirm'})
({/foreach})
</ul>
({else})
<p>現在({$WORD_COMMUNITY})管理者交代要請はありません。</p>
({/if})
</section>({* searchResultList }}} *})

({* {{{ searchResultList *})
<section class="searchResultListBox" id="communitySubadminRequestListBox" data-role="collapsible" data-collapsed="({if $anatani_c_commu_sub_admin_confirm_num})false({else})true({/if})">
<h3>({$WORD_COMMUNITY})副管理者要請 <span class="small">(({$anatani_c_commu_sub_admin_confirm_num})件)</span></h3>
({if $anatani_c_commu_sub_admin_confirm_list})
<p>以下の人があなたに({$WORD_COMMUNITY})副管理者を要請しています。<br />承認または拒否を選択してください。</p>
<ul id="communitySubadminRequestList" class="pictureIconList searchResultList" data-role="listview" data-inset="false">
({foreach from=$anatani_c_commu_sub_admin_confirm_list item=item})
({ext_include file="inc_h_confirm_list.tpl" _type='commu_subadmin_confirm'})
({/foreach})
</ul>
({else})
<p>現在({$WORD_COMMUNITY})副管理者要請はありません。</p>
({/if})
</section>({* searchResultList }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
