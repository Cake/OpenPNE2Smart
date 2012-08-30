<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg=$WORD_MY_FRIEND|string_format:"本当に%sから外しますか？"})

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<ul class="ui-grid-a">
<li class="ui-block-a">
({t_form_block m=pc a=do_fh_friend_list_delete_c_friend _attr='data-ajax="false"'})
<input type="hidden" name="target_c_member_id" value="({$target_c_member_id})" />
<input type="submit" class="input_submit" value="はい" />
({/t_form_block})
</li>
<li class="ui-block-b">
({t_form_block m=pc a=page_h_manage_friend})
<input type="submit" class="input_submit" value="いいえ" />
({/t_form_block})
</li>
</ul>
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
