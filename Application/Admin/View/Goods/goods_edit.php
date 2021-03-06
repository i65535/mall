{include file="pageheader"}

{if $warning}
<ul style="padding:0; margin: 0; list-style-type:none; color: #CC0000;">
  <li style="border: 1px solid #CC0000; background: #FFFFCC; padding: 10px; margin-bottom: 5px;" >{$warning}</li>
</ul>
{/if}

<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">{$ur_here}</h3>
  </div>
  <div class="panel-body">
    <ul class="nav nav-tabs" role="tablist" id="myTab">
      <li class="active"><a href="#general-tab" role="tab" data-toggle="tab">{$lang['tab_general']}</a></li>
      <li><a href="#detail-tab" role="tab" data-toggle="tab">{$lang['tab_detail']}</a></li>
      <li><a href="#mix-tab" role="tab" data-toggle="tab">{$lang['tab_mix']}</a></li>
      {if $goods_type_list}<li><a href="#properties-tab" role="tab" data-toggle="tab">{$lang['tab_properties']}</a></li>{/if}
      <li><a href="#gallery-tab" role="tab" data-toggle="tab">{$lang['tab_gallery']}</a></li>
      <li><a href="#linkgoods-tab" role="tab" data-toggle="tab">{$lang['tab_linkgoods']}</a></li>
      {if $code == ''}<li><a href="#groupgoods-tab" role="tab" data-toggle="tab">{$lang['tab_groupgoods']}</a></li>{/if}
      <li><a href="#article-tab" role="tab" data-toggle="tab">{$lang['tab_article']}</a></li>
    </ul>
    <form action="{U('post')}" method="post" enctype="multipart/form-data" class="form-horizontal" role="form" name="theForm">
    	<!-- 最大文件限制 -->
        <input type="hidden" name="MAX_FILE_SIZE" value="2097152" />
		<input type="hidden" name="act" value="{$form_act}" />
        <input type="hidden" name="goods_id" value="{$goods['goods_id']}" />
          {if $code != ''}
          <input type="hidden" name="extension_code" value="{$code}" />
          {/if}
		<div class="tab-content">
		<div class="tab-pane active" id="general-tab">
          <table class="table table-hover ectouch-table">
          <tr>
            <td width="200">{$lang['lab_goods_name']}</td>
            <td><input type="text" name="goods_name" value="{$goods['goods_name']}" style="float:left;" size="30" />	
            {$lang['require_field']}</td>
          </tr>
          <tr>
            <td>
            <a href="javascript:showNotice('noticeGoodsSN');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a> {$lang['lab_goods_sn']} </td>
            <td><input type="text" name="goods_sn" value="{$goods['goods_sn']}" size="20" onblur="checkGoodsSn(this.value,'{$goods['goods_id']}')" /><span id="goods_sn_notice"></span><br />
            <span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="noticeGoodsSN">{$lang['notice_goods_sn']}</span></td>
          </tr>
          <tr>
            <td>{$lang['lab_goods_cat']}</td>
            <td><select name="cat_id" onchange="hideCatDiv()" ><option value="0">{$lang['select_please']}</option>{$cat_list}</select>
              
               {$lang['require_field']}
            </td>
          </tr>
          <tr>
            <td>{$lang['lab_other_cat']}</td>
            <td>
              <input type="button" value="{$lang['add']}" onclick="addOtherCat(this.parentNode)" class="button" />
              {loop $goods['other_cat'] $cat_id}
              <select name="other_cat[]"><option value="0">{$lang['select_please']}</option>{$other_cat_list[$cat_id]}</select>
              {/loop}
            </td>
          </tr>
          <tr>
            <td>{$lang['lab_goods_brand']}</td>
            <td><select name="brand_id" onchange="hideBrandDiv()" >
            		<option value="0">{$lang['select_please']}</option>
            		{$brand_list_option}
            	</select>

            </td>
          </tr>
         {if $suppliers_exists == 1}
          <tr>
            <td>{$lang['label_suppliers']}</td>
            <td><select name="suppliers_id" id="suppliers_id">
		        <option value="0">{$lang['suppliers_no']}</option>
		        {$suppliers_list_option}
		    </select></td>
          </tr>
         {/if}
          <tr>
            <td>{$lang['lab_shop_price']}</td>
            <td><input type="text" name="shop_price" value="{$goods['shop_price']}" size="20" onblur="priceSetted()"/>
            <input type="button" value="{$lang['compute_by_mp']}" onclick="marketPriceSetted()" />
            {$lang['require_field']}</td>
          </tr>
          {if $user_rank_list}
          <tr>
            <td><a href="javascript:showNotice('noticeUserPrice');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a>{$lang['lab_user_price']}</td>
            <td>
              {loop $user_rank_list $user_rank}
              {$user_rank['rank_name']}<span id="nrank_{$user_rank['rank_id']}"></span><input type="text" id="rank_{$user_rank['rank_id']}" name="user_price[]" value="{$member_price_list[$user_rank['rank_id']]}" onkeyup="if(parseInt(this.value)<-1){this.value='-1';};set_price_note({$user_rank['rank_id']})" size="8" />
              <input type="hidden" name="user_rank[]" value="{$user_rank['rank_id']}" />
              {/loop}
              <br />
              <span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="noticeUserPrice">{$lang['notice_user_price']}</span>
            </td>
          </tr>
          {/if}

          <!--商品优惠价格-->
          <tr>
            <td><a href="javascript:showNotice('volumePrice');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a>{$lang['lab_volume_price']}</td>
            <td>
              <table width="100%" id="tbody-volume" align="center">
                {loop $volume_price_list $key $volume_price}
                <tr>
                  <td>
                     {if $key == 0}
                       <a href="javascript:;" onclick="addVolumePrice(this)">[+]</a>
                     {else}
                       <a href="javascript:;" onclick="removeVolumePrice(this)">[-]</a>
                     {/if}
                     {$lang['volume_number']} <input type="text" name="volume_number[]" size="8" value="{$volume_price['number']}"/>
                     {$lang['volume_price']} <input type="text" name="volume_price[]" size="8" value="{$volume_price['price']}"/>
                  </td>
                </tr>
                {/loop}
              </table>
              <span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="volumePrice">{$lang['notice_volume_price']}</span>
            </td>
          </tr>
          <!--商品优惠价格 end -->

          <tr>
            <td>{$lang['lab_market_price']}</td>
            <td><input type="text" name="market_price" value="{$goods['market_price']}" size="20" />
              <input type="button" value="{$lang['integral_market_price']}" onclick="integral_market_price()" />
            </td>
          </tr>
          <tr>
            <td><a href="javascript:showNotice('giveIntegral');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a> {$lang['lab_give_integral']}</td>
            <td><input type="text" name="give_integral" value="{$goods['give_integral']}" size="20" />
            <br /><span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="giveIntegral">{$lang['notice_give_integral']}</span></td>
          </tr>
          <tr>
            <td><a href="javascript:showNotice('rankIntegral');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a> {$lang['lab_rank_integral']}</td>
            <td><input type="text" name="rank_integral" value="{$goods['rank_integral']}" size="20" />
            <br /><span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="rankIntegral">{$lang['notice_rank_integral']}</span></td>
          </tr>
          <tr>
            <td><a href="javascript:showNotice('noticPoints');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a> {$lang['lab_integral']}</td>
            <td><input type="text" name="integral" value="{$goods['integral']}" size="20" onblur="parseint_integral()";/>
              <br /><span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="noticPoints">{$lang['notice_integral']}</span>
            </td>
          </tr>
          <tr>
            <td><label for="is_promote"><input type="checkbox" id="is_promote" name="is_promote" value="1" {if $goods['is_promote']}checked="checked"{/if} onclick="handlePromote(this.checked);" /> {$lang['lab_promote_price']}</label></td>
            <td id="promote_3"><input type="text" id="promote_1" name="promote_price" value="{$goods['promote_price']}" size="20" /></td>
          </tr>
          <tr id="promote_4">
            <td id="promote_5">{$lang['lab_promote_date']}</td>
            <td id="promote_6">
              <input name="promote_start_date" type="text" id="promote_start_date" size="12" value='{$goods['promote_start_date']}' readonly="readonly" /><input name="selbtn1" type="button" id="selbtn1" onclick="return showCalendar('promote_start_date', '%Y-%m-%d', false, false, 'selbtn1');" value="{$lang['btn_select']}" class="button"/> - <input name="promote_end_date" type="text" id="promote_end_date" size="12" value='{$goods['promote_end_date']}' readonly="readonly" /><input name="selbtn2" type="button" id="selbtn2" onclick="return showCalendar('promote_end_date', '%Y-%m-%d', false, false, 'selbtn2');" value="{$lang['btn_select']}" class="button"/>
            </td>
          </tr>
          <tr>
            <td>{$lang['lab_picture']}</td>
            <td>
              <input type="file" name="goods_img" size="35" />
              {if $goods['goods_img']}
                <a href="{U('operate',array('act'=>'show_image'))}?img_url={$goods['goods_img']}" target="_blank"><img src="__PUBLIC__/images/yes.gif" border="0" /></a>
              {else}
                <img src="__PUBLIC__/images/no.gif" />
              {/if}
              <br /><input type="text" size="40" value="{$lang['lab_picture_url']}" style="color:#aaa;" onfocus="if (this.value == '{$lang['lab_picture_url']}'){this.value='http://';this.style.color='#000';}" name="goods_img_url"/>
            </td>
          </tr>
          <tr id="auto_thumb_1">
            <td> {$lang['lab_thumb']}</td>
            <td id="auto_thumb_3">
              <input type="file" name="goods_thumb" size="35" />
              {if $goods['goods_thumb']}
                <a href="{U('operate',array('act'=>'show_image'))}?img_url={$goods['goods_thumb']}" target="_blank"><img src="__PUBLIC__/images/yes.gif" border="0" /></a>
              {else}
                <img src="__PUBLIC__/images/no.gif" />
              {/if}
              <br /><input type="text" size="40" value="{$lang['lab_thumb_url']}" style="color:#aaa;" onfocus="if (this.value == '{$lang['lab_thumb_url']}'){this.value='http://';this.style.color='#000';}" name="goods_thumb_url"/>
              {if $gd > 0}
              <br /><label for="auto_thumb"><input type="checkbox" id="auto_thumb" name="auto_thumb" checked="true" value="1" onclick="handleAutoThumb(this.checked)" />{$lang['auto_thumb']}</label>{/if}
            </td>
          </tr>
        </table>
        </div>
        <!-- 详细描述 -->
        <div class="tab-pane" id="detail-tab">
          <table class="table table-hover ectouch-table">
          	<tr>
          		<td><div class="col-md-9">
              	<script id="container" name="goods_desc" type="text/plain" style="width:810px; height:360px;">{$goods['goods_desc']}</script>
           		</div></td>
          	</tr>
          </table>
        </div>
        <!-- 其他信息 -->
        <div class="tab-pane" id="mix-tab">
          <table class="table table-hover ectouch-table">
            {if $code == ''}
	          <tr>
	            <td width="200">{$lang['lab_goods_weight']}</td>
	            <td><input type="text" name="goods_weight" value="{$goods['goods_weight_by_unit']}" size="20" /> <select name="weight_unit">{$unit_list_option}</select></td>
	          </tr>
	          {/if}
	          {if $use_storage}
	          <tr>
	            <td width="200"><a href="javascript:showNotice('noticeStorage');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a> {$lang['lab_goods_number']}</td>
	<!--            <td><input type="text" name="goods_number" value="{$goods['goods_number']}" size="20" {if $code != '' || $goods['_attribute'] != ''}readonly="readonly"{/if} /><br />-->
	            <td><input type="text" name="goods_number" value="{$goods['goods_number']}" size="20" /><br />
	            <span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="noticeStorage">{$lang['notice_storage']}</span></td>
	          </tr>
	          <tr>
	            <td>{$lang['lab_warn_number']}</td>
	            <td><input type="text" name="warn_number" value="{$goods['warn_number']}" size="20" /></td>
	          </tr>
	          {/if}
	          <tr>
	            <td>{$lang['lab_intro']}</td>
	            <td><input type="checkbox" name="is_best" value="1" {if $goods['is_best']}checked="checked"{/if} />{$lang['is_best']} <input type="checkbox" name="is_new" value="1" {if $goods['is_new']}checked="checked"{/if} />{$lang['is_new']} <input type="checkbox" name="is_hot" value="1" {if $goods['is_hot']}checked="checked"{/if} />{$lang['is_hot']}</td>
	          </tr>
	          <tr id="alone_sale_1">
	            <td id="alone_sale_2">{$lang['lab_is_on_sale']}</td>
	            <td id="alone_sale_3"><input type="checkbox" name="is_on_sale" value="1" {if $goods['is_on_sale']}checked="checked"{/if} /> {$lang['on_sale_desc']}</td>
	          </tr>
	          <tr>
	            <td>{$lang['lab_is_alone_sale']}</td>
	            <td><input type="checkbox" name="is_alone_sale" value="1" {if $goods['is_alone_sale']}checked="checked"{/if} /> {$lang['alone_sale']}</td>
	          </tr>
	          <tr>
	            <td>{$lang['lab_is_free_shipping']}</td>
	            <td><input type="checkbox" name="is_shipping" value="1" {if $goods['is_shipping']}checked="checked"{/if} /> {$lang['free_shipping']}</td>
	          </tr>
	          <tr>
	            <td>{$lang['lab_keywords']}</td>
	            <td><input type="text" name="keywords" value="{$goods['keywords']}" size="40" /> {$lang['notice_keywords']}</td>
	          </tr>
	          <tr>
	            <td>{$lang['lab_goods_brief']}</td>
	            <td><textarea name="goods_brief" cols="40" rows="3">{$goods['goods_brief']}</textarea></td>
	          </tr>
	          <tr>
	            <td>
	            <a href="javascript:showNotice('noticeSellerNote');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a> {$lang['lab_seller_note']} </td>
	            <td><textarea name="seller_note" cols="40" rows="3">{$goods['seller_note']}</textarea><br />
	            <span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="noticeSellerNote">{$lang['notice_seller_note']}</span></td>
	          </tr>
          </table>
        </div> 
        <!-- 属性与规格 -->
        {if $goods_type_list}
        <div class="tab-pane" id="properties-tab">
          <table class="table table-hover ectouch-table">
            <tr>
              <td width='200'><a href="javascript:showNotice('noticeGoodsType');" title="{$lang['form_notice']}"><img src="__PUBLIC__/images/notice.gif" width="16" height="16" border="0" alt="{$lang['form_notice']}"></a>{$lang['lab_goods_type']}</td>
              <td>
                <select name="goods_type" onchange="getAttrList({$goods['goods_id']})">
                  <option value="0">{$lang['sel_goods_type']}</option>
                  {$goods_type_list}
                </select><br />
              <span class="notice-span" {if $help_open}style="display:block" {else} style="display:none" {/if} id="noticeGoodsType">{$lang['notice_goods_type']}</span></td>
          </tr>
          <tr>
            <td id="tbody-goodsAttr" colspan="2" style="padding:0">{$goods_attr_html}</td>
          </tr>
          </table>
        </div> 
        {/if}
        <!-- 商品相册 -->
        <div class="tab-pane" id="gallery-tab">
          <table class="table table-hover ectouch-table" id="gallery-table">
            <!-- 图片列表 -->
	          <tr>
	            <td>
	              {loop $img_list $img}
	              <div id="gallery_{$img['img_id']}" style="float:left; text-align:center; border: 1px solid #DADADA; margin: 4px; padding:2px;">
	                <a href="javascript:;" onclick="if (confirm('{$lang['drop_img_confirm']}')) dropImg('{$img['img_id']}')">[-]</a><br />
	                <a href="{U('operate',array('act'=>'show_image'))}?img_url={$img['img_url']}" target="_blank">
	                <img src="/{if $img['thumb_url']}{$img['thumb_url']}{else}{$img['img_url']}{/if}" {if $thumb_width != 0}width="{$thumb_width}"{/if} {if $thumb_height != 0}height="{$thumb_height}"{/if} border="0" />
	                </a><br />
	                <input type="text" value="{$img['img_desc']}" size="15" name="old_img_desc[{$img['img_id']}]" />
	              </div>
	              {/loop}
	            </td>
	          </tr>
	          <tr><td>&nbsp;</td></tr>
	          <!-- 上传图片 -->
	          <tr>
	            <td>
	              <a href="javascript:;" onclick="addImg(this)">[+]</a>
	              {$lang['img_desc']} <input type="text" name="img_desc[]" size="20" />
	              {$lang['img_url']} <input type="file" name="img_url[]" />
	              <input type="text" size="40" value="{$lang['img_file']}" style="color:#aaa;" onfocus="if (this.value == '{$lang['img_file']}'){this.value='http://';this.style.color='#000';}" name="img_file[]"/>
	            </td>
	          </tr>
          </table>
        </div> 
        <!-- 关联商品 -->
        <div class="tab-pane" id="linkgoods-tab">
          <table class="table table-hover ectouch-table">
            <!-- 商品搜索 -->
	          <tr>
	            <td colspan="3">
	              <img src="__PUBLIC__/images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH" />
	              <select name="cat_id1"><option value="0">{$lang['all_category']}{$cat_list}</select>
	              <select name="brand_id1"><option value="0">{$lang['all_brand']}</option>{$brand_list_option}</select>
	              <input type="text" name="keyword1" />
	              <input type="button" value="{$lang['button_search']}"  class="button"
	                onclick="searchGoods(sz1, 'cat_id1','brand_id1','keyword1')" />
	            </td>
	          </tr>
	          <!-- 商品列表 -->
	          <tr>
	            <th>{$lang['all_goods']}</th>
	            <th>{$lang['handler']}</th>
	            <th>{$lang['link_goods']}</th>
	          </tr>
	          <tr>
	            <td width="42%">
	              <select name="source_select1" size="20" style="width:100%" ondblclick="sz1.addItem(false, 'add_link_goods', goodsId, this.form.elements['is_single'][0].checked)" multiple="true">
	              </select>
	            </td>
	            <td align="center">
	              <p><input name="is_single" type="radio" value="1" checked="checked" />{$lang['single']}<br /><input name="is_single" type="radio" value="0" />{$lang['double']}</p>
	              <p><input type="button" value=">>" onclick="sz1.addItem(true, 'add_link_goods', goodsId, this.form.elements['is_single'][0].checked)" class="button" /></p>
	              <p><input type="button" value=">" onclick="sz1.addItem(false, 'add_link_goods', goodsId, this.form.elements['is_single'][0].checked)" class="button" /></p>
	              <p><input type="button" value="<" onclick="sz1.dropItem(false, 'drop_link_goods', goodsId, elements['is_single'][0].checked)" class="button" /></p>
	              <p><input type="button" value="<<" onclick="sz1.dropItem(true, 'drop_link_goods', goodsId, elements['is_single'][0].checked)" class="button" /></p>
	            </td>
	            <td width="42%">
	              <select name="target_select1" size="20" style="width:100%" multiple ondblclick="sz1.dropItem(false, 'drop_link_goods', goodsId, elements['is_single'][0].checked)">
	                {loop $link_goods_list $link_goods}
	                <option value="{$link_goods['goods_id']}">{$link_goods['goods_name']}</option>
	                {/loop}
	              </select>
	            </td>
	          </tr>
          </table>
        </div> 
        <!-- 配件 -->
        <div class="tab-pane" id="groupgoods-tab">
          <table class="table table-hover ectouch-table">
            <!-- 商品搜索 -->
	          <tr>
	            <td colspan="3">
	              <img src="__PUBLIC__/images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH" />
	              <select name="cat_id2"><option value="0">{$lang['all_category']}{$cat_list}</select>
	              <select name="brand_id2"><option value="0">{$lang['all_brand']}</option>{$brand_list_option}</select>
	              <input type="text" name="keyword2" />
	              <input type="button" value="{$lang['button_search']}" onclick="searchGoods(sz2, 'cat_id2', 'brand_id2', 'keyword2')" class="button" />
	            </td>
	          </tr>
	          <!-- 商品列表 -->
	          <tr>
	            <th>{$lang['all_goods']}</th>
	            <th>{$lang['handler']}</th>
	            <th>{$lang['group_goods']}</th>
	          </tr>
	          <tr>
	            <td width="42%">
	              <select name="source_select2" size="20" style="width:100%" onchange="sz2.priceObj.value = this.options[this.selectedIndex].id" ondblclick="sz2.addItem(false, 'add_group_goods', goodsId, this.form.elements['price2'].value)">
	              </select>
	            </td>
	            <td align="center">
	              <p>{$lang['price']}<br /><input name="price2" type="text" size="6" /></p>
	              <p><input type="button" value=">" onclick="sz2.addItem(false, 'add_group_goods', goodsId, this.form.elements['price2'].value)" class="button" /></p>
	              <p><input type="button" value="<" onclick="sz2.dropItem(false, 'drop_group_goods', goodsId, elements['is_single'][0].checked)" class="button" /></p>
	              <p><input type="button" value="<<" onclick="sz2.dropItem(true, 'drop_group_goods', goodsId, elements['is_single'][0].checked)" class="button" /></p>
	            </td>
	            <td width="42%">
	              <select name="target_select2" size="20" style="width:100%" multiple ondblclick="sz2.dropItem(false, 'drop_group_goods', goodsId, elements['is_single'][0].checked)">
	                {loop $group_goods_list $group_goods}
	                <option value="{$group_goods['goods_id']}">{$group_goods['goods_name']}</option>
	                {/loop}
	              </select>
	            </td>
	          </tr>
          </table>
        </div> 
        <!-- 关联文章 -->
        <div class="tab-pane" id="article-tab">
          <table class="table table-hover ectouch-table">
            <!-- 文章搜索 -->
	          <tr>
	            <td colspan="3">
	              <img src="__PUBLIC__/images/icon_search.gif" width="26" height="22" border="0" alt="SEARCH" />
	              {$lang['article_title']} <input type="text" name="article_title" />
	              <input type="button" value="{$lang['button_search']}" onclick="searchArticle()" class="button" />
	            </td>
	          </tr>
	          <!-- 文章列表 -->
	          <tr>
	            <th>{$lang['all_article']}</th>
	            <th>{$lang['handler']}</th>
	            <th>{$lang['goods_article']}</th>
	          </tr>
	          <tr>
	            <td width="45%">
	              <select name="source_select3" size="20" style="width:100%" multiple ondblclick="sz3.addItem(false, 'add_goods_article', goodsId, this.form.elements['price2'].value)">
	              </select>
	            </td>
	            <td align="center">
	              <p><input type="button" value=">>" onclick="sz3.addItem(true, 'add_goods_article', goodsId, this.form.elements['price2'].value)" class="button" /></p>
	              <p><input type="button" value=">" onclick="sz3.addItem(false, 'add_goods_article', goodsId, this.form.elements['price2'].value)" class="button" /></p>
	              <p><input type="button" value="<" onclick="sz3.dropItem(false, 'drop_goods_article', goodsId, elements['is_single'][0].checked)" class="button" /></p>
	              <p><input type="button" value="<<" onclick="sz3.dropItem(true, 'drop_goods_article', goodsId, elements['is_single'][0].checked)" class="button" /></p>
	            </td>
	            <td width="45%">
	              <select name="target_select3" size="20" style="width:100%" multiple ondblclick="sz3.dropItem(false, 'drop_goods_article', goodsId, elements['is_single'][0].checked)">
	                {loop $goods_article_list $goods_article}
	                <option value="{$goods_article['article_id']}">{$goods_article['title']}</option>
	                {/loop}
	              </select>
	            </td>
	          </tr>
          </table>
        </div>
        <div style="padding:10px 0 0 200px; border-top:1px #ddd solid;">
          <input name="submit" type="submit" value="{$lang['button_submit']}" class="btn btn-primary" onclick="validate('{$goods['goods_id']}')" />
          <input name="reset" type="reset" value="{$lang['button_reset']}" class="btn btn-default" />
        </div>
      </div>
    </form>
  </div>
