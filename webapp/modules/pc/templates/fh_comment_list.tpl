({ext_include file="inc_header.tpl"})
({ext_include file="inc_layoutcolumn_top_720px.tpl"})
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<!-- ********************************** -->
<!-- ******ここから：コメントリスト****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:650px;" class="border_01">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:636px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_01" align="center">
({*ここから：header*})
<!-- 小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="({t_img_url_skin filename=content_header_1})" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:598px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">最近のコメント一覧</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
({if $new_comment_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})({$pager.start})件～({$pager.end})件を表示({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
({/if})
<table border="0" cellspacing="1" cellpadding="0" style="width:636px;">

({if $new_comment_list})
<!--各コメント開始-->
({foreach from=$new_comment_list item=new_comment })
<tr>
<td style="width:180px;" class="bg_05">

<div class="padding_s">

({$new_comment.r_datetime|date_format:"%Y年%m月%d日 %H:%M"})

</div>

</td>
<td style="width:453px;" class="bg_02">

<div class="padding_s">

<a href="({t_url m=pc a=page_fh_diary})&amp;target_c_diary_id=({$new_comment.c_diary_id})">({$new_comment.body|t_truncate:"36"})</a> ({if $new_comment.nickname !== ''})(({$new_comment.nickname}))({/if})

</div>

</td>
</tr>
({/foreach})
<!--各コメント終了-->
({else})
<tr>
<td style="width:634px;" align="center" class="bg_02">

<div class="padding_w_m">

まだコメントがありません。

</div>

</td>
</tr>
({/if})
</table>
({if $new_comment_list})
<table border="0" cellspacing="0" cellpadding="0" style="width:636px;">
({*********})
<tr>
<td style="width:636px;height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
<td style="width:634px;" class="bg_02" align="right" valign="middle">

<div class="padding_s">

({if $is_prev})
<a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page})&amp;direc=-1">前を表示</a>&nbsp;&nbsp;
({/if})({$pager.start})件～({$pager.end})件を表示({if $is_next})
&nbsp;&nbsp;<a href="({t_url m=pc a=page_fh_comment_list})&amp;target_c_member_id=({$target_member.c_member_id})&amp;page=({$page})&amp;direc=1">次を表示</a>
({/if})

</div>

</td>
<td style="width:1px;" class="bg_01" align="center"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
<tr>
<td style="height:1px;" class="bg_01" colspan="3"><img src="./skin/dummy.gif" alt="dot" class="dot"></td>
</tr>
({*********})
</table>
({/if})
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
<td class="bg_00"><img src="./skin/dummy.gif" alt="square" class="square"></td>
</tr>
</table>

<!-- ******ここまで：コメントリスト****** -->
<!-- ********************************** -->

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

<img src="./skin/dummy.gif" alt="dummy" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
({ext_include file="inc_layoutcolumn_bottom_270px_165px_175px_720px.tpl"})
({ext_include file="inc_footer.tpl"})
