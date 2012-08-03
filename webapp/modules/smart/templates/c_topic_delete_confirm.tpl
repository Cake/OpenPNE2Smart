<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="本当に削除しますか？"})

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<ul class="ui-grid-a">
<li class="ui-block-a">
({t_form_block m=pc a=do_c_bbs_delete_c_commu_topic  _attr='data-ajax="false"'})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="submit" class="input_submit" value="はい" />
({/t_form_block})
</li>
<li class="ui-block-b">
({t_form_block m=pc a=page_c_topic_edit})
<input type="hidden" name="target_c_commu_topic_id" value="({$c_commu_topic_id})" />
<input type="submit" class="input_submit" value="いいえ" />
({/t_form_block})
</li>
</ul>
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
