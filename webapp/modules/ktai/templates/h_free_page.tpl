({$inc_ktai_header|smarty:nodefaults})

<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_01})">
<font color="#({$ktai_color_config.font_01})"><a name="top">({$c_free_page.title})</a></font><br>
</td></tr></table>

({if $c_free_page})
({$c_free_page.body|smarty:nodefaults|nl2br})
({else})
<font color="#({$ktai_color_config.font_04})">({$msg})</font>
({/if})

({$inc_ktai_footer|smarty:nodefaults})