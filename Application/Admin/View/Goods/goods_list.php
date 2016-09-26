
<table id="list-table" class="table table-bordered table-striped table-hover">
  <tr class="active">
    <th>
      <input onclick='listTable.selectAll(this, "checkboxes")' type="checkbox" />
      <a href="javascript:listTable.sort('goods_id'); ">{$lang['record_id']}</a>{$sort_goods_id}
    </th>
    <th class="text-center"><a href="javascript:listTable.sort('goods_name'); ">{$lang['goods_name']}</a>{$sort_goods_name}</th>
    <th class="text-center"><a href="javascript:listTable.sort('goods_sn'); ">{$lang['goods_sn']}</a>{$sort_goods_sn}</th>
    <th class="text-center"><a href="javascript:listTable.sort('shop_price'); ">{$lang['shop_price']}</a>{$sort_shop_price}</th>
    <th class="text-center"><a href="javascript:listTable.sort('is_on_sale'); ">{$lang['is_on_sale']}</a>{$sort_is_on_sale}</th>
    <th class="text-center"><a href="javascript:listTable.sort('is_best'); ">{$lang['is_best']}</a>{$sort_is_best}</th>
    <th class="text-center"><a href="javascript:listTable.sort('is_new'); ">{$lang['is_new']}</a>{$sort_is_new}</th>
    <th class="text-center"><a href="javascript:listTable.sort('is_hot'); ">{$lang['is_hot']}</a>{$sort_is_hot}</th>
    <th class="text-center"><a href="javascript:listTable.sort('sort_order'); ">{$lang['sort_order']}</a>{$sort_sort_order}</th>
    {if $use_storage}
    <th class="text-center"><a href="javascript:listTable.sort('goods_number'); ">{$lang['goods_number']}</a>{$sort_goods_number}</th>
    {/if}
    <th>{$lang['handler']}</th>
  <tr>
  {loop $goods_list $key $goods}
  <tr>
    <td><input type="checkbox" name="checkboxes[]" value="{$goods['goods_id']}" />{$goods['goods_id']}</td>
    <td class="first-cell" style="{if $goods['is_promote']}color:red;{/if}"><span onclick="listTable.edit(this, 'edit_goods_name', {$goods['goods_id']})">{$goods['goods_name']}</span></td>
    <td><span onclick="listTable.edit(this, 'edit_goods_sn', {$goods['goods_id']})">{$goods['goods_sn']}</span></td>
    <td class="text-right"><span onclick="listTable.edit(this, 'edit_goods_price', {$goods['goods_id']})">{$goods['shop_price']}

    </span></td>
    <td class="text-center"><img src="__PUBLIC__/images/{if $goods['is_on_sale']}yes{else}no{/if}.gif" onclick="listTable.toggle(this, 'toggle_on_sale', {$goods['goods_id']})" /></td>
    <td class="text-center"><img src="__PUBLIC__/images/{if $goods['is_best']}yes{else}no{/if}.gif" onclick="listTable.toggle(this, 'toggle_best', {$goods['goods_id']})" /></td>
    <td class="text-center"><img src="__PUBLIC__/images/{if $goods['is_new']}yes{else}no{/if}.gif" onclick="listTable.toggle(this, 'toggle_new', {$goods['goods_id']})" /></td>
    <td class="text-center"><img src="__PUBLIC__/images/{if $goods['is_hot']}yes{else}no{/if}.gif" onclick="listTable.toggle(this, 'toggle_hot', {$goods['goods_id']})" /></td>
    <td class="text-center"><span onclick="listTable.edit(this, 'edit_sort_order', {$goods['goods_id']})">{$goods['sort_order']}</span></td>
    {if $use_storage}
    <td align="right"><span onclick="listTable.edit(this, 'edit_goods_number', {$goods['goods_id']})">{$goods['goods_number']}</span></td>
    {/if}
    <td class="text-center">
      <a href="{U('default/goods/index',array('id'=>$goods['goods_id']))}" target="_blank" title="{$lang['view']}"><img src="__PUBLIC__/images/icon_view.gif" width="16" height="16" border="0" /></a>
      <a href="{U('edit',array('goods_id'=>$goods['goods_id'], 'extension_code'=>$code))}" title="{$lang['edit']}"><img src="__PUBLIC__/images/icon_edit.gif" width="16" height="16" border="0" /></a>
      <a href="{U('copy',array('goods_id'=>$goods['goods_id'], 'extension_code'=>$code))}" title="{$lang['copy']}"><img src="__PUBLIC__/images/icon_copy.gif" width="16" height="16" border="0" /></a>
      <a href="javascript:;" onclick="listTable.remove({$goods['goods_id']}, '{$lang['trash_goods_confirm']}')" title="{$lang['trash']}"><img src="__PUBLIC__/images/icon_trash.gif" width="16" height="16" border="0" /></a>
      {if $specifications[$goods['goods_type']] == ''}
      	<a href="{U('product_list',array('goods_id'=>$goods['goods_id']))}" title="{$lang['item_list']}"><img src="__PUBLIC__/images/icon_docs.gif" width="16" height="16" border="0" /></a>
      {else}
      	<img src="__PUBLIC__/images/empty.gif" width="16" height="16" border="0" />
      {/if}
      {if $add_handler}
        |
        {loop $add_handler $handler}
        <a href="{$handler['url']}&goods_id={$goods['goods_id']}" title="{$handler['title']}"><img src="__PUBLIC__/images/{$handler['img']}" width="16" height="16" border="0" /></a>
        {/loop}
      {/if}
    </td>
  </tr>
  {/loop}
</table>

{include file="pageview"}
