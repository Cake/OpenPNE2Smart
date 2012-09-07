({* {{{ searchFormLine *})
<section class="searchFormBox searchFormLine" id="searchCommunity({$c_commu.c_commu_id})TopicFormBox" data-role="collapsible" data-collapsed="({if $keyword})false({else})true({/if})" data-content-theme="c">
<h3>検索</h3>
<p>({t_form_block _method=get m=pc a=page_c_com_topic_find})
<input type="hidden" name="c_commu_id" value="({$c_commu.c_commu_id})">
<div data-role="fieldcontain" class="ui-hide-label">
<label for="keyword">キーワード</label> <input type="search" class="input_text" name="keyword" id="keyword" size="15" value="({$keyword})">
</div>
<div data-role="fieldcontain" class="ui-hide-label">
<label for="category">検索対象</label>
<select name="target_commu">
<option value="in_commu">({$WORD_COMMUNITY})内</option>
<option value="all">({$WORD_COMMUNITY})全体</option>
</select>
</div>
<div data-role="fieldcontain">
<input type="submit" class="input_submit" value="検索">
</div>
({/t_form_block})</p>
<p><a href="({t_url m=pc a=page_h_com_find_all})&amp;keyword=({$keyword|escape:url|smarty:nodefaults})" data-role="button" data-icon="arrow-r" data-iconshadow="true" data-iconpos="right">({$WORD_COMMUNITY})を検索</a>
</p>
</section>
({* searchFormLine }}} *})
