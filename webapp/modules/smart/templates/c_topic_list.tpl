<script language="JavaScript">
<!--
var page=2;
//-->
</script>
<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({if $is_warning})({*メンバー以外非公開*})
({ext_include file="common/inc_msg.tpl" msg=$WORD_COMMUNITY|string_format:"非公開の%sのため、参加しないと掲示板を見ることはできません。"})

({else})({* リスト表示 *})
({if ($c_commu.is_topic == 'member' && $is_c_commu_member) || ($c_commu.is_topic == 'admin_only' && $is_c_commu_admin) || ($c_commu.is_topic == 'public')})
({* {{{ infoButtonBox *})<div class="infoButtonBox" id="writeTopicBodyBox" data-role="collapsible" data-content-theme="c">
<h3>記事を作成する</h3>
({t_form_block m=pc a=page_c_topic_add})
<input type="hidden" name="target_c_commu_id" value="({$c_commu.c_commu_id})">
<ul data-role="" class="ui-grid-a narrow-bottom">
<li class="ui-block-a"><input type="radio" class="input_radio" name="event_flag" id="event_flag_0" value="0" checked="checked"><label for="event_flag_0">トピックを作成</label></li>
<li class="ui-block-b"><input type="radio" class="input_radio" name="event_flag" id="event_flag_1" value="1"><label for="event_flag_1">イベントを作成</label></li>
</ul> 
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="新規作成">
</div>
({/t_form_block})
</div>({* infoButtonBox}}} *})
({/if})

({if $c_topic_list })({* {{{ commentListBox *})
({* {{{ commentList *})<section class="commentListBox" id="topicList({$c_commu.c_commu_id})Box" data-role="collapsible-set">
<ul id="topicList({$c_commu.c_commu_id})" class="pictureIconList" data-role="listview" data-inset="false"> 
({foreach from=$c_topic_list item=item})
({ext_include file="inc_c_bbs_list.tpl"})
({/foreach})
</ul>
</section>({* commentList }}} *})

({* {{{ Pager *})({strip})
({if $is_next})
<div class="pagerRelative" id="topicList({$c_commu.c_commu_id})NextPager">
<span class="next"><a href="javascript:void(0);" onclick="submitPagerPage('({t_url m=pc a=page_c_topic_list_ajax})&amp;target_c_commu_id=({$c_commu.c_commu_id})', 'asc', 'li.bbsList', 'topicList({$c_commu.c_commu_id})NextPager', '({$total_page_num})', true); return false;" data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="false" data-mini="false" data-ajax="true">もっと読む</a></span>
</div>
({/if})
({/strip})({* Pager }}} *})
({/if})({* commentListBox }}} *})

({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})