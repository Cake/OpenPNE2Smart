({$inc_html_header|smarty:nodefaults})
<body>
({ext_include file="inc_extension_pagelayout_top.tpl"})
<table class="mainframe" border="0" cellspacing="0" cellpadding="0">
<tr>
<td class="container inc_page_header">
({$inc_page_header|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container inc_navi">
({$inc_navi|smarty:nodefaults})
</td>
</tr>
<tr>
<td class="container main_content">
<table class="container" border="0" cellspacing="0" cellpadding="0">({*BEGIN:container*})
<tr>
<td class="full_content" align="center">
({***************************})
({**ここから：メインコンテンツ**})
({***************************})

<img src="./skin/dummy.gif" class="v_spacer_l">

<!-- ****************************** -->
<!-- ******ここから：カレンダー****** -->
<table border="0" cellspacing="0" cellpadding="0" style="width:684px;margin:0px auto;" class="border_07">
<tr>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:670px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td style="width:7px;" class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_01" align="center">
<!-- *ここから：カレンダー＞内容* -->
({*ここから：header*})
<!-- ここから：小タイトル -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:36px;" class="bg_06"><img src="./skin/content_header_1.gif" style="width:30px;height:20px;" class="dummy"></td>
<td style="width:622px;padding:2px 0px;" class="bg_06"><span class="b_b c_00">
({$ym.year_disp})年({$ym.month_disp})月のカレンダー
</span></td>
</tr>
</table>
<!-- ここまで：小タイトル -->
({*ここまで：header*})
({*ここから：body*})
<!-- ここから：主内容 -->
<!-- ここから：主内容＞＞天気予報を見る -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:468px;padding:2px 0px;" class="bg_05">
&nbsp;<img src="./skin/icon_weather_FC.gif" class="icon">
<a href="({$weather_url})" target="_blank">天気予報を見る</a>
&nbsp;<img src="./skin/icon_schedule.gif" class="icon">
<a href="({t_url m=biz a=page_fh_biz_schedule_add})">予定を追加</a>&nbsp;

</td>
<td style="width:200px;padding:2px 0px;" class="bg_05" align="right">
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
</td>
</tr>
</table>
<!-- ここまで：主内容＞＞天気予報を見る -->
<!-- ここから：主内容＞＞カレンダー -->
<table border="0" cellspacing="1" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:14%;padding:2px;" class="bg_02 c_02">日</td>
<td style="width:14%;padding:2px;" class="bg_02">月</td>
<td style="width:14%;padding:2px;" class="bg_02">火</td>
<td style="width:14%;padding:2px;" class="bg_02">水</td>
<td style="width:14%;padding:2px;" class="bg_02">木</td>
<td style="width:14%;padding:2px;" class="bg_02">金</td>
<td style="width:14%;padding:2px;" class="bg_02 c_03">土</td>
</tr>
({foreach from=$calendar item=week})
<tr>
({foreach from=$week item=item})
({if $item.now})
<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_09">
({else})
<td style="height:65px;padding:2px;" align="left" valign="top" class="bg_02">
({/if})
({if $item.day})
({if $item.now})
<span class="b_b">({$item.day})</span>
({else})
({$item.day})
({/if})<br>
<a href="({t_url m=biz a=page_fh_biz_schedule_add})&amp;begin_date=({$year})({$month|string_format:'%02d'})({$item.day|string_format:'%02d'})"><img src="./skin/icon_schedule.gif" class="icon"></a><br>

({* スケジュール *})
({foreach from=$item.schedule item=item_schedule name=schedule})
	({if !$item_schedule.begin_time})
&nbsp;
<!-- 時間指定なしの予定 -->
	({elseif $cmd == 's_list'})
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
<a href="({t_url m=biz a=page_s_view_schedule})&amp;id=({$item_schedule.biz_shisetsu_schedule_id})">
({ext_include file="inc_biz_schedule_week_time.tpl"})
<div class="padding_s" style="padding-top:0;">
({$item_schedule.c_member_name})
</div></a>
	({elseif $item_schedule.begin_date != $item_schedule.finish_date})  <!--バナー予定 -->
({assign var="begin_time_H" value=$item_schedule.begin_date|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_date|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_date|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_date|date_format:"%M"})
({/if})
({ext_include file="inc_biz_schedule_week_time.tpl"})
<div class="padding_s" style="padding-top:0;">
<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
</div>
	({else})
({assign var="begin_time_H" value=$item_schedule.begin_time|date_format:"%H"})
({assign var="begin_time_M" value=$item_schedule.begin_time|date_format:"%M"})
({if $item_schedule.finish_time})
	({assign var="finish_time_H" value=$item_schedule.finish_time|date_format:"%H"})
	({assign var="finish_time_M" value=$item_schedule.finish_time|date_format:"%M"})
({/if})
({ext_include file="inc_biz_schedule_week_time.tpl"})
<div class="padding_s" style="padding-top:0;">
<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})">({$item_schedule.title})</a>
</div>
<img src="./skin/dummy.gif" style="width:80px;height:10px;" class="dummy">
	({/if})
