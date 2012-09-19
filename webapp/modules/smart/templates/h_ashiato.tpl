<div class="page ({$INC_HEADER_page_name})" data-role="page" id="({$INC_HEADER_page_name})">
({ext_include file="common/inc_header.tpl"})
<div class="content" data-role="content">({* {{{ content *})

({* {{{ ashiatoList *})<section class="commentListBox ashiatoListBox" id="ashiatoListBox" data-role="collapsible-set">
<h3>最近のあしあと</h3>
<div class="item">
({if $c_ashiato_list})
<ul id="ashiatoList({$u})" class="pictureIconList" data-role="listview" data-inset="false">
({foreach from=$c_ashiato_list item=item})
<li class="commentList ashiatoList"><a class="listItemLink" href="({t_url m=pc a=page_f_home})&amp;target_c_member_id=({$item.c_member_id_from})"><section class="authorBar">
<div class="photo48"><img class="ui-li-thumb memberPhoto" src="({t_img_url filename=$item.image_filename w=48 h=48 noimg=no_image trim=square})" alt="プロフィール写真"></div>
<div class="itemData">
<div class="title authorData">({$item.nickname})</div>
<div class="commentListFooter">
<time datetime="({$item.r_datetime|date_format:"%Y/%m/%d %H:%M"})" class="datetime">({$item.r_datetime|date_format:"%Y年%m月%d日%H:%M"})</time>
</div></div>
</section></a></li>
({/foreach})
</ul>

<section class="descriptionBox">
<p class="strong">総アクセス数: ({$c_ashiato_num})</p>
<p>({$c_member.nickname})さんのページを訪れた人たちです。</p>
</section>

({else})
<p>まだあしあとはありません。</p>
({/if})
</div>
</section>({* ashiatoList }}} *})

</div>({* {{{ content *})
({ext_include file="common/inc_footer.tpl"})
</div>({* page }}} *})