</div>


<script type="text/javascript" src="__PUBLIC__/js/transport.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/utils.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/selectzone.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/validator.js"></script>
<script type="text/javascript" src="__PUBLIC__/js/calendar.php"></script>
<script type="text/javascript" src="__PUBLIC__/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="__PUBLIC__/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript">var ue = UE.getEditor('container');</script>
<link href="__PUBLIC__/js/calendar/calendar.css" rel="stylesheet" type="text/css" />

<script language="JavaScript">
  var goodsId = '{$goods['goods_id']}';
  var elements = document.forms['theForm'].elements;
  var ajax_url = "{U('operate')}?is_ajax=1";
  var sz1 = new SelectZone(1, elements['source_select1'], elements['target_select1'], null, ajax_url);
  var sz2 = new SelectZone(2, elements['source_select2'], elements['target_select2'], elements['price2'], ajax_url);
  var sz3 = new SelectZone(1, elements['source_select3'], elements['target_select3'], null, ajax_url);
  var marketPriceRate = {$market_price_rate};
  var integralPercent = {$integral_percent};

  onload = function()
  {
      handlePromote(document.forms['theForm'].elements['is_promote'].checked);

      if (document.forms['theForm'].elements['auto_thumb'])
      {
          handleAutoThumb(document.forms['theForm'].elements['auto_thumb'].checked);
      }

      // 检查新订单
      startCheckOrder();
      {loop $user_rank_list $item}
      set_price_note({$item['rank_id']});
      {/loop}
  }

  function validate(goods_id)
  {
      var validator = new Validator('theForm');
      var goods_sn  = document.forms['theForm'].elements['goods_sn'].value;

      validator.required('goods_name', goods_name_not_null);
      if (document.forms['theForm'].elements['cat_id'].value == 0)
      {
          validator.addErrorMsg(goods_cat_not_null);
      }

      checkVolumeData("1",validator);

      validator.required('shop_price', shop_price_not_null);
      validator.isNumber('shop_price', shop_price_not_number, true);
      validator.isNumber('market_price', market_price_not_number, false);
      if (document.forms['theForm'].elements['is_promote'].checked)
      {
          validator.required('promote_start_date', promote_start_not_null);
          validator.required('promote_end_date', promote_end_not_null);
          validator.islt('promote_start_date', 'promote_end_date', promote_not_lt);
      }

      if (document.forms['theForm'].elements['goods_number'] != undefined)
      {
          validator.isInt('goods_number', goods_number_not_int, false);
          validator.isInt('warn_number', warn_number_not_int, false);
      }

      var callback = function(res)
     {
      if (res.error > 0)
      {
        alert("{$lang['goods_sn_exists']}");
      }
      else
      {
         if(validator.passed())
         {
         document.forms['theForm'].submit();
         }
      }
  }
    Ajax.call("{U('operate',array('act'=>'check_goods_sn'))}?", "goods_sn=" + goods_sn + "&goods_id=" + goods_id, callback, "GET", "JSON");
}

  /**
   * 切换商品类型
   */
  function getAttrList(goodsId)
  {
      var selGoodsType = document.forms['theForm'].elements['goods_type'];

      if (selGoodsType != undefined)
      {
          var goodsType = selGoodsType.options[selGoodsType.selectedIndex].value;

          Ajax.call("{U('goods/get_attr')}" , 'goods_id=' + goodsId + "&goods_type=" + goodsType, setAttrList, "GET", "JSON");
      }
  }

  function setAttrList(result, text_result)
  {
    document.getElementById('tbody-goodsAttr').innerHTML = result.content;
  }

  /**
   * 按比例计算价格
   * @param   string  inputName   输入框名称
   * @param   float   rate        比例
   * @param   string  priceName   价格输入框名称（如果没有，取shop_price）
   */
  function computePrice(inputName, rate, priceName)
  {
      var shopPrice = priceName == undefined ? document.forms['theForm'].elements['shop_price'].value : document.forms['theForm'].elements[priceName].value;
      shopPrice = Utils.trim(shopPrice) != '' ? parseFloat(shopPrice)* rate : 0;
      if(inputName == 'integral')
      {
          shopPrice = parseInt(shopPrice);
      }
      shopPrice += "";

      n = shopPrice.lastIndexOf(".");
      if (n > -1)
      {
          shopPrice = shopPrice.substr(0, n + 3);
      }

      if (document.forms['theForm'].elements[inputName] != undefined)
      {
          document.forms['theForm'].elements[inputName].value = shopPrice;
      }
      else
      {
          document.getElementById(inputName).value = shopPrice;
      }
  }

  /**
   * 设置了一个商品价格，改变市场价格、积分以及会员价格
   */
  function priceSetted()
  {
    computePrice('market_price', marketPriceRate);
    computePrice('integral', integralPercent / 100);
    {loop $user_rank_list $item}
    set_price_note({$item['rank_id']});
    {/loop}
  }

  /**
   * 设置会员价格注释
   */
  function set_price_note(rank_id)
  {
    var shop_price = parseFloat(document.forms['theForm'].elements['shop_price'].value);

    var rank = new Array();
    {loop $user_rank_list $item}
    rank[{$item['rank_id']}] = {$item['discount']};
    {/loop}
    if (shop_price >0 && rank[rank_id] && document.getElementById('rank_' + rank_id) && parseInt(document.getElementById('rank_' + rank_id).value) == -1)
    {
      var price = parseInt(shop_price * rank[rank_id] + 0.5) / 100;
      if (document.getElementById('nrank_' + rank_id))
      {
        document.getElementById('nrank_' + rank_id).innerHTML = '(' + price + ')';
      }
    }
    else
    {
      if (document.getElementById('nrank_' + rank_id))
      {
        document.getElementById('nrank_' + rank_id).innerHTML = '';
      }
    }
  }

  /**
   * 根据市场价格，计算并改变商店价格、积分以及会员价格
   */
  function marketPriceSetted()
  {
    computePrice('shop_price', 1/marketPriceRate, 'market_price');
    computePrice('integral', integralPercent / 100);
    {loop $user_rank_list $item}
    set_price_note({$item['rank_id']});
    {/loop}
  }

  /**
   * 新增一个规格
   */
  function addSpec(obj)
  {
      var src   = obj.parentNode.parentNode;
      var idx   = rowindex(src);
      var tbl   = document.getElementById('attrTable');
      var row   = tbl.insertRow(idx + 1);
      var cell1 = row.insertCell(-1);
      var cell2 = row.insertCell(-1);
      var regx  = /<a([^>]+)<\/a>/i;

      cell1.className = 'label';
      cell1.innerHTML = src.childNodes[0].innerHTML.replace(/(.*)(addSpec)(.*)(\[)(\+)/i, "$1removeSpec$3$4-");
      cell2.innerHTML = src.childNodes[1].innerHTML.replace(/readOnly([^\s|>]*)/i, '');
  }

  /**
   * 删除规格值
   */
  function removeSpec(obj)
  {
      var row = rowindex(obj.parentNode.parentNode);
      var tbl = document.getElementById('attrTable');

      tbl.deleteRow(row);
  }

  /**
   * 处理规格
   */
  function handleSpec()
  {
      var elementCount = document.forms['theForm'].elements.length;
      for (var i = 0; i < elementCount; i++)
      {
          var element = document.forms['theForm'].elements[i];
          if (element.id.substr(0, 5) == 'spec_')
          {
              var optCount = element.options.length;
              var value = new Array(optCount);
              for (var j = 0; j < optCount; j++)
              {
                  value[j] = element.options[j].value;
              }

              var hiddenSpec = document.getElementById('hidden_' + element.id);
              hiddenSpec.value = value.join(String.fromCharCode(13)); // 用回车键隔开每个规格
          }
      }
      return true;
  }

  function handlePromote(checked)
  {
      document.forms['theForm'].elements['promote_price'].disabled = !checked;
      document.forms['theForm'].elements['selbtn1'].disabled = !checked;
      document.forms['theForm'].elements['selbtn2'].disabled = !checked;
  }

  function handleAutoThumb(checked)
  {
      document.forms['theForm'].elements['goods_thumb'].disabled = checked;
      document.forms['theForm'].elements['goods_thumb_url'].disabled = checked;
  }

  /**
   * 快速添加品牌
   */
  function rapidBrandAdd(conObj)
  {
      var brand_div = document.getElementById("brand_add");

      if(brand_div.style.display != '')
      {
          var brand =document.forms['theForm'].elements['addedBrandName'];
          brand.value = '';
          brand_div.style.display = '';
      }
  }

  function hideBrandDiv()
  {
      var brand_add_div = document.getElementById("brand_add");
      if(brand_add_div.style.display != 'none')
      {
          brand_add_div.style.display = 'none';
      }
  }

  function goBrandPage()
  {
      if(confirm(go_brand_page))
      {
          window.location.href="{U('brand/add')}";
      }
      else
      {
          return;
      }
  }

  function rapidCatAdd()
  {
      var cat_div = document.getElementById("category_add");

      if(cat_div.style.display != '')
      {
          var cat =document.forms['theForm'].elements['addedCategoryName'];
          cat.value = '';
          cat_div.style.display = '';
      }
  }

  function addBrand()
  {
      var brand = document.forms['theForm'].elements['addedBrandName'];
      if(brand.value.replace(/^\s+|\s+$/g, '') == '')
      {
          alert(brand_cat_not_null);
          return;
      }

      var params = 'brand=' + brand.value;
      Ajax.call("{U('brand/operate',array('act'=>'add_brand'))}", params, addBrandResponse, 'GET', 'JSON');
  }

  function addBrandResponse(result)
  {
      if (result.error == '1' && result.message != '')
      {
          alert(result.message);
          return;
      }

      var brand_div = document.getElementById("brand_add");
      brand_div.style.display = 'none';

      var response = result.content;

      var selCat = document.forms['theForm'].elements['brand_id'];
      var opt = document.createElement("OPTION");
      opt.value = response.id;
      opt.selected = true;
      opt.text = response.brand;

      if (Browser.isIE)
      {
          selCat.add(opt);
      }
      else
      {
          selCat.appendChild(opt);
      }

      return;
  }

  function addCategory()
  {
      var parent_id = document.forms['theForm'].elements['cat_id'];
      var cat = document.forms['theForm'].elements['addedCategoryName'];
      if(cat.value.replace(/^\s+|\s+$/g, '') == '')
      {
          alert(category_cat_not_null);
          return;
      }

      var params = 'parent_id=' + parent_id.value;
      params += '&cat=' + cat.value;
      Ajax.call("{U('category/operate',array('act'=>'add_category'))}", params, addCatResponse, 'GET', 'JSON');
  }

  function hideCatDiv()
  {
      var category_add_div = document.getElementById("category_add");
      if(category_add_div.style.display != null)
      {
          category_add_div.style.display = 'none';
      }
  }

  function addCatResponse(result)
  {
      if (result.error == '1' && result.message != '')
      {
          alert(result.message);
          return;
      }

      var category_add_div = document.getElementById("category_add");
      category_add_div.style.display = 'none';

      var response = result.content;

      var selCat = document.forms['theForm'].elements['cat_id'];
      var opt = document.createElement("OPTION");
      opt.value = response.id;
      opt.selected = true;
      opt.innerHTML = response.cat;

      //获取子分类的空格数
      var str = selCat.options[selCat.selectedIndex].text;
      var temp = str.replace(/^\s+/g, '');
      var lengOfSpace = str.length - temp.length;
      if(response.parent_id != 0)
      {
          lengOfSpace += 4;
      }
      for (i = 0; i < lengOfSpace; i++)
      {
          opt.innerHTML = '&nbsp;' + opt.innerHTML;
      }

      for (i = 0; i < selCat.length; i++)
      {
          if(selCat.options[i].value == response.parent_id)
          {
              if(i == selCat.length)
              {
                  if (Browser.isIE)
                  {
                      selCat.add(opt);
                  }
                  else
                  {
                      selCat.appendChild(opt);
                  }
              }
              else
              {
                  selCat.insertBefore(opt, selCat.options[i + 1]);
              }
              //opt.selected = true;
              break;
          }

      }

      return;
  }

    function goCatPage()
    {
        if(confirm(go_category_page))
        {
            window.location.href="{U('category/add')}";
        }
        else
        {
            return;
        }
    }


  /**
   * 删除快速分类
   */
  function removeCat()
  {
      if(!document.forms['theForm'].elements['parent_cat'] || !document.forms['theForm'].elements['new_cat_name'])
      {
          return;
      }

      var cat_select = document.forms['theForm'].elements['parent_cat'];
      var cat = document.forms['theForm'].elements['new_cat_name'];

      cat.parentNode.removeChild(cat);
      cat_select.parentNode.removeChild(cat_select);
  }

  /**
   * 删除快速品牌
   */
  function removeBrand()
  {
      if (!document.forms['theForm'].elements['new_brand_name'])
      {
          return;
      }

      var brand = document.theForm.new_brand_name;
      brand.parentNode.removeChild(brand);
  }

  /**
   * 添加扩展分类
   */
  function addOtherCat(conObj)
  {
      var sel = document.createElement("SELECT");
      var selCat = document.forms['theForm'].elements['cat_id'];

      for (i = 0; i < selCat.length; i++)
      {
          var opt = document.createElement("OPTION");
          opt.text = selCat.options[i].text;
          opt.value = selCat.options[i].value;
          if (Browser.isIE)
          {
              sel.add(opt);
          }
          else
          {
              sel.appendChild(opt);
          }
      }
      conObj.appendChild(sel);
      sel.name = "other_cat[]";
      sel.onChange = function() {checkIsLeaf(this);};
  }

  /* 关联商品函数 */
  function searchGoods(szObject, catId, brandId, keyword)
  {
      var filters = new Object;

      filters.cat_id = elements[catId].value;
      filters.brand_id = elements[brandId].value;
      filters.keyword = Utils.trim(elements[keyword].value);
      filters.exclude = document.forms['theForm'].elements['goods_id'].value;

      szObject.loadOptions('get_goods_list', filters);
  }

  /**
   * 关联文章函数
   */
  function searchArticle()
  {
    var filters = new Object;

    filters.title = Utils.trim(elements['article_title'].value);

    sz3.loadOptions('get_article_list', filters);
  }

  /**
   * 新增一个图片
   */
  function addImg(obj)
  {
      var src  = obj.parentNode.parentNode;
      var idx  = rowindex(src);
      var tbl  = document.getElementById('gallery-table');
      var row  = tbl.insertRow(idx + 1);
      var cell = row.insertCell(-1);
      cell.innerHTML = src.cells[0].innerHTML.replace(/(.*)(addImg)(.*)(\[)(\+)/i, "$1removeImg$3$4-");
  }

  /**
   * 删除图片上传
   */
  function removeImg(obj)
  {
      var row = rowindex(obj.parentNode.parentNode);
      var tbl = document.getElementById('gallery-table');

      tbl.deleteRow(row);
  }

  /**
   * 删除图片
   */
  function dropImg(imgId)
  {
    Ajax.call("{U('operate',array('act'=>drop_image))}?", "img_id="+imgId, dropImgResponse, "GET", "JSON");
  }

  function dropImgResponse(result)
  {
      if (result.error == 0)
      {
          document.getElementById('gallery_' + result.content).style.display = 'none';
      }
  }

  /**
   * 将市场价格取整
   */
  function integral_market_price()
  {
    document.forms['theForm'].elements['market_price'].value = parseInt(document.forms['theForm'].elements['market_price'].value);
  }

   /**
   * 将积分购买额度取整
   */
  function parseint_integral()
  {
    document.forms['theForm'].elements['integral'].value = parseInt(document.forms['theForm'].elements['integral'].value);
  }


  /**
  * 检查货号是否存在
  */
  function checkGoodsSn(goods_sn, goods_id)
  {
    if (goods_sn == '')
    {
        document.getElementById('goods_sn_notice').innerHTML = "";
        return;
    }

    var callback = function(res)
    {
      if (res.error > 0)
      {
        document.getElementById('goods_sn_notice').innerHTML = res.message;
        document.getElementById('goods_sn_notice').style.color = "red";
      }
      else
      {
        document.getElementById('goods_sn_notice').innerHTML = "";
      }
    }
    Ajax.call("{U('operate',array('is_ajax'=>'1','act'=>'check_goods_sn'))}?", "goods_sn=" + goods_sn + "&goods_id=" + goods_id, callback, "GET", "JSON");
  }

  /**
   * 新增一个优惠价格
   */
  function addVolumePrice(obj)
  {
    var src      = obj.parentNode.parentNode;
    var tbl      = document.getElementById('tbody-volume');

    var validator  = new Validator('theForm');
    checkVolumeData("0",validator);
    if (!validator.passed())
    {
      return false;
    }

    var row  = tbl.insertRow(tbl.rows.length);
    var cell = row.insertCell(-1);
    cell.innerHTML = src.cells[0].innerHTML.replace(/(.*)(addVolumePrice)(.*)(\[)(\+)/i, "$1removeVolumePrice$3$4-");

    var number_list = document.getElementsByName("volume_number[]");
    var price_list  = document.getElementsByName("volume_price[]");

    number_list[number_list.length-1].value = "";
    price_list[price_list.length-1].value   = "";
  }

  /**
   * 删除优惠价格
   */
  function removeVolumePrice(obj)
  {
    var row = rowindex(obj.parentNode.parentNode);
    var tbl = document.getElementById('tbody-volume');

    tbl.deleteRow(row);
  }

  /**
   * 校验优惠数据是否正确
   */
  function checkVolumeData(isSubmit,validator)
  {
    var volumeNum = document.getElementsByName("volume_number[]");
    var volumePri = document.getElementsByName("volume_price[]");
    var numErrNum = 0;
    var priErrNum = 0;

    for (i = 0 ; i < volumePri.length ; i ++)
    {
      if ((isSubmit != 1 || volumeNum.length > 1) && numErrNum <= 0 && volumeNum.item(i).value == "")
      {
        validator.addErrorMsg(volume_num_not_null);
        numErrNum++;
      }

      if (numErrNum <= 0 && Utils.trim(volumeNum.item(i).value) != "" && ! Utils.isNumber(Utils.trim(volumeNum.item(i).value)))
      {
        validator.addErrorMsg(volume_num_not_number);
        numErrNum++;
      }

      if ((isSubmit != 1 || volumePri.length > 1) && priErrNum <= 0 && volumePri.item(i).value == "")
      {
        validator.addErrorMsg(volume_price_not_null);
        priErrNum++;
      }

      if (priErrNum <= 0 && Utils.trim(volumePri.item(i).value) != "" && ! Utils.isNumber(Utils.trim(volumePri.item(i).value)))
      {
        validator.addErrorMsg(volume_price_not_number);
        priErrNum++;
      }
    }
  }
</script>

{include file="pagefooter"}