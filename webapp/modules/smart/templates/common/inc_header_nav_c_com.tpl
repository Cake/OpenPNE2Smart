({if $c_commu})
({assign var=_commu_id value=$c_commu.c_commu_id})
({elseif $c_commu_id})
({assign var=_commu_id value=$c_commu_id})
({/if})
({if $_commu_id})
({* {{{ navCommunity *})<div id="navCommunity" class="topNav" data-theme="e">
<ul class="ui-grid-c" data-role="">
<li id="navTopicList" class="ui-block-a"><a href="({t_url m=pc a=page_c_topic_list})&amp;target_c_commu_id=({$_commu_id})" class="({if $INC_HEADER_page_name == 'c_topic_list'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">トピック</a></li>
<li id="navEventList" class="ui-block-b"><a href="({t_url m=pc a =page_c_event_list})&amp;target_c_commu_id=({$_commu_id})" class="({if $INC_HEADER_page_name == 'c_event_list'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">イベント</a></li>
<li id="navMemberList" class="ui-block-c"><a href="({t_url m=pc a=page_c_member_list})&amp;target_c_commu_id=({$_commu_id})" class="({if $INC_HEADER_page_name == 'c_member_list'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">メンバー</a></li>
<li id="navCommunityHome" class="ui-block-d"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$_commu_id})" class="({if $INC_HEADER_page_name == 'c_home'}) ui-btn-active({/if})" data-role="button" data-corners="false" data-mini="true">トップ</a></li>
</ul>
</div>({* navCommunity }}} *})
({/if})
