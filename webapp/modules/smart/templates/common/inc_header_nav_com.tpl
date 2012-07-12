({* {{{ navCommunity *})<div id="navCommunity" class="topNav" data-theme="e">
<ul class="ui-grid-c" data-role="">
<li id="navTopicList" class="ui-block-a"><a href="({if $c_topic.event_flag})({t_url m=pc a =page_c_event_list})({else})({t_url m=pc a =page_c_topic_list})({/if})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-corners="false" data-mini="true">掲示板</a></li>
<li id="navCoinCommunity" class="ui-block-b"><a href="({t_url m=pc a=page_c_join_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-corners="false" data-mini="true">({$WORD_COMMUNITY_HALF})に参加</a></li>
<li id="navInviteCommunity" class="ui-block-c"><a href="({t_url m=pc a=page_c_invite})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-corners="false" data-mini="true">紹介する</a></li>
<li id="navCommunityHome" class="ui-block-d"><a href="({t_url m=pc a=page_c_home})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-role="button" data-corners="false" data-mini="true">({$WORD_COMMUNITY_HALF})ﾎｰﾑ</a></li>
</div>({* navCommunity }}} *})
