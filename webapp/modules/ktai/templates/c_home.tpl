({$inc_ktai_header|smarty:nodefaults})
({if $inc_ktai_entry_point[1]})
({$inc_ktai_entry_point[1]|smarty:nodefaults})
({/if})
<table width="100%"><tr><td align="center" bgcolor="#({$ktai_color_config.bg_02})">
<font color="#({$ktai_color_config.font_05})">({$c_commu.name})</font><br>
</td></tr>
({if $inc_ktai_entry_point[2]})
<tr><td>
({$inc_ktai_entry_point[2]|smarty:nodefaults})
</td></tr>
({/if})
</table>
({if $inc_ktai_entry_point[3]})
({$inc_ktai_entry_point[3]|smarty:nodefaults})
({/if})
({if $c_siteadmin})
({$c_siteadmin|smarty:nodefaults})<br>
<hr>
({/if})
<br>
<table width="100%" bgcolor="#({$ktai_color_config.bg_04})">
<tr><td align="center" width="50%" valign="top">
<img src="({t_img_url filename=$c_commu.image_filename w=120 h=120 noimg=no_logo_small f=jpg})" alt="({$c_commu.name})"><br>
({if $c_commu.c_member_id_admin==$u})
[<a href="({t_url m=ktai a=page_c_edit_image})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">写真を編集</a>]<br>
({/if})
</td>
<td valign="top">
<font color="#({$ktai_color_config.font_06})">ID：</font><br>
({$c_commu.c_commu_id})<br>
<font color="#({$ktai_color_config.font_06})">開設日：</font><br>
({$c_commu.r_datetime|date_format:"%Y年%m月%d日"})<br>
<font color="#({$ktai_color_config.font_06})">管理者:</font><br>
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu.c_member_id_admin})&amp;({$tail})">({$c_commu.c_member_admin.nickname})</a><br>
<font color="#({$ktai_color_config.font_06})">ｶﾃｺﾞﾘ名:</font><br>
({$c_commu.c_commu_category.name})<br>
</td>
</tr>
<tr>
<td colspan="2">
<font color="#({$ktai_color_config.font_06})">ｺﾐｭﾆﾃｨの説明：</font><br>
({$c_commu.info|t_url2a_ktai|t_truncate:108:""})<br>
</td></tr>
<tr><td align="right" colspan="2">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_c_commu_info_detail})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
</td></tr></table>


<table width="100%" bgcolor="#({$ktai_color_config.bg_06})">
<tr><td>
<hr color="#({$ktai_color_config.border_01})">
({if !$relation_c_member_and_c_commu.join && !$relation_c_member_and_c_commu.wait})
[i:204]<a href="({t_url m=ktai a=do_inc_join_c_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨに参加</a><br>
({/if})
({if ($c_commu.c_member_id_admin==$u || $c_commu.c_member_id_sub_admin==$u)})
[i:190]<a href="({t_url m=ktai a=page_c_edit})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨ編集</a><br>
({/if})
({if $relation_c_member_and_c_commu.join})
({if !($c_commu.c_member_id_admin==$u || $c_commu.c_member_id_sub_admin==$u)})
[i:138]<a href="({t_url m=ktai a=do_inc_leave_c_commu})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｺﾐｭﾆﾃｨから退会</a><br>
({/if})
({if !($is_unused_pc_bbs && $is_unused_ktai_bbs)})
[i:105]<a href="({t_url m=ktai a=page_c_receive_mail})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ﾒｰﾙ受信設定</a><br>
({/if})
({/if})
[i:150]<a href="({t_url m=ktai a=page_c_invite})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">({$WORD_MY_FRIEND_HALF})に紹介</a><br>
<br>
</td></tr></table>

<table width="100%" cellpadding="0" >
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<a accesskey="1" name="a1" href="#a1">[i:125]</a>新着ﾄﾋﾟｯｸﾘｽﾄ<br>
</td></tr>
({if $is_c_commu_view})
({foreach from=$new_topic_comment item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<font color="#({$ktai_color_config.font_06})">[({$item.r_datetime|date_format:"%m/%d"})]</font> <a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name|t_truncate:22:""})(({$item.count_comments}))</a>
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({cycle name="border" values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
<tr><td align="right">
({if $new_topic_comment})
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_c_topic_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({/if})
<a href="({t_url m=ktai a=page_c_topic_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ﾄﾋﾟｯｸの作成</a><br>
</td></tr>
({/if})
</table>
<br>

<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_08})">
<a accesskey="2" name="a2" href="#a2">[i:126]</a>新着ｲﾍﾞﾝﾄﾘｽﾄ<br>
</td></tr>
({if $is_c_commu_view})
({foreach from=$new_topic_comment_event item=item})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_09`,`$ktai_color_config.bg_10`"})">
<font color="#({$ktai_color_config.font_06})">[({$item.r_datetime|date_format:"%m/%d"})]</font> <a href="({t_url m=ktai a=page_c_bbs})&amp;target_c_commu_topic_id=({$item.c_commu_topic_id})&amp;({$tail})">({$item.name|t_truncate:22:""})(({$item.count_comments}))</a>
({if $item.image_filename1 || $item.image_filename2 || $item.image_filename3})
[i:68]
({/if})
<br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_10})">
<hr color="#({$ktai_color_config.border_03})">
</td></tr>
({/foreach})
<tr><td align="right">
({if $new_topic_comment_event})
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_c_event_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({/if})
<a href="({t_url m=ktai a=page_c_event_add})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ｲﾍﾞﾝﾄの作成</a><br>
</td></tr>
</table>
({/if})
<br>
<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_03})" align="center">
ﾄﾋﾟｯｸ検索<br>
</td></tr>
<tr><td>
({t_form _method=get m=ktai a=page_c_com_topic_find})
<input type="hidden" name="ksid" value="({$PHPSESSID})">
<font color="#({$ktai_color_config.font_06})">ｷｰﾜｰﾄﾞ：</font><br>
<input type="text" name="keyword" value="({$search_word})">
<br>
<select name="target_commu">
<option value="in_commu">ｺﾐｭﾆﾃｨ内
<option value="all">全てのｺﾐｭﾆﾃｨ
</select>
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})">
<br>
<input type="submit" value="検索">
</form>
</td></tr></table>
<br>

<table width="100%">
<tr><td bgcolor="#({$ktai_color_config.bg_05})">
<a accesskey="3" name="a3" href="#a3">[i:127]</a>ｺﾐｭﾆﾃｨﾒﾝﾊﾞｰ<br>
</td></tr>
({foreach from=$c_commu_member_list item=c_commu_member})
<tr><td bgcolor="#({cycle values="`$ktai_color_config.bg_06`,`$ktai_color_config.bg_07`"})">
<a href="({t_url m=ktai a=page_f_home})&amp;target_c_member_id=({$c_commu_member.c_member_id})&amp;({$tail})">({$c_commu_member.nickname})</a><br>
</td></tr>
<tr><td bgcolor="#({$ktai_color_config.bg_07})">
<hr color="#({$ktai_color_config.border_02})">
</td></tr>
({/foreach})
<tr><td align="right">
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_c_member_list})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">もっと見る</a><br>
({if ($c_commu.c_member_id_admin==$u || $c_commu.c_member_id_sub_admin==$u)})
<font color="#({$ktai_color_config.font_07})">⇒</font><a href="({t_url m=ktai a=page_c_edit_member})&amp;target_c_commu_id=({$c_commu.c_commu_id})&amp;({$tail})">ﾒﾝﾊﾞｰ管理</a><br>
({/if})
</td></tr>
</table>

({$inc_ktai_footer|smarty:nodefaults})
