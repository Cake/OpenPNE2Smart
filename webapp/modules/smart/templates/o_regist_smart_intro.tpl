<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ simpleBox *})<section class="simpleBox" id="registIntro" data-role="" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>会員登録</h3>
<p>サービスを利用するには、以下の規約を遵守してください。<br>
利用者ご本人により会員規約に同意のうえ、登録手続きを進めてください。</p>
</section>({* simpleBox }}} *})

({* {{{ descriptionBox *})<section class="descriptionBox" id="registIntroSiteadmin" data-role="" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>利用規約</h3>
<p>
({if $c_siteadmin != ""})
({$c_siteadmin|t_url2a|nl2br})
({else})
利用規約は、ただいま準備中です。
({/if})
</p>
</section>({* descriptionBox }}} *})

({* {{{ buttonLine *})
<div class="parts buttonLine">
({t_form_block m=pc a=page_o_regist_smart})
<input type="hidden" name="mode" value="input">
<input type="hidden" name="ses" value="({$ses})">
<input type="submit" class="input_submit" value="同意して登録手続きへ">
({/t_form_block})
</div>
({* }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
