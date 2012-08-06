<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="以下の内容でよろしいですか？"})

({* {{{ formTable *})<dl>
<dt>({$WORD_COMMUNITY})名</dt>
<dd>({$form_val.name})</dd>
<dt>カテゴリ</dt>
<dd>({$c_commu_category_value})</dd>
<dt>参加条件</dt>
<dd>({$form_val.open_pref_value}) ({$is_admit_value})</dd>
<dt>公開範囲</dt>
<dd>({$is_open_value})</dd>
<dt>({$WORD_COMMUNITY})説明文</dt>
<dd>({$form_val.info|t_url2a|nl2br|t_decoration})</dd>
<dt>写真</dt>
<dd>({$form_val.image_filename})</dd>
</dl>
<div class="operation">
({t_form_block m=pc a=do_h_com_add_insert_c_commu _attr='data-ajax="false"'})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="作成" />
({/t_form_block})
({t_form_block m=pc a=page_h_com_add _attr='data-ajax="false"'})
({foreach from=$form_val key=key item=item})
<input type="hidden" name="({$key})" value="({$item})" />
({/foreach})
<input type="submit" class="input_submit" value="修正" />
({/t_form_block})
</div>({* formTable }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
