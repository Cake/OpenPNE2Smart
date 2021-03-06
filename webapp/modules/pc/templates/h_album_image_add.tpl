<div id="LayoutC">
<div id="Center">

({* {{{ formTable *})
<div class="dparts formTable"><div class="parts">
<div class="partsHeading"><h3>写真を追加する</h3></div>

({t_form_block _enctype=file m=pc a=page_h_album_image_add_confirm})
<table>
<tr>
<th>アルバム名</th>
<td>
({$album_subject})
</td>
</tr>
<tr>
<th>写真1</th>
<td><input type="file" class="input_file" name="upfile_1" size="40" /></td>
</tr>
<tr>
<th>写真1説明</th>
<td><input type="text" class="input_text" name="image_description1" value="({$form_val.image_description1})" size="40" /></td>
</tr>
<tr>
<th>写真2</th>
<td><input type="file" class="input_file" name="upfile_2" size="40" /></td>
</tr>
<tr>
<th>写真2説明</th>
<td><input type="text" class="input_text" name="image_description2" value="({$form_val.image_description2})" size="40" /></td>
</tr>
<tr>
<th>写真3</th>
<td><input type="file" class="input_file" name="upfile_3" size="40" /></td>
</tr>
<tr>
<th>写真3説明</th>
<td><input type="text" class="input_text" name="image_description3" value="({$form_val.image_description3})" size="40" /></td>
</tr>
<tr>
<th>写真4</th>
<td><input type="file" class="input_file" name="upfile_4" size="40" /></td>
</tr>
<tr>
<th>写真4説明</th>
<td><input type="text" class="input_text" name="image_description4" value="({$form_val.image_description4})" size="40" /></td>
</tr>
<tr>
<th>写真5</th>
<td><input type="file" class="input_file" name="upfile_5" size="40" /></td>
</tr>
<tr>
<th>写真5説明</th>
<td><input type="text" class="input_text" name="image_description5" value="({$form_val.image_description5})" size="40" /></td>
</tr>
</table>

<div class="operation">
<ul class="moreInfo button">
<li>
<input type="hidden" name="target_c_album_id" value="({$target_c_album_id})" />
<input type="hidden" name="subject" value="({$album_subject})" />
<input type="submit" class="input_submit" value="確認画面" />
</li>
</ul>
</div>
({/t_form_block})
</div></div>
({* }}} *})

({**OpenPNE2 スマートフォン対応：ここから**})
({if $is_apple})
<div class="dparts infoButtonBox"><div class="parts">
<div class="partsHeading"><h3>メールで写真を設定する</h3></div>
<div class="block">
({t_mail_post mailto=$mail_address _type=button})
<p>({$SNS_NAME})に登録したメールアドレスから投稿してください。<br>
写真は1枚目のみをアルバムに登録します。<br>
メールの件名は写真の説明になります。<br>
絵文字は反映されません。<br>
</p>
</div>
</div></div>
({/if})({**OpenPNE2 スマートフォン対応：ここまで**})

({* {{{ linkLine *})
<div class="parts linkLine"><ul class="moreInfo">
<li><a href="({t_url m=pc a=page_fh_album})&amp;target_c_album_id=({$target_c_album_id})">アルバムページへ戻る</a></li>
</ul></div>
({* }}} *})

</div><!-- Center -->
</div><!-- LayoutC -->
