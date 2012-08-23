<div class="page" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})
({ext_include file="common/inc_msg.tpl"})

({* {{{ descriptionBox *})<section class="descriptionBox" id="snsKiyaku" data-role="collapsible" data-role="collapsible" data-collapsed="false" data-content-theme="c">
<h3>利用規約</h3>
<p>
({if $c_siteadmin != ""})
({$c_siteadmin|t_url2a|nl2br})
({else})
利用規約は、ただいま準備中です。
({/if})
</p>
</section>({* descriptionBox }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
