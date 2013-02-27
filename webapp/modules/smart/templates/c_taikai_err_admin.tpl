<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="menu-content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl" msg="管理者は退会できません。"})

({* {{{ simpleBox *})<section class="simpleBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>この({$WORD_COMMUNITY})を退会</h3>
<p>管理者は退会できません。({$WORD_COMMUNITY})を削除する場合は「<a href="({t_url m=pc a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})" data-ajax="false">({$WORD_COMMUNITY})設定変更</a>」よりおこなってください。</p>
</section>({* simpleBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
