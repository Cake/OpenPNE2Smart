<footer data-role="footer" id="Footer">
({$INC_FOOTER_inc_page_footer|smarty:nodefaults})
({if $before_after == "after"}) <a href="({t_url m=pc a=do_inc_page_header_logout})&amp;sessid=({$PHPSESSID})">ログアウト </a>({/if})
</footer>
