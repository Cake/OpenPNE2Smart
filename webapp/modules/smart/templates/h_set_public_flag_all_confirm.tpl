<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg=$WORD_DIARY|string_format:"%s公開範囲の一括設定します。よろしいですか。"})

({* {{{ yesNoButtonBox *})<div class="operation yesNoButtonBox">
<p>設定内容 ： ({if $public_flag_diary_all == 'private'})公開しない({elseif $public_flag_diary_all == 'friend'})({$WORD_MY_FRIEND})まで公開({else})全員に公開({/if})</p>
({t_form_block m=pc a=do_h_set_public_flag_all _attr='data-ajax="false"'})
<input type="hidden" name="public_flag_diary_all" value="({$public_flag_diary_all})" />
<ul class="ui-grid-a">
<li class="ui-block-a">
<input type="submit" class="input_submit" name="ok" value="一括設定" />
</li>
<li class="ui-block-b">
<input type="submit" class="input_submit" value="キャンセル" />
</li>
</ul>
({/t_form_block})
</div>({* yesNoButtonBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
