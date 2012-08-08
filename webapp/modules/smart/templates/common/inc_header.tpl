({* {{{ header *})<div id="mainHeader" data-role="header">
({* Headline *})<h1 id="pageTitle">({if $_headline_link})<a href="({$_headline_link})">({/if})({$_headline|default:$smarty.const.SNS_NAME})({if $_headline_link})</a>({/if})</h1>
({* {{{ Home Button *})({if $_headline_link != $smarty.const.OPENPNE_URL})({strip})<a title="Home" data-icon="home" data-direction="reverse" data-iconshadow="true" data-shadow="true" data-corners="true" href="({t_url m=pc})" data-role="button" data-iconpos="notext" data-ajax="false">({$smarty.const.SNS_NAME})</a>({/strip})({/if})({* Home Button }}} *})
({* {{{ menuButton *})({strip})<a title="Menu" data-icon="grid" class="ui-btn-right" data-iconshadow="true" data-shadow="true" data-corners="true" href="javascript:void(0);" data-role="button" data-iconpos="notext"  onclick="menuToggle();">Menu</a>({/strip})({* menuButton }}} *})
</div>({* header }}} *})
({* {{{ Menu *})({ext_include file="common/inc_header_menu.tpl"})({* Menu }}} *})
({* {{{ Navi *})({strip})
({if 
	($INC_HEADER_page_name == 'fh_diary' && $type == "h")
	|| ($INC_HEADER_page_name == 'fh_diary_list' && $type == "h")
	|| ($INC_HEADER_page_name == 'fh_friend_list' && $type == "h")
	|| $INC_HEADER_page_name == 'h_bookmark_diary_blog_list'
	|| $INC_HEADER_page_name == 'h_diary_add'
	|| $INC_HEADER_page_name == 'h_diary_edit'
	|| $INC_HEADER_page_name == 'h_diary_comment_list'
	|| $INC_HEADER_page_name == 'h_diary_list_friend'
	|| $INC_HEADER_page_name == 'h_diary_list_all'
	|| $INC_HEADER_page_name == 'h_manage_friend'
	|| $INC_HEADER_page_name == 'h_prof'
})({ext_include file="common/inc_header_nav_diary.tpl"})({/if})
({if 
	$INC_HEADER_page_name == 'f_home'
	|| $INC_HEADER_page_name == 'f_com_list_common'
	|| ($INC_HEADER_page_name == 'fh_com_list' && $requests.c_member_id && $requests.c_member_id != $u)
	|| ($INC_HEADER_page_name == 'fh_diary' && $type == "f")
	|| ($INC_HEADER_page_name == 'fh_diary_list' && $type == "f")
	|| ($INC_HEADER_page_name == 'fh_friend_list' && $type == "f")
})({ext_include file="common/inc_header_nav_friend.tpl"})({/if})
({if 
	$INC_HEADER_page_name == 'c_home'
	|| $INC_HEADER_page_name == 'c_admin_request'
	|| $INC_HEADER_page_name == 'c_admin_request_confirm'
	|| $INC_HEADER_page_name == 'c_edit'
	|| $INC_HEADER_page_name == 'c_edit_member'
	|| $INC_HEADER_page_name == 'c_edit_member_delete_c_commu_member'
	|| $INC_HEADER_page_name == 'c_event_add'
	|| $INC_HEADER_page_name == 'c_event_detail'
	|| $INC_HEADER_page_name == 'c_event_invite'
	|| $INC_HEADER_page_name == 'c_event_invite_end'
	|| $INC_HEADER_page_name == 'c_event_mail'
	|| $INC_HEADER_page_name == 'c_event_mail_end'
	|| $INC_HEADER_page_name == 'c_event_list'
	|| $INC_HEADER_page_name == 'c_event_member_list'
	|| $INC_HEADER_page_name == 'c_join_commu'
	|| $INC_HEADER_page_name == 'c_join_commu_2'
	|| $INC_HEADER_page_name == 'c_join_err_already'
	|| $INC_HEADER_page_name == 'c_join_err_wait'
	|| $INC_HEADER_page_name == 'c_join_request'
	|| $INC_HEADER_page_name == 'c_leave_commu'
	|| $INC_HEADER_page_name == 'c_member_list'
	|| $INC_HEADER_page_name == 'c_sub_admin_request'
	|| $INC_HEADER_page_name == 'c_sub_admin_request_confirm'
	|| $INC_HEADER_page_name == 'c_taikai_err_admin'
	|| $INC_HEADER_page_name == 'c_taikai_err_no_member'
	|| $INC_HEADER_page_name == 'c_topic_add'
	|| $INC_HEADER_page_name == 'c_topic_detail'
	|| $INC_HEADER_page_name == 'c_topic_list'
})({ext_include file="common/inc_header_nav_c_com.tpl"})({/if})
({if 
	$INC_HEADER_page_name == 'c_com_topic_find'
	|| ($INC_HEADER_page_name == 'fh_com_list' && (!$requests.c_member_id || $requests.c_member_id == $u))
	|| $INC_HEADER_page_name == 'h_com_add'
	|| $INC_HEADER_page_name == 'h_com_comment_list'
	|| $INC_HEADER_page_name == 'h_com_find_all'
	|| $INC_HEADER_page_name == 'h_com_topic_find_all'
	|| $INC_HEADER_page_name == 'h_err_c_commu_add'
	|| $INC_HEADER_page_name == 'h_err_c_home'
	|| $INC_HEADER_page_name == 'h_manage_commu'
})({ext_include file="common/inc_header_nav_h_com.tpl"})({/if})
({if 
	$INC_HEADER_page_name == 'h_message_box'
})({ext_include file="common/inc_header_nav_message.tpl"})({/if})

({/strip})({* Menu }}} *})
