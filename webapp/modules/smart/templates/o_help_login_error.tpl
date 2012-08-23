<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ infoButtonBox *})<section class="infoButtonBox" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>パスワードを忘れた方</h3>
<p>以下のボタンをクリックし、パスワードの再設定手続きをおこなってください。</p>
({t_form_block _method=get m=pc a=page_o_password_query})
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="パスワード再設定ページへ" />
</div>
</div></div>
({* }}} *})

({if $smarty.const.OPENPNE_ENABLE_KTAI})
({* {{{ infoButtonBox *})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>携帯から登録された方</h3></div>
<div class="block">
<p>携帯から登録された方がPC版を利用するにはPCメールアドレスの登録が必要です。<br />
（なお、iPhone等の一部の携帯端末はPCとして扱われます）</p>
<p>以下のボタンをクリックし、PCメールアドレスの登録手続きをおこなってください。</p>

({t_form_block _method=get m=pc a=page_o_regist_pc_address})
<ul class="moreInfo button">
<li><input type="submit" class="input_submit" value="PCメールアドレス登録ページへ" /></li>
</ul>
({/t_form_block})
</div>
</div></div>
({* }}} *})
({/if})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