({/foreach})

({* 誕生日 *})
({foreach from=$item.birth item=item_birth})
<img src="./skin/icon_birthday.gif" class="icon"><a href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item_birth.c_member_id})">({$item_birth.nickname})さん</a><br>
({/foreach})

({* イベント *})
({foreach from=$item.event item=item_event})
<img src="./skin/icon_event_({if $item_event.is_join})R({else})B({/if}).gif" class="icon"><a href="({t_url m=pc a=page_c_event_detail})&amp;target_c_commu_topic_id=({$item_event.c_commu_topic_id})">({$item_event.name})</a><br>
({/foreach})

({if $item.schedule})
({foreach from=$item.schedule item=item_schedule name=schedule})
	({if !$item_schedule.begin_time})  <!-- 時間指定なしの予定 -->
<div class="padding_s">
({*<img src="./skin/icon_pen.gif" class="icon">*})<a href="({t_url m=biz a=page_fh_biz_schedule_view})&amp;id=({$item_schedule.biz_schedule_id})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">({$item_schedule.title})</a>
</div>
	({else})
&nbsp;
	({/if})
({/foreach})
({else})
&nbsp;
({/if})


({else})
&nbsp;
({/if})
</td>
({/foreach})
</tr>
({/foreach})

</table>
<!-- ここまで：主内容＞＞カレンダー -->
<!-- ここから：主内容＞＞天気予報を見る -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:668px;padding:2px 0px;" class="bg_09">
※<img src="./skin/icon_schedule.gif" class="icon">アイコンをクリックすると予定を入力することができます。予定は他の人にも公開されます。<br>
※プレゼント箱は({$WORD_MY_FRIEND})の誕生日、<img src="({t_img_url_skin filename=icon_event_B})" class="icon">はイベント、<img src="({t_img_url_skin filename=icon_event_R})" class="icon">は参加イベントを意味します。
</td>
</tr>
</table>
<!-- ここまで：主内容＞＞天気予報を見る -->
<!-- ここから：主内容＞＞天気予報を見る -->
<table border="0" cellspacing="0" cellpadding="0" style="width:670px;" class="border_01">
<tr>
<td style="width:668px;padding:2px 0px;" align="right" class="bg_05">
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_prev})&amp;month=({$ym.month_prev})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">&lt;&lt;&nbsp;前の月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">今月</a>
|
<a href="({t_url m=biz a=page_fh_biz_schedule_calendar})&amp;year=({$ym.year_next})&amp;month=({$ym.month_next})({if $is_f})&amp;target_id=({$c_member.c_member_id})({/if})">次の月&nbsp;&gt;&gt;</a>&nbsp;
</td>
</tr>
</table>
<!-- ここまで：主内容＞＞天気予報を見る -->
<!-- ここまで：主内容 -->
({*ここまで：body*})
({*ここから：footer*})
<!-- 無し -->
({*ここまで：footer*})
<!-- *ここまで：カレンダー＞＞内容* -->
</td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
<tr>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
<td class="bg_00"><img src="./skin/dummy.gif" style="width:7px;height:7px;" class="dummy"></td>
</tr>
</table>
</form>
<!-- ******ここまで：カレンダー****** -->
<!-- ****************************** -->

<img src="./skin/dummy.gif" class="v_spacer_l">

({***************************})
({**ここまで：メインコンテンツ**})
({***************************})
</td>
</tr>
</table>({*END:container*})
</td>
</tr>
<tr>
<td class="container inc_page_footer">
({$inc_page_footer|smarty:nodefaults})
</td>
</tr>
</table>
({ext_include file="inc_extension_pagelayout_bottom.tpl"})
</body>
</html>
