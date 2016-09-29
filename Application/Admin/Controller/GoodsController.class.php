<?php

/* 访问控制 */
// defined('ENTRANCE') or die('Deny Access');

namespace Admin\Controller;
use Think\Controller;

class GoodsController extends AdminController {
	
	function __construct(){
		parent::__construct();
		$this->table = 'goods';
		$this->id = 'goods_id';
		$this->name = 'goods_name';
	}
    
    /**
     * 自定义回复列表
     */
    public function index() {
        // print_r(L());
    	
    	//admin_priv('goods_manage');
		
    	$cat_id = I('cat_id');
	    $cat_id = empty($cat_id) ? 0 : intval($cat_id);
	    $code = I('extension_code');
	    $code   = empty($code) ? '' : trim($code);
	    $suppliers_id = I('suppliers_id');
	    $suppliers_id = empty($suppliers_id) ? '' : trim($suppliers_id);
	    $is_on_sale = I('is_on_sale');
	    $is_on_sale = (empty($is_on_sale) && $is_on_sale === 0) ? '' : trim($is_on_sale);
	
	    $handler_list = array();
	    $handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=card', 'title'=>L('card'), 'img'=>'icon_send_bonus.gif');
	    $handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=replenish', 'title'=>L('replenish'), 'img'=>'icon_add.gif');
	    $handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=batch_card_add', 'title'=>L('batch_card_add'), 'img'=>'icon_output.gif');
	
	    if (isset($handler_list[$code]))
	    {
	        $this->assign('add_handler',      $handler_list[$code]);
	    }
	
	    /* 供货商名 */
	    $this->set_suppliers($suppliers_id);
	    $this->assign('is_on_sale', $is_on_sale);
	    $this->assign('suppliers_id', $suppliers_id);
	
	    /* 模板赋值 */	   
	    $this->assign('ur_here', $code == 'virtual_card' ? L('50_virtual_card_list') :L('01_goods_list'));
	
	    $action_link = $this->add_link($code);
	    $this->assign('action_link1',  $action_link);
	    $this->assign('code',     $code);
	    // $this->assign('cat_list',     cat_list(0, $cat_id));
	    $this->set_brands();
	    $this->set_intro(I('intro_type'));
	    $this->assign('intro_list',   get_intro_list());
	    $this->assign('list_type',    'goods');
	    $use_storage = C('use_storage');
        \Think\Log::record('====use_storage=======>'. $use_storage);
	    $this->assign('use_storage',  empty($use_storage) ? 0 : 1);
	
	    $suppliers_list = suppliers_list_info(' is_check = 1 ');
	    $this->assign('suppliers_list', (count($suppliers_list) == 0 ? 0 : $suppliers_list)); // 取供货商列表
	
	    $filter['page'] = '{page}';
	    $offset = $this->pageLimit(U('index', $filter), 12);
	    $goods_list = goods_list(0,$offset, (($code == '') ? 1 : 0));
	    
	    $this->assign('act', 'index');
	    $this->assign('page', $this->pageShow($goods_list['record_count']));	    
	    $this->assign('record_count',   $goods_list['record_count']);
	    $this->assign('goods_list',   $goods_list['goods']);
	    $this->assign('filter',       $goods_list['filter']);

	
	    /* 排序标记 */
	    $sort_flag  = sort_flag($goods_list['filter']);
	    $this->assign($sort_flag['tag'], $sort_flag['img']);
	
	    /* 获取商品类型存在规格的类型 */
	    $specifications = get_goods_type_specifications();
	    $this->assign('specifications', $specifications);

        $this->display('goods_index');
    }
    
    function trash(){
    	//admin_priv('goods_manage');
    	
    	$cat_id = I('cat_id');
    	$cat_id = empty($cat_id) ? 0 : intval($cat_id);
    	
    	/* 模板赋值 */
    	$this->assign('ur_here', L('11_goods_trash'));
    	
    	$this->assign('action_link1',  array('href' => U('index'), 'text' => L('01_goods_list')));
    	$this->assign('cat_list',     cat_list(0, $cat_id));

    	$filter['page'] = '{page}';
    	$offset = $this->pageLimit(url('index', $filter), 12);
    	$goods_list = goods_list(1, $offset, -1);
    	 
    	$this->assign('act', 'trash');
    	$this->assign('page', $this->pageShow($goods_list['record_count']));
    	$this->assign('record_count',   $goods_list['record_count']);
    	$this->assign('goods_list',   $goods_list['goods']);
    	$this->assign('filter',       $goods_list['filter']);

    	/* 排序标记 */
    	$sort_flag  = sort_flag($goods_list['filter']);
    	$this->assign($sort_flag['tag'], $sort_flag['img']);
    	
    	$this->display('goods_trash');
    }

    /**
     * 复制商品
     */
	public function copy() {
    	$code = I('extension_code');
    	$goods_id = I('goods_id');
    	$code = trim($code);
    	$goods_id = trim($goods_id);
    	$code=$code=='virual_card' ? 'virual_card': '';
    	if ($code == 'virual_card')
    	{
    		//admin_priv('virualcard'); // 检查权限
    	}
    	else
    	{
    		//admin_priv('goods_manage'); // 检查权限
    	}
    	
    	/* 供货商名 */
    	$suppliers_list_name = suppliers_list_name();
    	$suppliers_exists = 1;
    	if (empty($suppliers_list_name))
    	{
    		$suppliers_exists = 0;
    	}
    	$this->assign('suppliers_exists', $suppliers_exists);
    	$this->assign('suppliers_list_name', $suppliers_list_name);
    	unset($suppliers_list_name, $suppliers_exists);
    	
    	/* 如果是安全模式，检查目录是否存在 */
    	if (ini_get('safe_mode') == 1 && (!file_exists('../' . IMAGE_DIR . '/'.date('Ym')) || !is_dir('../' . IMAGE_DIR . '/'.date('Ym'))))
    	{
    		if (@!mkdir('../' . IMAGE_DIR . '/'.date('Ym'), 0777))
    		{
    			$warning = sprintf(L('safe_mode_warning'), '../' . IMAGE_DIR . '/'.date('Ym'));
    			$this->assign('warning', $warning);
    		}
    	}
    	
    	/* 如果目录存在但不可写，提示用户 */
    	elseif (file_exists('../' . IMAGE_DIR . '/'.date('Ym')) && file_mode_info('../' . IMAGE_DIR . '/'.date('Ym')) < 2)
    	{
    		$warning = sprintf(L('safe_mode_warning'), '../' . IMAGE_DIR . '/'.date('Ym'));
    		$this->assign('warning', $warning);
    	}
    	
    	/* 取得商品信息 */
        $sql = "SELECT * FROM " . $this->model->pre . "goods WHERE goods_id = '$goods_id'";
        $goods = $this->model->getRow($sql);
        if (empty($goods) === true)
        {
        	$this->message(L('replyadd_succed'), url('index'));
        }
        
        /* 虚拟卡商品复制时, 将其库存置为0*/
        if ($code != '')
        {
        	$goods['goods_number'] = 0;
        }
    
        /* 获取商品类型存在规格的类型 */
        $specifications = get_goods_type_specifications();
        $goods['specifications_id'] = $specifications[$goods['goods_type']];
        $_attribute = get_goods_specifications_list($goods['goods_id']);
        $goods['_attribute'] = empty($_attribute) ? '' : 1;
    
        /* 根据商品重量的单位重新计算 */
        if ($goods['goods_weight'] > 0)
        {
            $goods['goods_weight_by_unit'] = ($goods['goods_weight'] >= 1) ? $goods['goods_weight'] : ($goods['goods_weight'] / 0.001);
        }
    
        if (!empty($goods['goods_brief']))
        {
            //$goods['goods_brief'] = trim_right($goods['goods_brief']);
            $goods['goods_brief'] = $goods['goods_brief'];
        }
        if (!empty($goods['keywords']))
        {
            //$goods['keywords']    = trim_right($goods['keywords']);
            $goods['keywords']    = $goods['keywords'];
        }
    
        /* 如果不是促销，处理促销日期 */
        if (isset($goods['is_promote']) && $goods['is_promote'] == '0')
        {
            unset($goods['promote_start_date']);
            unset($goods['promote_end_date']);
        }
        else
        {
            $goods['promote_start_date'] = local_date('Y-m-d', $goods['promote_start_date']);
            $goods['promote_end_date'] = local_date('Y-m-d', $goods['promote_end_date']);
        }
    

        // 商品信息
        $goods['goods_id'] = 0;
        $goods['goods_sn'] = '';
        $goods['goods_name'] = '';
        $goods['goods_img'] = '';
        $goods['goods_thumb'] = '';
        $goods['original_img'] = '';

        // 扩展分类不变

        // 关联商品
        $sql = "DELETE FROM " . $this->model->pre . "link_goods WHERE (goods_id = 0 OR link_goods_id = 0)" .
                " AND admin_id = '$_SESSION[admin_id]'";
        $this->model->query($sql);

        $sql = "SELECT '0' AS goods_id, link_goods_id, is_double, '$_SESSION[admin_id]' AS admin_id" .
                " FROM " . $this->model->pre . "link_goods WHERE goods_id = '$goods_id' ";
        $res = $this->model->query($sql);
        foreach ($res as $row){
            $this->model->table('link_goods')->data($row)->insert();
        }

        $sql = "SELECT goods_id, '0' AS link_goods_id, is_double, '$_SESSION[admin_id]' AS admin_id" .
                " FROM " . $this->model->pre . "link_goods WHERE link_goods_id = '$goods_id' ";
        $res = $this->model->query($sql);
        foreach ($res as $row){
            $this->model->table('link_goods')->data($row)->insert();
        }

        // 配件
        $sql = "DELETE FROM " . $this->model->pre .
                "group_goods WHERE parent_id = 0 AND admin_id = '$_SESSION[admin_id]'";
        $this->model->query($sql);

        $sql = "SELECT 0 AS parent_id, goods_id, goods_price, '$_SESSION[admin_id]' AS admin_id " .
                "FROM " . $this->model->pre . "group_goods WHERE parent_id = '$goods_id' ";
        $res = $this->model->query($sql);
        foreach ($res as $row){
            $this->model->table('group_goods')->data($row)->insert();
        }

        // 关联文章
        $sql = "DELETE FROM " . $this->model->pre . "goods_article WHERE goods_id = 0 AND admin_id = '$_SESSION[admin_id]'";
        $this->model->query($sql);

        $sql = "SELECT 0 AS goods_id, article_id, '$_SESSION[admin_id]' AS admin_id " .
                "FROM " . $this->model->pre . "goods_article WHERE goods_id = '$goods_id' ";
        $res = $this->model->query($sql);
        foreach ($res as $row){
            $this->model->table('goods_article')->data($row)->insert();
        }

        // 图片不变

        // 商品属性
        $sql = "DELETE FROM " . $this->model->pre . "goods_attr WHERE goods_id = 0";
        $this->model->query($sql);

        $sql = "SELECT 0 AS goods_id, attr_id, attr_value, attr_price " .
                "FROM " . $this->model->pre . "goods_attr WHERE goods_id = '$goods_id' ";
        $res = $this->model->query($sql);
        foreach ($res as $row){
            $this->model->table('goods_attr')->data($row)->insert();
        }
    
        // 扩展分类        
        $other_cat_list = array();
        $other_cat = $this->model->table('goods_cat')->field('cat_id')->where("goods_id = '$goods_id'")->getCol();
        $this->logger->Log(7,"other_cat=" . json_encode($other_cat));
        if(empty($other_cat)){
        	$goods['other_cat'] = array();
        }
        else{
        	foreach ($other_cat AS $cat_id)
        	{
        		$other_cat_list[$cat_id] = cat_list(0, $cat_id);
        	}
        	$goods['other_cat'] = $other_cat;
        }
        $this->assign('other_cat_list', $other_cat_list);
    
        $link_goods_list    = get_linked_goods($goods['goods_id']); // 关联商品
        $group_goods_list   = get_group_goods($goods['goods_id']); // 配件
        $goods_article_list = get_goods_articles($goods['goods_id']);   // 关联文章
    
        /* 商品图片路径 */
        if (!empty($goods['original_img']))
        {
            $goods['goods_img'] = get_image_path($goods_id, $goods['goods_img']);
            $goods['goods_thumb'] = get_image_path($goods_id, $goods['goods_thumb'], true);
        }
    
        /* 图片列表 */
        $sql = "SELECT * FROM " . $this->model->pre . "goods_gallery WHERE goods_id = '$goods[goods_id]'";
        $img_list = $this->model->query($sql);
    
        /* 格式化相册图片路径 */
        if (!empty($img_list))
        {
            foreach ($img_list as $gallery_img)
            {
                $gallery_img['img_url'] = get_image_path($gallery_img['goods_id'], $gallery_img['img_original'], false, 'gallery');
                $gallery_img['thumb_url'] = get_image_path($gallery_img['goods_id'], $gallery_img['img_original'], true, 'gallery');
            }
        }
        else
        {
            foreach ($img_list as $gallery_img)
            {
                $gallery_img['thumb_url'] = '../' . (empty($gallery_img['thumb_url']) ? $gallery_img['img_url'] : $gallery_img['thumb_url']);
            }
        }
    	
    	/* 拆分商品名称样式 */
    	$goods_name_style = explode('+', empty($goods['goods_name_style']) ? '+' : $goods['goods_name_style']);
    	
    	/* 创建 html editor */
    	
    	/* 模板赋值 */
    	$this->assign('code',    $code);
    	$this->assign('ur_here',  L('copy_goods'));
    	$this->assign('action_link', $this->list_link(false, $code));
    	$this->assign('goods', $goods);
    	$this->assign('goods_name_color', $goods_name_style[0]);
    	$this->assign('goods_name_style', $goods_name_style[1]);
    	$this->assign('cat_list', cat_list(0, $goods['cat_id']));

    	$this->set_brands($goods['brand_id']);
    	$this->set_units($goods['goods_weight'] >= 1 ? '1' : '0.001');
    	
    	$this->assign('user_rank_list', get_user_rank_list());
    	$this->assign('weight_unit', $goods['goods_weight'] >= 1 ? '1' : '0.001');
    	$market_price_rate = C('market_price_rate');
    	$this->assign('market_price_rate', isset($market_price_rate) ? $market_price_rate: 1);
    	$integral_percent = C('integral_percent');
    	$this->assign('integral_percent', isset($integral_percent) ? $integral_percent: 0);
    	$this->assign('form_act', 'insert');

    	$this->assign('member_price_list', get_member_price_list($goods_id));

    	$this->assign('link_goods_list', $link_goods_list);
    	$this->assign('group_goods_list', $group_goods_list);
    	$this->assign('goods_article_list', $goods_article_list);
    	$this->assign('img_list', $img_list);
    	$this->assign('goods_type_list', goods_type_list($goods['goods_type']));
    	$this->assign('gd', gd_version());
    	$this->assign('thumb_width', C('thumb_width'));
    	$this->assign('thumb_height', C('thumb_height'));
    	$this->assign('goods_attr_html', build_attr_html($goods['goods_type'], $goods['goods_id']));
    	$volume_price_list = '';
    	if(!empty($goods_id))
    	{
    		$volume_price_list = get_volume_price_list($goods_id);
    	}
    	if (empty($volume_price_list))
    	{
    		$volume_price_list = array('0'=>array('number'=>'','price'=>''));
    	}
    	$this->assign('volume_price_list', $volume_price_list);
 
    	$this->display('goods_edit');
    }
    
    
    /**
     * 新增自定义回复
     */
	public function edit() {
        $code = I('extension_code');
    	$goods_id = I('goods_id');
    	$code = trim($code);
    	$goods_id = trim($goods_id);
    	$code=$code=='virual_card' ? 'virual_card': '';
    	if ($code == 'virual_card')
    	{
    		//admin_priv('virualcard'); // 检查权限
    	}
    	else
    	{
    		//admin_priv('goods_manage'); // 检查权限
    	}
    	 
    	/* 如果是安全模式，检查目录是否存在 */
    	if (ini_get('safe_mode') == 1 && (!file_exists('../' . IMAGE_DIR . '/'.date('Ym')) || !is_dir('../' . IMAGE_DIR . '/'.date('Ym'))))
    	{
    		if (@!mkdir('../' . IMAGE_DIR . '/'.date('Ym'), 0777))
    		{
    			$warning = sprintf(L('safe_mode_warning'), '../' . IMAGE_DIR . '/'.date('Ym'));
    			$this->assign('warning', $warning);
    		}
    	}
    	 
    	/* 如果目录存在但不可写，提示用户 */
    	elseif (file_exists('../' . IMAGE_DIR . '/'.date('Ym')) && file_mode_info('../' . IMAGE_DIR . '/'.date('Ym')) < 2)
    	{
    		$warning = sprintf(L('safe_mode_warning'), '../' . IMAGE_DIR . '/'.date('Ym'));
    		$this->assign('warning', $warning);
    	}
    	
        /* 商品信息 */
        $sql = "SELECT * FROM " . $this->model->pre . "goods WHERE goods_id = '$goods_id'";
        $this->logger->Log(7,"good info=" . $sql);
        $goods = $this->model->getRow($sql);
        if (empty($goods) === true)
        {
        	$this->message(L('replyadd_succed'), url('index'));
        }
        else{
        	$this->logger->Log(7,"good=" . json_encode($goods));
        }
        
        /* 供货商名 */
        $this->set_suppliers($goods['suppliers_id']);
         
        /* 获取商品类型存在规格的类型 */
        $specifications = get_goods_type_specifications();
        $goods['specifications_id'] = $specifications[$goods['goods_type']];
        $_attribute = get_goods_specifications_list($goods['goods_id']);
        $goods['_attribute'] = empty($_attribute) ? '' : 1;
         
        /* 根据商品重量的单位重新计算 */
        if ($goods['goods_weight'] > 0)
        {
            $goods['goods_weight_by_unit'] = ($goods['goods_weight'] >= 1) ? $goods['goods_weight'] : ($goods['goods_weight'] / 0.001);
        }
         
        if (!empty($goods['goods_brief']))
        {
            //$goods['goods_brief'] = trim_right($goods['goods_brief']);
            $goods['goods_brief'] = $goods['goods_brief'];
        }
        if (!empty($goods['keywords']))
        {
            //$goods['keywords']    = trim_right($goods['keywords']);
            $goods['keywords']    = $goods['keywords'];
        }
         
        /* 如果不是促销，处理促销日期 */
        if (isset($goods['is_promote']) && $goods['is_promote'] == '0')
        {
            unset($goods['promote_start_date']);
            unset($goods['promote_end_date']);
        }
        else
        {
            $goods['promote_start_date'] = local_date('Y-m-d', $goods['promote_start_date']);
            $goods['promote_end_date'] = local_date('Y-m-d', $goods['promote_end_date']);
        }
         
        // 扩展分类
        $other_cat_list = array();
        $other_cat = $this->model->table('goods_cat')->field('cat_id')->where("goods_id = '$goods_id'")->getCol();
        $this->logger->Log(7,"other_cat=" . json_encode($other_cat));
        if(empty($other_cat)){
        	$goods['other_cat'] = array();
        }
        else{
        	foreach ($other_cat AS $cat_id)
        	{
        		$other_cat_list[$cat_id] = cat_list(0, $cat_id);
        	}
        	$goods['other_cat'] = $other_cat;
        }
        
        $this->assign('other_cat_list', $other_cat_list);
         
        $link_goods_list    = get_linked_goods($goods['goods_id']); // 关联商品
        $group_goods_list   = get_group_goods($goods['goods_id']); // 配件
        $goods_article_list = get_goods_articles($goods['goods_id']);   // 关联文章
         
        /* 商品图片路径,编辑商品时，为了显示图片信息，需对图片的地址进行处理 */
        if (!empty($goods['original_img']))
        {
            $goods['goods_img'] = get_image_path($goods_id, $goods['goods_img']);
            $goods['goods_thumb'] = get_image_path($goods_id, $goods['goods_thumb'], true);
        }
         
        /* 图片列表 */
        $sql = "SELECT * FROM " . $this->model->pre . "goods_gallery WHERE goods_id = '$goods[goods_id]'";
        $img_list = $this->model->query($sql);
         
        /* 格式化相册图片路径 */
        if (!empty($img_list))
        {
            foreach ($img_list as $gallery_img)
            {
                $gallery_img['img_url'] = get_image_path($gallery_img['goods_id'], $gallery_img['img_original'], false, 'gallery');
                $gallery_img['thumb_url'] = get_image_path($gallery_img['goods_id'], $gallery_img['img_original'], true, 'gallery');
            }
        }
        else
        {
            foreach ($img_list as $gallery_img)
            {
                $gallery_img['thumb_url'] = '../' . (empty($gallery_img['thumb_url']) ? $gallery_img['img_url'] : $gallery_img['thumb_url']);
            }
        }
    	 
    	/* 拆分商品名称样式 */
    	$goods_name_style = explode('+', empty($goods['goods_name_style']) ? '+' : $goods['goods_name_style']);
    	
    	 
    	/* 模板赋值 */
    	$this->assign('code',    $code);
    	$this->assign('ur_here', L('edit_goods'));
    	$this->assign('action_link', $this->list_link(false, $code));
    	$this->assign('goods', $goods);
    	$this->assign('goods_name_color', $goods_name_style[0]);
    	$this->assign('goods_name_style', $goods_name_style[1]);
    	$this->assign('cat_list', cat_list(0, $goods['cat_id']));
    	$this->assign('brand_list', get_brand_list());
    	$this->assign('unit_list', get_unit_list());
    	$this->set_brands($goods['brand_id']);
    	$this->set_units($goods['goods_weight'] >= 1 ? '1' : '0.001');
    	$this->assign('user_rank_list', get_user_rank_list());
    	$this->assign('weight_unit', ($goods['goods_weight'] >= 1 ? '1' : '0.001'));
    	$market_price_rate = C('market_price_rate');
    	$this->assign('market_price_rate', isset($market_price_rate) ? $market_price_rate: 1);
    	$integral_percent = C('integral_percent');
    	$this->assign('integral_percent', isset($integral_percent) ? $integral_percent: 0);
    	$this->assign('form_act', 'update');
    	$this->assign('is_add', true);
        $this->assign('use_storage', C('use_storage'));

    	$this->assign('member_price_list', get_member_price_list($goods_id));
    	$this->assign('link_goods_list', $link_goods_list);
    	$this->assign('group_goods_list', $group_goods_list);
    	$this->assign('goods_article_list', $goods_article_list);
    	$this->assign('img_list', $img_list);
    	$this->assign('goods_type_list', goods_type_list($goods['goods_type']));
    	$this->assign('gd', gd_version());
    	$this->assign('thumb_width', C('thumb_width'));
    	$this->assign('thumb_height', C('thumb_height'));
    	$this->assign('goods_attr_html', build_attr_html($goods['goods_type'], $goods['goods_id']));
    	$volume_price_list = '';
    	if(!empty($goods_id))
    	{
    		$volume_price_list = get_volume_price_list($goods_id);
    	}
    	if (empty($volume_price_list))
    	{
    		$volume_price_list = array('0'=>array('number'=>'','price'=>''));
    	}
    	$this->assign('volume_price_list', $volume_price_list);
    	/* 显示商品信息页面 */
    	$this->display('goods_edit');
    }
    
    
    /**
     * 新增自定义回复
     */
	public function add() {
    	$code = I('extension_code');
    	$goods_id = I('goods_id');
    	$code = trim($code);
    	$goods_id = trim($goods_id);
    	$code=$code=='virual_card' ? 'virual_card': '';
    	if ($code == 'virual_card')
    	{
    		//admin_priv('virualcard'); // 检查权限
    	}
    	else
    	{
    		//admin_priv('goods_manage'); // 检查权限
    	}
    
    	/* 供货商名 */
    	$this->set_suppliers();
    
    	/* 如果是安全模式，检查目录是否存在 */
    	if (ini_get('safe_mode') == 1 && (!file_exists('../' . IMAGE_DIR . '/'.date('Ym')) || !is_dir('../' . IMAGE_DIR . '/'.date('Ym'))))
    	{
    		if (@!mkdir('../' . IMAGE_DIR . '/'.date('Ym'), 0777))
    		{
    			$warning = sprintf(L('safe_mode_warning'), '../' . IMAGE_DIR . '/'.date('Ym'));
    			$this->assign('warning', $warning);
    		}
    	}
    
    	/* 如果目录存在但不可写，提示用户 */
    	elseif (file_exists('../' . IMAGE_DIR . '/'.date('Ym')) && file_mode_info('../' . IMAGE_DIR . '/'.date('Ym')) < 2)
    	{
    		$warning = sprintf(L('safe_mode_warning'), '../' . IMAGE_DIR . '/'.date('Ym'));
    		$this->assign('warning', $warning);
    	}
    	
        /* 默认值 */
        $last_choose = array(0, 0);
        if (!empty($_COOKIE['ECSCP']['last_choose']))
        {
            $last_choose = explode('|', $_COOKIE['ECSCP']['last_choose']);
        }
        $goods = array(
                'goods_id'      => 0,
                'goods_desc'    => '',
                'cat_id'        => $last_choose[0],
                'brand_id'      => $last_choose[1],
                'is_on_sale'    => '1',
                'is_alone_sale' => '1',
                'is_shipping' => '0',
                'other_cat'     => array(), // 扩展分类
                'goods_type'    => 0,       // 商品类型
                'shop_price'    => 0,
                'promote_price' => 0,
                'market_price'  => 0,
                'integral'      => 0,
                'goods_number'  => C('default_storage'),
                'warn_number'   => 1,
                'promote_start_date' => local_date('Y-m-d'),
                'promote_end_date'   => local_date('Y-m-d', local_strtotime('+1 month')),
                'goods_weight'  => 0,
                'give_integral' => -1,
                'rank_integral' => -1
        );
         
        if ($code != '')
        {
            $goods['goods_number'] = 0;
        }
         
        /* 关联商品 */
        $link_goods_list = array();

        $sql = "DELETE FROM " . $this->model->pre . "link_goods WHERE (goods_id = 0 OR link_goods_id = 0)" .
                " AND admin_id = '$_SESSION[admin_id]'";
        $this->model->query($sql);
         
        /* 组合商品 */
        $group_goods_list = array();
        $sql = "DELETE FROM " . $this->model->pre . "group_goods WHERE parent_id = 0 AND admin_id = '$_SESSION[admin_id]'";
        $this->model->query($sql);
         
        /* 关联文章 */
        $goods_article_list = array();
        $sql = "DELETE FROM " . $this->model->pre . "goods_article WHERE goods_id = 0 AND admin_id = '$_SESSION[admin_id]'";
        $this->model->query($sql);
         
        /* 属性 */
        $sql = "DELETE FROM " . $this->model->pre . "goods_attr WHERE goods_id = 0";
        $this->model->query($sql);
         
        /* 图片列表 */
        $img_list = array();
    	
    
    	/* 拆分商品名称样式 */
    	$goods_name_style = explode('+', empty($goods['goods_name_style']) ? '+' : $goods['goods_name_style']);
    
    	/* 模板赋值 */
    	$this->assign('code',    $code);
    	$this->assign('ur_here', empty($code) ? L('02_goods_add') : L('51_virtual_card_add'));
    	$this->assign('action_link', $this->list_link(true, $code));
    	$this->assign('goods', $goods);
    	$this->assign('goods_name_color', $goods_name_style[0]);
    	$this->assign('goods_name_style', $goods_name_style[1]);
    	$this->assign('cat_list', cat_list(0, $goods['cat_id']));
    	$this->set_brands();
    	$this->set_units('1');
    	$this->assign('user_rank_list', get_user_rank_list());
    	$market_price_rate = C('market_price_rate');
    	$this->assign('market_price_rate', isset($market_price_rate) ? $market_price_rate: 1);
    	$integral_percent = C('integral_percent');
    	$this->assign('integral_percent', isset($integral_percent) ? $integral_percent: 0);
    	$this->assign('use_storage', C('use_storage'));
    	
    	$this->assign('form_act', 'insert');

    	$this->assign('link_goods_list', $link_goods_list);
    	$this->assign('group_goods_list', $group_goods_list);
    	$this->assign('goods_article_list', $goods_article_list);
    	$this->assign('img_list', $img_list);
    	$this->assign('goods_type_list', goods_type_list($goods['goods_type']));
    	$this->assign('gd', gd_version());
    	$this->assign('thumb_width', C('thumb_width'));
    	$this->assign('thumb_height', C('thumb_height'));
    	$this->assign('goods_attr_html', build_attr_html($goods['goods_type'], $goods['goods_id']));
    	$volume_price_list = '';
    	if(!empty($goods_id))
    	{
    		$volume_price_list = get_volume_price_list($goods_id);
    	}
    	if (empty($volume_price_list))
    	{
    		$volume_price_list = array('0'=>array('number'=>'','price'=>''));
    	}
    	$this->assign('volume_price_list', $volume_price_list);
    	/* 显示商品信息页面 */
    	$this->display();
    }

	public function post(){
		$image = new EcsImage(C('bgcolor'));
		
    	$code = empty($_REQUEST['extension_code']) ? '' : trim($_REQUEST['extension_code']);
    	
//     	if ($code == 'virtual_card')
//     	{
//     		admin_priv('virualcard'); // 检查权限
//     	}
//     	else
//     	{
//     		admin_priv('goods_manage'); // 检查权限
//     	}
    	
    	/* 检查货号是否重复 */
    	if ($_POST['goods_sn'])
    	{
    		$sql = "SELECT COUNT(*) as count FROM " . $this->model->pre . 
    		"goods WHERE goods_sn = '$_POST[goods_sn]' AND is_delete = 0 AND goods_id <> '$_POST[goods_id]'";
    		$res = $this->model->query($sql);
    		if ($res && $res['count'] > 0)
    		{
    			$this->message(L('goods_sn_exists'));
    		}
    	}
    	
    	/* 检查图片：如果有错误，检查尺寸是否超过最大值；否则，检查文件类型 */
    	if (isset($_FILES['goods_img']['error'])) // php 4.2 版本才支持 error
    	{
    		// 最大上传文件大小
    		$php_maxsize = ini_get('upload_max_filesize');
    		$htm_maxsize = '2M';
    	
    		// 商品图片
    		if ($_FILES['goods_img']['error'] == 0)
    		{
    			if (!$image->check_img_type($_FILES['goods_img']['type']))
    			{
    				$this->message(L('invalid_goods_img'));
    			}
    		}
    		elseif ($_FILES['goods_img']['error'] == 1)
    		{
    			$this->message(sprintf(L('goods_img_too_big'), $php_maxsize));
    		}
    		elseif ($_FILES['goods_img']['error'] == 2)
    		{
    			$this->message(sprintf(L('goods_img_too_big'), $htm_maxsize));
    		}
    	
    		// 商品缩略图
    		if (isset($_FILES['goods_thumb']))
    		{
    			if ($_FILES['goods_thumb']['error'] == 0)
    			{
    				if (!$image->check_img_type($_FILES['goods_thumb']['type']))
    				{
    					$this->message(L('invalid_goods_thumb'));
    				}
    			}
    			elseif ($_FILES['goods_thumb']['error'] == 1)
    			{
    				$this->message(sprintf(L('goods_thumb_too_big'), $php_maxsize));
    			}
    			elseif ($_FILES['goods_thumb']['error'] == 2)
    			{
    				$this->message(sprintf(L('goods_thumb_too_big'), $htm_maxsize));
    			}
    		}
    	
    		// 相册图片
    		foreach ($_FILES['img_url']['error'] AS $key => $value)
    		{
    			if ($value == 0)
    			{
    				if (!$image->check_img_type($_FILES['img_url']['type'][$key]))
    				{
    					$this->message(sprintf(L('invalid_img_url'), $key + 1));
    				}
    			}
    			elseif ($value == 1)
    			{
    				$this->message(sprintf(L('img_url_too_big'), $key + 1, $php_maxsize));
    			}
    			elseif ($_FILES['img_url']['error'] == 2)
    			{
    				$this->message(sprintf(L('img_url_too_big'), $key + 1, $htm_maxsize));
    			}
    		}
    	}
    	/* 4.1版本 */
    	else
    	{
    		// 商品图片
    		if ($_FILES['goods_img']['tmp_name'] != 'none')
    		{
    			if (!$image->check_img_type($_FILES['goods_img']['type']))
    			{
    	
    				$this->message(L('invalid_goods_img'));
    			}
    		}
    	
    		// 商品缩略图
    		if (isset($_FILES['goods_thumb']))
    		{
    			if ($_FILES['goods_thumb']['tmp_name'] != 'none')
    			{
    				if (!$image->check_img_type($_FILES['goods_thumb']['type']))
    				{
    					$this->message(L('invalid_goods_thumb'));
    				}
    			}
    		}
    	
    		// 相册图片
    		foreach ($_FILES['img_url']['tmp_name'] AS $key => $value)
    		{
    			if ($value != 'none')
    			{
    				if (!$image->check_img_type($_FILES['img_url']['type'][$key]))
    				{
    					$this->message(sprintf(L('invalid_img_url'), $key + 1));
    				}
    			}
    		}
    	}
    	
    	/* 插入还是更新的标识 */
    	$is_insert = $_REQUEST['act'] == 'insert';
    	
    	/* 处理商品图片 */
    	$goods_img        = '';  // 初始化商品图片
    	$goods_thumb      = '';  // 初始化商品缩略图
    	$original_img     = '';  // 初始化原始图片
    	$old_original_img = '';  // 初始化原始图片旧图
    	
    	// 如果上传了商品图片，相应处理
    	if (($_FILES['goods_img']['tmp_name'] != '' && $_FILES['goods_img']['tmp_name'] != 'none') 
    			or (($_POST['goods_img_url'] != L('lab_picture_url') && $_POST['goods_img_url'] != 'http://') && $is_url_goods_img = 1))
    	{
    		if ($_REQUEST['goods_id'] > 0)
    		{
    			/* 删除原来的图片文件 */
    			$sql = "SELECT goods_thumb, goods_img, original_img " .
    					" FROM " . $this->model->pre . "goods WHERE goods_id = '$_REQUEST[goods_id]'";
    			$row = $this->model->getRow($sql);
    			if ($row['goods_thumb'] != '' && is_file('./' . $row['goods_thumb']))
    			{
    				@unlink('./' . $row['goods_thumb']);
    			}
    			if ($row['goods_img'] != '' && is_file('./' . $row['goods_img']))
    			{
    				@unlink('./' . $row['goods_img']);
    			}
    			if ($row['original_img'] != '' && is_file('./' . $row['original_img']))
    			{
    				/* 先不处理，以防止程序中途出错停止 */
    				//$old_original_img = $row['original_img']; //记录旧图路径
    			}
    		}
    	
    		if (empty($is_url_goods_img))
    		{
    			$original_img   = $image->upload_image($_FILES['goods_img']); // 原始图片
    		}
    		elseif ($_POST['goods_img_url'])
    		{
    			if(preg_match('/(.jpg|.png|.gif|.jpeg)$/',$_POST['goods_img_url']) && copy(trim($_POST['goods_img_url']), ROOT_PATH . 'temp/' . basename($_POST['goods_img_url'])))
    			{
    				$original_img = 'temp/' . basename($_POST['goods_img_url']);
    			}
    		}
    	
    		if ($original_img === false)
    		{
    			$this->message($image->error_msg());
    		}
    		$goods_img      = $original_img;   // 商品图片
    	    	
    		// 如果系统支持GD，缩放商品图片，且给商品图片和相册图片加水印
    		if ($image->gd_version() > 0 && $image->check_img_function($_FILES['goods_img']['type']) || $is_url_goods_img)
    		{
    			if (empty($is_url_goods_img))
    			{
    				// 如果设置大小不为0，缩放图片
    				if (C('image_width') != 0 || C('image_height') != 0)
    				{
    					$goods_img = $image->make_thumb('./'. $goods_img ,C('image_width'),C('image_height'));
    					if ($goods_img === false)
    					{
    						$this->message($image->error_msg());
    					}
    				}
    				else{
    					// 这里如果不复制一份，$goods_img 和 $original_img 指向同一张图片，
    					// 后面需要格式话图片路径的时候(reformat_image_name)会找不到图片
    					$pos = strpos(basename($goods_img), '.');
    					$newname = dirname($goods_img) . '/' . $image->random_filename() . substr(basename($goods_img), $pos);
    					copy('./' . $goods_img, './' . $newname);
    					$goods_img = $newname;
    				}

    				// 加水印
    				$watermark = C('watermark');
    				$watermark_place = C('watermark_place');
    				if (intval($watermark_place) > 0 && !empty($watermark))
    				{
    					if ($image->add_watermark('./'.$goods_img,'',$watermark, $watermark_place, C('watermark_alpha')) === false)
    					{
    						$this->message($image->error_msg());
    					}
    				}
    			}
    		}
    	}
    	
    	
    	// 是否上传商品缩略图
    	if (isset($_FILES['goods_thumb']) && $_FILES['goods_thumb']['tmp_name'] != '' &&
    			isset($_FILES['goods_thumb']['tmp_name']) &&$_FILES['goods_thumb']['tmp_name'] != 'none')
    	{
    		// 上传了，直接使用，原始大小
    		$goods_thumb = $image->upload_image($_FILES['goods_thumb']);
    		if ($goods_thumb === false)
    		{
    			$this->message($image->error_msg());
    		}
    	}
    	else
    	{
    		// 未上传，如果自动选择生成，且上传了商品图片，生成缩略图
    		if (isset($_POST['auto_thumb']) && !empty($original_img))
    		{
    			// 如果设置缩略图大小不为0，生成缩略图
    			if (C('thumb_width') != 0 || C('thumb_height') != 0)
    			{
    				$goods_thumb = $image->make_thumb('./' . $original_img, C('thumb_width'), C('thumb_height'));
    				if ($goods_thumb === false)
    				{
    					$this->message($image->error_msg());
    				}
    			}
    			else
    			{
    				$goods_thumb = $original_img;
    			}
    		}
    	}
    	
    	
    	/* 删除下载的外链原图 */
    	if (!empty($is_url_goods_img))
    	{
    		unlink(ROOT_PATH . $original_img);
    		$url_goods_img = $goods_img = $original_img = htmlspecialchars(trim($_POST['goods_img_url']));
    	}
    	
    	
    	/* 如果没有输入商品货号则自动生成一个商品货号 */
    	if (empty($_POST['goods_sn']))
    	{
    		if($is_insert){
    			$res = $this->model->query("SELECT MAX(goods_id) + 1 as max_id FROM " . $this->model->pre . 'goods');
    			$max_id = $res['0']['max_id'];
    		}
    		else{
    			$max_id = $_REQUEST['goods_id'];
    		}
    		$goods_sn   = generate_goods_sn($max_id);
    	}
    	else
    	{
    		$goods_sn   = $_POST['goods_sn'];
    	}
    	
    	/* 处理商品数据 */
    	$shop_price = !empty($_POST['shop_price']) ? $_POST['shop_price'] : 0;
    	$market_price = !empty($_POST['market_price']) ? $_POST['market_price'] : 0;
    	$promote_price = !empty($_POST['promote_price']) ? floatval($_POST['promote_price'] ) : 0;
    	$is_promote = empty($promote_price) ? 0 : 1;
    	$promote_start_date = ($is_promote && !empty($_POST['promote_start_date'])) ? local_strtotime($_POST['promote_start_date']) : 0;
    	$promote_end_date = ($is_promote && !empty($_POST['promote_end_date'])) ? local_strtotime($_POST['promote_end_date']) : 0;
    	$goods_weight = !empty($_POST['goods_weight']) ? $_POST['goods_weight'] * $_POST['weight_unit'] : 0;
    	$is_best = isset($_POST['is_best']) ? 1 : 0;
    	$is_new = isset($_POST['is_new']) ? 1 : 0;
    	$is_hot = isset($_POST['is_hot']) ? 1 : 0;
    	$is_on_sale = isset($_POST['is_on_sale']) ? 1 : 0;
    	$is_alone_sale = isset($_POST['is_alone_sale']) ? 1 : 0;
    	$is_shipping = isset($_POST['is_shipping']) ? 1 : 0;
    	$goods_number = isset($_POST['goods_number']) ? $_POST['goods_number'] : 0;
    	$warn_number = isset($_POST['warn_number']) ? $_POST['warn_number'] : 0;
    	$goods_type = isset($_POST['goods_type']) ? $_POST['goods_type'] : 0;
    	$give_integral = isset($_POST['give_integral']) ? intval($_POST['give_integral']) : '-1';
    	$rank_integral = isset($_POST['rank_integral']) ? intval($_POST['rank_integral']) : '-1';
    	$suppliers_id = isset($_POST['suppliers_id']) ? intval($_POST['suppliers_id']) : '0';
    	
    	$goods_name_style = $_POST['goods_name_color'] . '+' . $_POST['goods_name_style'];
    	
    	$catgory_id = empty($_POST['cat_id']) ? '' : intval($_POST['cat_id']);
    	$brand_id = empty($_POST['brand_id']) ? 0 : intval($_POST['brand_id']);
    	
    	$goods_thumb = (empty($goods_thumb) && !empty($_POST['goods_thumb_url']) && $this->goods_parse_url($_POST['goods_thumb_url'])) ? htmlspecialchars(trim($_POST['goods_thumb_url'])) : $goods_thumb;
    	$goods_thumb = (empty($goods_thumb) && isset($_POST['auto_thumb']))? $goods_img : $goods_thumb;

        $goods_desc = format_image_width($_POST[goods_desc]);
    	
    	/* 入库 */
    	if ($is_insert)
    	{
    		if ($code == '')
    		{
    			$sql = "INSERT INTO " . $this->model->pre . "goods (goods_name, goods_name_style, goods_sn, " .
    					"cat_id, brand_id, shop_price, market_price, is_promote, promote_price, " .
    					"promote_start_date, promote_end_date, goods_img, goods_thumb, original_img, keywords, goods_brief, " .
    					"seller_note, goods_weight, goods_number, warn_number, integral, give_integral, is_best, is_new, is_hot, " .
    					"is_on_sale, is_alone_sale, is_shipping, goods_desc, add_time, last_update, goods_type, rank_integral, suppliers_id)" .
    					"VALUES ('$_POST[goods_name]', '$goods_name_style', '$goods_sn', '$catgory_id', " .
    					"'$brand_id', '$shop_price', '$market_price', '$is_promote','$promote_price', ".
    					"'$promote_start_date', '$promote_end_date', '$goods_img', '$goods_thumb', '$original_img', ".
    					"'$_POST[keywords]', '$_POST[goods_brief]', '$_POST[seller_note]', '$goods_weight', '$goods_number',".
    					" '$warn_number', '$_POST[integral]', '$give_integral', '$is_best', '$is_new', '$is_hot', '$is_on_sale', '$is_alone_sale', $is_shipping, ".
    					" '$goods_desc', '" . gmtime() . "', '". gmtime() ."', '$goods_type', '$rank_integral', '$suppliers_id')";
    		}
    		else
    		{
    			$sql = "INSERT INTO " . $this->model->pre . "goods (goods_name, goods_name_style, goods_sn, " .
    					"cat_id, brand_id, shop_price, market_price, is_promote, promote_price, " .
    					"promote_start_date, promote_end_date, goods_img, goods_thumb, original_img, keywords, goods_brief, " .
    					"seller_note, goods_weight, goods_number, warn_number, integral, give_integral, is_best, is_new, is_hot, is_real, " .
    					"is_on_sale, is_alone_sale, is_shipping, goods_desc, add_time, last_update, goods_type, extension_code, rank_integral)" .
    					"VALUES ('$_POST[goods_name]', '$goods_name_style', '$goods_sn', '$catgory_id', " .
    					"'$brand_id', '$shop_price', '$market_price', '$is_promote','$promote_price', ".
    					"'$promote_start_date', '$promote_end_date', '$goods_img', '$goods_thumb', '$original_img', ".
    					"'$_POST[keywords]', '$_POST[goods_brief]', '$_POST[seller_note]', '$goods_weight', '$goods_number',".
    					" '$warn_number', '$_POST[integral]', '$give_integral', '$is_best', '$is_new', '$is_hot', 0, '$is_on_sale', '$is_alone_sale', $is_shipping, ".
    					" 'goods_desc', '" . gmtime() . "', '". gmtime() ."', '$goods_type', '$code', '$rank_integral')";
    		}
    	}
    	else
    	{
    		/* 如果有上传图片，删除原来的商品图 */
    		$sql = "SELECT goods_thumb, goods_img, original_img " .
    				" FROM " . $this->model->pre . "goods WHERE goods_id = '$_REQUEST[goods_id]'";
    		$row = $this->model->getRow($sql);
    		if ($goods_img && $row['goods_img'] && !$this->goods_parse_url($row['goods_img']))
    		{
    			@unlink(ROOT_PATH . $row['goods_img']);
    			@unlink(ROOT_PATH . $row['original_img']);
    		}
    	
    		if ($goods_thumb && $row['goods_thumb'] && !$this->goods_parse_url($row['goods_thumb']))
    		{
    			@unlink(ROOT_PATH . $row['goods_thumb']);
    		}
    	
    		$sql = "UPDATE " . $this->model->pre . "goods SET " .
    				"goods_name = '$_POST[goods_name]', " .
    				"goods_name_style = '$goods_name_style', " .
    				"goods_sn = '$goods_sn', " .
    				"cat_id = '$catgory_id', " .
    				"brand_id = '$brand_id', " .
    				"shop_price = '$shop_price', " .
    				"market_price = '$market_price', " .
    				"is_promote = '$is_promote', " .
    				"promote_price = '$promote_price', " .
    				"promote_start_date = '$promote_start_date', " .
    				"suppliers_id = '$suppliers_id', " .
    				"promote_end_date = '$promote_end_date', ";
    	
    		/* 如果有上传图片，需要更新数据库 */
    		if ($goods_img)
    		{
    			$sql .= "goods_img = '$goods_img', original_img = '$original_img', ";
    		}
    		if ($goods_thumb)
    		{
    			$sql .= "goods_thumb = '$goods_thumb', ";
    		}
    		if ($code != '')
    		{
    			$sql .= "is_real=0, extension_code='$code', ";
    		}
    		$sql .= "keywords = '$_POST[keywords]', " .
    		"goods_brief = '$_POST[goods_brief]', " .
    		"seller_note = '$_POST[seller_note]', " .
    		"goods_weight = '$goods_weight'," .
    		"goods_number = '$goods_number', " .
    		"warn_number = '$warn_number', " .
    		"integral = '$_POST[integral]', " .
    		"give_integral = '$give_integral', " .
    		"rank_integral = '$rank_integral', " .
    		"is_best = '$is_best', " .
    		"is_new = '$is_new', " .
    		"is_hot = '$is_hot', " .
    		"is_on_sale = '$is_on_sale', " .
    		"is_alone_sale = '$is_alone_sale', " .
    		"is_shipping = '$is_shipping', " .
    		"goods_desc = '$goods_desc', " .
    		"last_update = '". gmtime() ."', ".
    		"goods_type = '$goods_type' " .
    		"WHERE goods_id = '$_REQUEST[goods_id]' LIMIT 1";
    	}
    	$this->model->query($sql);
    	
    	/* 商品编号 */
    	$goods_id = $is_insert ? $this->model->insert_id() : $_REQUEST['goods_id'];
    	
    	/* 记录日志 */
    	if ($is_insert)
    	{
    		model('Admin')->admin_log($_POST['goods_name'], 'add', 'goods');
    	}
    	else
    	{
    		model('Admin')->admin_log($_POST['goods_name'], 'edit', 'goods');
    	}
    	
    	/* 处理属性 */
    	if ((isset($_POST['attr_id_list']) && isset($_POST['attr_value_list'])) || (empty($_POST['attr_id_list']) && empty($_POST['attr_value_list'])))
    	{
    		// 取得原有的属性值
    		$goods_attr_list = array();
    	
    		$keywords_arr = explode(" ", $_POST['keywords']);
    	
    		$keywords_arr = array_flip($keywords_arr);
    		if (isset($keywords_arr['']))
    		{
    			unset($keywords_arr['']);
    		}
    	
    		$sql = "SELECT attr_id, attr_index FROM " . $this->model->pre . "attribute WHERE cat_id = '$goods_type'";
    	
    		$attr_res = $this->model->query($sql);
    	
    		$attr_list = array();
    	
    		foreach ($attr_res as $row)
    		{
    			$attr_list[$row['attr_id']] = $row['attr_index'];
    		}
    	
    		$sql = "SELECT g.*, a.attr_type
                FROM " . $this->model->pre . "goods_attr AS g
                    LEFT JOIN " . $this->model->pre . "attribute AS a
    	                    ON a.attr_id = g.attr_id
    	                    WHERE g.goods_id = '$goods_id'";
    	
    		$res = $this->model->query($sql);
    	
    		foreach ($res as $row)
    		{
    			$goods_attr_list[$row['attr_id']][$row['attr_value']] = array('sign' => 'delete', 'goods_attr_id' => $row['goods_attr_id']);
    		}
    		// 循环现有的，根据原有的做相应处理
    		if(isset($_POST['attr_id_list']))
    		{
    			foreach ($_POST['attr_id_list'] AS $key => $attr_id)
    			{
    				$attr_value = $_POST['attr_value_list'][$key];
    				$attr_price = $_POST['attr_price_list'][$key];
    				if (!empty($attr_value))
    				{
    					if (isset($goods_attr_list[$attr_id][$attr_value]))
    					{
    						// 如果原来有，标记为更新
    						$goods_attr_list[$attr_id][$attr_value]['sign'] = 'update';
    						$goods_attr_list[$attr_id][$attr_value]['attr_price'] = $attr_price;
    					}
    					else
    					{
    						// 如果原来没有，标记为新增
    						$goods_attr_list[$attr_id][$attr_value]['sign'] = 'insert';
    						$goods_attr_list[$attr_id][$attr_value]['attr_price'] = $attr_price;
    					}
    					$val_arr = explode(' ', $attr_value);
    					foreach ($val_arr AS $k => $v)
    					{
    						if (!isset($keywords_arr[$v]) && $attr_list[$attr_id] == "1")
    						{
    							$keywords_arr[$v] = $v;
    						}
    					}
    				}
    			}
    		}
    		$keywords = join(' ', array_flip($keywords_arr));
    	
    		$sql = "UPDATE " .$this->model->pre . "goods SET keywords = '$keywords' WHERE goods_id = '$goods_id' LIMIT 1";
    	
    		$this->model->query($sql);
    	
    		/* 插入、更新、删除数据 */
    		foreach ($goods_attr_list as $attr_id => $attr_value_list)
    		{
    			foreach ($attr_value_list as $attr_value => $info)
    			{
    				if ($info['sign'] == 'insert')
    				{
    					$sql = "INSERT INTO " .$this->model->pre . "goods_attr (attr_id, goods_id, attr_value, attr_price)".
    							"VALUES ('$attr_id', '$goods_id', '$attr_value', '$info[attr_price]')";
    				}
    				elseif ($info['sign'] == 'update')
    				{
    					$sql = "UPDATE " .$this->model->pre . "goods_attr SET attr_price = '$info[attr_price]' WHERE goods_attr_id = '$info[goods_attr_id]' LIMIT 1";
    				}
    				else
    				{
    					$sql = "DELETE FROM " .$this->model->pre . "goods_attr WHERE goods_attr_id = '$info[goods_attr_id]' LIMIT 1";
    				}
    				$this->model->query($sql);
    			}
    		}
    	}
    	
    	/* 处理会员价格 */
    	if (isset($_POST['user_rank']) && isset($_POST['user_price']))
    	{
    		handle_member_price($goods_id, $_POST['user_rank'], $_POST['user_price']);
    	}
    	
    	/* 处理优惠价格 */
    	if (isset($_POST['volume_number']) && isset($_POST['volume_price']))
    	{
    		$temp_num = array_count_values($_POST['volume_number']);
    		foreach($temp_num as $v)
    		{
    			if ($v > 1)
    			{
    				$this->message(L('volume_number_continuous'));
    				break;
    			}
    		}
    		$this->handle_volume_price($goods_id, $_POST['volume_number'], $_POST['volume_price']);
    	}
    	
    	/* 处理扩展分类 */
    	if (isset($_POST['other_cat']))
    	{
    		handle_other_cat($goods_id, array_unique($_POST['other_cat']));
    	}
    	
    	if ($is_insert)
    	{
    		/* 处理关联商品 */
    		handle_link_goods($goods_id);
    	
    		/* 处理组合商品 */
    		handle_group_goods($goods_id);
    	
    		/* 处理关联文章 */
    		handle_goods_article($goods_id);
    	}
    	
    	/* 重新格式化图片名称 */
    	$original_img = reformat_image_name('goods', $goods_id, $original_img, 'source');
    	$goods_img = reformat_image_name('goods', $goods_id, $goods_img, 'goods');
    	$goods_thumb = reformat_image_name('goods_thumb', $goods_id, $goods_thumb, 'thumb');
    	if ($goods_img !== false)
    	{
    		$this->model->query("UPDATE " . $this->model->pre . "goods SET goods_img = '$goods_img' WHERE goods_id='$goods_id'");
    	}
    	
    	if ($original_img !== false)
    	{
    		$this->model->query("UPDATE " . $this->model->pre . "goods SET original_img = '$original_img' WHERE goods_id='$goods_id'");
    	}
    	
    	if ($goods_thumb !== false)
    	{
    		$this->model->query("UPDATE " . $this->model->pre . "goods SET goods_thumb = '$goods_thumb' WHERE goods_id='$goods_id'");
    	}
    	
    	/* 处理相册图片 */
    	$this->handle_gallery_image($goods_id, $_FILES['img_url'], $_POST['img_desc'], $_POST['img_file']);
    	
    	/* 编辑时处理相册图片描述 */
    	if (!$is_insert && isset($_POST['old_img_desc']))
    	{
    		foreach ($_POST['old_img_desc'] AS $img_id => $img_desc)
    		{
    			$sql = "UPDATE " . $this->model->pre . "goods_gallery SET img_desc = '$img_desc' WHERE img_id = '$img_id' LIMIT 1";
    			$this->model->query($sql);
    		}
    	}
    	
    	/* 不保留商品原图的时候删除原图 */
    	if (!C('retain_original_img') && !empty($original_img))
    	{
    		$this->model->query("UPDATE " . $this->model->pre . "goods SET original_img='' WHERE `goods_id`='{$goods_id}'");
    		$this->model->query("UPDATE " . $this->model->pre . "goods_gallery SET img_original='' WHERE `goods_id`='{$goods_id}'");
    		@unlink('./' . $original_img);
    	}
    	
    	/* 记录上一次选择的分类和品牌 */
    	setcookie('ECSCP[last_choose]', $catgory_id . '|' . $brand_id, gmtime() + 86400);
    	/* 清空缓存 */
    	clear_cache_files();
    	
    	/* 提示页面 */
    	$link = array();
    	if (check_goods_specifications_exist($goods_id))
    	{
    		$link[0] = array('href' => U('Product/index',array('goods_id'=>$goods_id)), 'text' => L('product'));
    	}
    	if ($code == 'virtual_card')
    	{
    		$link[1] = array('href' => 'virtual_card.php?act=replenish&goods_id=' . $goods_id, 'text' => L('add_replenish'));
    	}
    	if ($is_insert)
    	{
    		$link[2] = add_link($code);
    	}
    	$link[3] = $this->list_link($is_insert, $code);
    	
    	
    	//$key_array = array_keys($link);
    	for($i=0;$i<count($link);$i++)
    	{
    		$key_array[]=$i;
    	}
    	krsort($link);
    	$link = array_combine($key_array, $link);
    	
    	
    	$this->message($is_insert ? L('add_goods_ok') : L('edit_goods_ok'), $link);
    }

    /**
     * 删除自定义回复
     */
    public function del() {
        $id = I('id');

        $condition['reply_id'] = $id;
        $this->model->table('reply')->where($condition)->delete();
        clear_all_files();
        $this->message(L('drop_succeed'), url('index'));
    }

    
    /**
     * 列表链接
     * @param   bool    $is_add         是否添加（插入）
     * @param   string  $extension_code 虚拟商品扩展代码，实体商品为空
     * @return  array('href' => $href, 'text' => $text)
     */
    function list_link($is_add = true, $extension_code = '')
    {
    	$param = array();
    	if (!empty($extension_code))
    	{
    		$param['extension_code'] = $extension_code;
    	}
    	if (!$is_add)
    	{
    		$param['uselastfilter'] = 1;
    	}
    	$href = U('goods/index',$param);
    
    	if ($extension_code == 'virtual_card')
    	{
    		$text = L('50_virtual_card_list'); 
    	}
    	else
    	{
    		$text = L('01_goods_list');
    	}
    
    	return array('href' => $href, 'text' => $text);
    }
    
    /**
     * 添加链接
     * @param   string  $extension_code 虚拟商品扩展代码，实体商品为空
     * @return  array('href' => $href, 'text' => $text)
     */
    function add_link($extension_code = '')
    {
    	$href = '';
    	if (empty($extension_code))
    	{
    		$href = U('goods/add');
    	}
    	else{
    		$href = U('goods/add',array('extension_code'=>$extension_code));
    	}
    
    	if ($extension_code == 'virtual_card')
    	{
    		$text = L('51_virtual_card_add');
    	}
    	else
    	{
    		$text = L('02_goods_add');
    	}
    
    	return array('href' => $href, 'text' => $text);
    }
    
    /**
     * 设置品牌下拉菜单
     * */
    function set_brands($selected='0'){
    	$brand_list = get_brand_list();
    	$select = '';
    	foreach ($brand_list as $key=>$value) {
    		$select .= '<option value="' . $key . '" ';
    		$select .= ($selected == $key) ? "selected='true'" : '';
    		$select .= '>';
    		$select .= $value . '</option>';
    	}
    	$this->assign('brand_list_option', $select);
    }
    /**
     * 设置供应商下拉菜单
     * */
    function set_suppliers($selected='0'){
    	$suppliers_list_name = suppliers_list_name();
    	$suppliers_exists = 1;
    	if (empty($suppliers_list_name))
    	{
    		$suppliers_exists = 0;
    	}
    	$this->assign('suppliers_exists', $suppliers_exists);
    	$select = '';
    	foreach ($suppliers_list_name as $key=>$value) {
    		$select .= '<option value="' . $key . '" ';
    		$select .= ($selected == $key) ? "selected='true'" : '';
    		$select .= '>';
    		$select .= $value . '</option>';
    	}
    	
    	$this->assign('suppliers_list_option', $select);
    	unset($suppliers_list_name, $suppliers_exists);
    }
    
    /**
     * 设置品牌下拉菜单
     * */
    function set_units($selected='0.001'){
    	$unit_list = get_unit_list();
    	$select = '';
    	foreach ($unit_list as $key=>$value) {
    		$select .= '<option value="' . $key . '" ';
    		$select .= ($selected == $key) ? "selected='true'" : '';
    		$select .= '>';
    		$select .= $value . '</option>';
    	}
    	$this->assign('unit_list_option', $select);
    }
    
    function set_intro($selected=''){
    	$intro_list = get_intro_list();
    	$select = '';
    	foreach ($intro_list as $key=>$value) {
    		$select .= '<option value="' . $key . '" ';
    		$select .= ($selected == $key) ? "selected='true'" : '';
    		$select .= '>';
    		$select .= $value . '</option>';
    	}
    	$this->assign('intro_list_option', $select);
    }
    
    function get_attr(){
    	//check_authz_json('goods_manage');
    	$this->logger->log(7,"goods get_attr in.");
    	
    	$goods_id   = empty($_GET['goods_id']) ? 0 : intval($_GET['goods_id']);
    	$goods_type = empty($_GET['goods_type']) ? 0 : intval($_GET['goods_type']);
    	
    	$content    = build_attr_html($goods_type, $goods_id);
    	
    	make_json_result($content);
    }
    
	function search_good(){
    	$is_delete = empty($_REQUEST['is_delete']) ? 0 : intval($_REQUEST['is_delete']);
    	$code = empty($_REQUEST['extension_code']) ? '' : trim($_REQUEST['extension_code']);
    	
    	
    	$filter['page'] = '{page}';
    	$offset = $this->pageLimit(url('index', $filter), 12);
    	$goods_list = goods_list(0,$offset, (($code == '') ? 1 : 0));
    	 
    	$this->assign('page', $this->pageShow($goods_list['record_count']));
    	
    	$handler_list = array();
    	$handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=card', 'title'=>L('card'), 'img'=>'icon_send_bonus.gif');
    	$handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=replenish', 'title'=>L('replenish'), 'img'=>'icon_add.gif');
    	$handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=batch_card_add', 'title'=>L('batch_card_add'), 'img'=>'icon_output.gif');
    	
    	if (isset($handler_list[$code]))
    	{
    		$this->assign('add_handler',      $handler_list[$code]);
    	}
    	$this->assign('code',         $code);
    	$this->assign('goods_list',   $goods_list['goods']);
    	$this->assign('filter',       $goods_list['filter']);
    	$this->assign('list_type',    $is_delete ? 'trash' : 'goods');
    	$use_storage = C('use_storage');
    	$this->assign('use_storage',  empty($use_storage) ? 0 : 1);
    	
    	/* 排序标记 */
    	$sort_flag  = sort_flag($goods_list['filter']);
    	$this->assign($sort_flag['tag'], $sort_flag['img']);
    	
    	/* 获取商品类型存在规格的类型 */
    	$specifications = get_goods_type_specifications();
    	$this->assign('specifications', $specifications);
    	
    	$tpl = $is_delete ? 'goods_trash' : 'goods_list';
    	
    	make_json_result($this->display('goods_list',true), '',array('filter' => $goods_list['filter']));
    }   

    /**
     * 检查图片网址是否合法
     *
     * @param string $url 网址
     *
     * @return boolean
     */
    function goods_parse_url($url)
    {
    	$parse_url = @parse_url($url);
    	return (!empty($parse_url['scheme']) && !empty($parse_url['host']));
    }
    /**
     * 保存某商品的优惠价格
     * @param   int     $goods_id    商品编号
     * @param   array   $number_list 优惠数量列表
     * @param   array   $price_list  价格列表
     * @return  void
     */
    function handle_volume_price($goods_id, $number_list, $price_list)
    {
    	$sql = "DELETE FROM " . $this->model->pre . "volume_price WHERE price_type = '1' AND goods_id = '$goods_id'";
    	$this->model->query($sql);
    
    
    	/* 循环处理每个优惠价格 */
    	foreach ($price_list AS $key => $price)
    	{
    		/* 价格对应的数量上下限 */
    		$volume_number = $number_list[$key];
    
    		if (!empty($price))
    		{
    			$sql = "INSERT INTO " . $this->model->pre .
	    			"volume_price (price_type, goods_id, volume_number, volume_price) " .
	    			"VALUES ('1', '$goods_id', '$volume_number', '$price')";
    			$this->model->query($sql);
    		}
    	}
    }
    
    public function operate(){
    	//check_authz_json('goods_manage');
    	$act = I('act');
    	$goods_id   = intval($_POST['id']);
    	if('edit_goods_name' == $act){
			$goods_name = json_str_iconv(trim($_POST['val']));

			if ($this->update(array('goods_name'=>$goods_name), $goods_id))
			{
				clear_cache_files();
				make_json_result(stripslashes($goods_name));
			}
    		
    	}
    	elseif('edit_goods_sn' == $act){

			$goods_sn = json_str_iconv(trim($_POST['val']));

			/* 检查是否重复 */
			if (!$this->is_only('goods_sn', $goods_sn, $goods_id))
			{
				make_json_error(L('goods_sn_exists'));
			}
			$sql="SELECT goods_id FROM ". $this->model->pre. "products" ."WHERE product_sn='$goods_sn'";
			if($this->model->getOne($sql))
			{
				make_json_error(L('goods_sn_exists'));
			}
			if ($this->update(array('goods_sn'=>$goods_sn), $goods_id))
			{
				clear_cache_files();
				make_json_result(stripslashes($goods_sn));
			}
    	
    	}
    	elseif('edit_goods_price' == $act){
    		
    		$goods_price    = floatval($_POST['val']);
    		$price_rate     = floatval(C('market_price_rate') * $goods_price);
    		
    		if ($goods_price < 0 || $goods_price == 0 && $_POST['val'] != "$goods_price")
    		{
    			make_json_error(L('shop_price_invalid'));
    		}
    		else
    		{
    			if ($this->update(array('shop_price'=>$goods_price,'market_price'=>$price_rate), $goods_id))
    			{
    				clear_cache_files();
    				make_json_result(number_format($goods_price, 2, '.', ''));
    			}
    		}
    	}
    	elseif('edit_goods_number' == $act){

			$goods_num  = intval($_POST['val']);

			if($goods_num < 0 || $goods_num == 0 && $_POST['val'] != "$goods_num")
			{
				make_json_error(L('goods_number_error'));
			}

			if(check_goods_product_exist($goods_id) == 1)
			{
				make_json_error(L('sys')['wrong'] . L('cannot_goods_number'));
			}

			if ($this->update(array('goods_number'=>$goods_num), $goods_id))
			{
				clear_cache_files();
				make_json_result($goods_num);
			}
    	}
    	elseif('edit_sort_order' == $act){

			$sort_order     = intval($_POST['val']);

			if ($this->update(array('sort_order'=>$sort_order), $goods_id))
			{
				clear_cache_files();
				make_json_result($sort_order);
			}
    	}
    	elseif('toggle_on_sale' == $act){

			$on_sale        = intval($_POST['val']);

			if ($this->update(array('is_on_sale'=>$on_sale), $goods_id))
			{
				clear_cache_files();
				make_json_result($on_sale);
			}
    	}
    	elseif('toggle_best' == $act){

			$is_best        = intval($_POST['val']);

			if ($this->update(array('is_best'=>$is_best), $goods_id))
			{
				clear_cache_files();
				make_json_result($is_best);
			}
    	}
    	elseif('toggle_new' == $act){

			$is_new         = intval($_POST['val']);

			if ($this->update(array('is_new'=>$is_new), $goods_id))
			{
				clear_cache_files();
				make_json_result($is_new);
			}
    	}
    	elseif('toggle_hot' == $act){

			$is_hot         = intval($_POST['val']);

			if ($this->update(array('is_hot'=>$is_hot), $goods_id))
			{
				clear_cache_files();
				make_json_result($is_hot);
			}
    	}
    	elseif('remove' == $act){

			/* 检查权限 */
			if ($this->update(array('is_delete'=>1), $goods_id))
			{
				clear_cache_files();
				$goods_name = $this->get_name($goods_id);

				model('Admin')->admin_log(addslashes($goods_name), 'trash', 'goods'); // 记录日志

			}

			$url = U('operate',array('act'=>'query'));
			ecs_header("Location: $url\n");
			exit;
    	}
    	elseif('query' == $act){
    		$is_delete = empty($_REQUEST['is_delete']) ? 0 : intval($_REQUEST['is_delete']);
			$code = empty($_REQUEST['extension_code']) ? '' : trim($_REQUEST['extension_code']);
			
			$filter['page'] = '{page}';
			$offset = $this->pageLimit(url('index', $filter), 12);
			$goods_list = goods_list($is_delete,$offset, (($code == '') ? 1 : 0));
			 
			$this->assign('page', $this->pageShow($goods_list['record_count']));
			 
			$this->assign('record_count',   $goods_list['record_count']);
			$this->assign('goods_list',   $goods_list['goods']);
			$this->assign('filter',       $goods_list['filter']);

			$handler_list = array();
			$handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=card', 'title'=>L('card'), 'img'=>'icon_send_bonus.gif');
			$handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=replenish', 'title'=>L('replenish'), 'img'=>'icon_add.gif');
			$handler_list['virtual_card'][] = array('url'=>'virtual_card.php?act=batch_card_add', 'title'=>L('batch_card_add'), 'img'=>'icon_output.gif');

			if (isset($handler_list[$code]))
			{
				$this->assign('add_handler',      $handler_list[$code]);
			}
			$this->assign('code',         $code);
			$this->assign('goods_list',   $goods_list['goods']);
			$this->assign('filter',       $goods_list['filter']);
			$this->assign('record_count', $goods_list['record_count']);
			$this->assign('list_type',    $is_delete ? 'trash' : 'goods');
			$use_storage = C('use_storage');
			$this->assign('use_storage',  empty($use_storage) ? 0 : 1);

			/* 排序标记 */
			$sort_flag  = sort_flag($goods_list['filter']);
			$this->assign($sort_flag['tag'], $sort_flag['img']);

			/* 获取商品类型存在规格的类型 */
			$specifications = get_goods_type_specifications();
			$this->assign('specifications', $specifications);

			$tpl = $is_delete ? 'goods_trash' : 'goods_list';

			make_json_result($this->display($tpl,true), '',array('filter' => $goods_list['filter']));
    	}
    	elseif('query_trash' == $act){
    		$filter['page'] = '{page}';
    		$offset = $this->pageLimit(url('index', $filter), 12);
    		$goods_list = goods_list(1, $offset, -1);
    	
    		$this->assign('page', $this->pageShow($goods_list['record_count']));
    	
    		$this->assign('record_count',   $goods_list['record_count']);
    		$this->assign('goods_list',   $goods_list['goods']);
    		$this->assign('filter',       $goods_list['filter']);

    		$this->assign('code',         $code);
    		$this->assign('goods_list',   $goods_list['goods']);
    		$this->assign('filter',       $goods_list['filter']);
    		$this->assign('record_count', $goods_list['record_count']);
    	
    		/* 排序标记 */
    		$sort_flag  = sort_flag($goods_list['filter']);
    		$this->assign($sort_flag['tag'], $sort_flag['img']);
    	
    		make_json_result($this->display('goods_trash_list',true), '',array('filter' => $goods_list['filter']));
    	}
    	elseif('show_image' == $act){
    		$this->assign('img_url', $_GET['img_url']);
    		$this->display('goods_show_image');
    	}
    	elseif ('check_goods_sn'== $act){
    		//check_authz_json('goods_manage');
    		
    		$goods_id = intval($_REQUEST['goods_id']);
    		$goods_sn = json_str_iconv(trim($_REQUEST['goods_sn']));
    		
    		/* 检查是否重复 */
    		if (!$this->is_only('goods_sn', $goods_sn, $goods_id))
    		{
    			make_json_error(L('goods_sn_exists'));
    		}
    		
    		make_json_result('');
    	}
    	elseif ('drop_image' == $act){
    		$img_id = empty($_REQUEST['img_id']) ? 0 : intval($_REQUEST['img_id']);
    		
    		/* 删除图片文件 */
    		$sql = "SELECT img_url, thumb_url, img_original FROM " . $this->model->pre . "goods_gallery WHERE img_id = '$img_id'";
    		$row = $this->model->getRow($sql);
    		
    		if ($row['img_url'] != '' && is_file('./' . $row['img_url']))
    		{
    			@unlink('./' . $row['img_url']);
    		}
    		if ($row['thumb_url'] != '' && is_file('./' . $row['thumb_url']))
    		{
    			@unlink('./' . $row['thumb_url']);
    		}
    		if ($row['img_original'] != '' && is_file('./' . $row['img_original']))
    		{
    			@unlink('./' . $row['img_original']);
    		}
    		
    		/* 删除数据 */
    		$sql = "DELETE FROM " . $this->model->pre . "goods_gallery WHERE img_id = '$img_id' LIMIT 1";
    		$this->model->query($sql);
    		
    		clear_cache_files();
    		make_json_result($img_id);
    	}
    	elseif('restore_goods' == $act){
    		
    		//check_authz_json('remove_back'); // 检查权限
    		
    		$this->update_by_id("is_delete = 0, add_time = '" . gmtime() . "'", $goods_id);
    		clear_cache_files();
    		
    		$goods_name = $this->get_name($goods_id);
    		
    		model('Admin')->admin_log(addslashes($goods_name), 'restore', 'goods'); // 记录日志
    		
    		$url =U('operate',array('act'=>'query_trash'));
    		ecs_header("Location: $url\n");
    		exit;
    	}
    	elseif('drop_goods' == $act){
    		// 检查权限
		    //check_authz_json('remove_back');

		    if ($goods_id <= 0)
		    {
		        make_json_error('invalid params');
		    }
		
		    /* 取得商品信息 */
		    $sql = "SELECT goods_id, goods_name, is_delete, is_real, goods_thumb, " .
		                "goods_img, original_img " .
		            "FROM " . $this->model->pre. "goods WHERE goods_id = '$goods_id'";
		    $goods = $this->model->getRow($sql);
		    if (empty($goods))
		    {
		        make_json_error(L('goods_not_exist'));
		    }
		
		    if ($goods['is_delete'] != 1)
		    {
		        make_json_error(L('goods_not_in_recycle_bin'));
		    }
		
		    /* 删除商品图片和轮播图片 */
		    if (!empty($goods['goods_thumb']))
		    {
		        @unlink('./' . $goods['goods_thumb']);
		    }
		    if (!empty($goods['goods_img']))
		    {
		        @unlink('./' . $goods['goods_img']);
		    }
		    if (!empty($goods['original_img']))
		    {
		        @unlink('./' . $goods['original_img']);
		    }
		    /* 删除商品 */
		    $this->drop($goods_id);
		
		    /* 删除商品的货品记录 */
		    $sql = "DELETE FROM " . $this->model->pre. "products WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		
		    /* 记录日志 */
		    model('Admin')->admin_log(addslashes($goods['goods_name']), 'remove', 'goods');
		
		    /* 删除商品相册 */
		    $sql = "SELECT img_url, thumb_url, img_original " .
		            "FROM " . $this->model->pre. "goods_gallery WHERE goods_id = '$goods_id'";
		    $res = $this->model->query($sql);
		    foreach ($res as $row)
		    {
		        if (!empty($row['img_url']))
		        {
		            @unlink('./' . $row['img_url']);
		        }
		        if (!empty($row['thumb_url']))
		        {
		            @unlink('./' . $row['thumb_url']);
		        }
		        if (!empty($row['img_original']))
		        {
		            @unlink('./' . $row['img_original']);
		        }
		    }
		
		    $sql = "DELETE FROM " . $this->model->pre. "goods_gallery"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		
		    /* 删除相关表记录 */
		    $sql = "DELETE FROM " . $this->model->pre. "collect_goods"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "goods_article"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "goods_attr"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "goods_cat"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "member_price"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "group_goods"  . " WHERE parent_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "group_goods"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "link_goods"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "link_goods"  . " WHERE link_goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "tag"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "comment"  . " WHERE comment_type = 0 AND id_value = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "collect_goods"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "booking_goods"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		    $sql = "DELETE FROM " . $this->model->pre. "goods_activity"  . " WHERE goods_id = '$goods_id'";
		    $this->model->query($sql);
		
		    /* 如果不是实体商品，删除相应虚拟商品记录 */
		    if ($goods['is_real'] != 1)
		    {
		        $sql = "DELETE FROM " . $this->model->pre. "virtual_card WHERE goods_id = '$goods_id'";
		        if (!$this->model->query($sql, 'SILENT') && $this->model->errno() != 1146)
		        {
		            die($this->model->error());
		        }
		    }
		
		    clear_cache_files();
		    $url =U('operate',array('act'=>'query_trash'));		
		    ecs_header("Location: $url\n");
		
		    exit;
    	}
    	elseif('get_goods_list' == $act){
    		
    		$filters = json_decode($_GET['JSON']);
    		
    		$arr = get_goods_list($filters);
    		$opt = array();
    		
    		foreach ($arr AS $key => $val)
    		{
    			$opt[] = array('value' => $val['goods_id'],
    					'text' => $val['goods_name'],
    					'data' => $val['shop_price']);
    		}
    		
    		make_json_result($opt);
    	}
    	elseif('add_link_goods' == $act){
    		$linked_array   = json_decode(stripslashes($_GET['add_ids']));
    		$linked_goods   = json_decode(stripslashes($_GET['JSON']));
    		$goods_id       = $linked_goods[0];
    		$is_double      = $linked_goods[1] == true ? 0 : 1;
    		
    		$this->logger->Log(7,"linked_array=" . var_export($linked_array,true));
    		
    		foreach ($linked_array AS $val)
    		{
    			if ($is_double)
    			{
    				/* 双向关联 */
    				$sql = "INSERT IGNORE INTO " . $this->model->pre. "link_goods (goods_id, link_goods_id, is_double, admin_id) " .
    						"VALUES ('$val', '$goods_id', '$is_double', '$_SESSION[admin_id]')";
    				$this->model->query($sql);
    			}
    		
    			$sql = "INSERT IGNORE INTO " . $this->model->pre. "link_goods (goods_id, link_goods_id, is_double, admin_id) " .
    					"VALUES ('$goods_id', '$val', '$is_double', '$_SESSION[admin_id]')";
    			$this->model->query($sql);
    		}
    		
    		$linked_goods   = get_linked_goods($goods_id);
    		$options        = array();
    		
    		foreach ($linked_goods AS $val)
    		{
    			$options[] = array('value'  => $val['goods_id'],
    					'text'      => $val['goods_name'],
    					'data'      => '');
    		}
    		
    		clear_cache_files();
    		make_json_result($options);
    	}
    	elseif('drop_link_goods' == $act){

    		$drop_goods     = json_decode(stripslashes($_GET['drop_ids']));
    		$drop_goods_ids = db_create_in($drop_goods);
    		$linked_goods   = json_decode(stripslashes($_GET['JSON']));
    		$goods_id       = $linked_goods[0];
    		$is_signle      = $linked_goods[1];
    		
    		if (!$is_signle)
    		{
    			$sql = "DELETE FROM " .$this->model->pre. "link_goods WHERE link_goods_id = '$goods_id' AND goods_id " . $drop_goods_ids;
    		}
    		else
    		{
    			$sql = "UPDATE " .$this->model->pre. "link_goods SET is_double = 0 ".
    					" WHERE link_goods_id = '$goods_id' AND goods_id " . $drop_goods_ids;
    		}
    		if ($goods_id == 0)
    		{
    			$sql .= " AND admin_id = '$_SESSION[admin_id]'";
    		}
    		$this->model->query($sql);
    		
    		$sql = "DELETE FROM " .$this->model->pre. "link_goods WHERE goods_id = '$goods_id' AND link_goods_id " . $drop_goods_ids;
    		if ($goods_id == 0)
    		{
    			$sql .= " AND admin_id = '$_SESSION[admin_id]'";
    		}
    		$this->model->query($sql);
    		
    		$linked_goods = get_linked_goods($goods_id);
    		$options      = array();
    		
    		foreach ($linked_goods AS $val)
    		{
    			$options[] = array(
    					'value' => $val['goods_id'],
    					'text'  => $val['goods_name'],
    					'data'  => '');
    		}
    		
    		clear_cache_files();
    		make_json_result($options);
    	}
    	elseif('add_group_goods' == $act){
    		$fittings   = json_decode(stripslashes($_GET['add_ids']));
    		$arguments  = json_decode(stripslashes($_GET['JSON']));
    		$goods_id   = $arguments[0];
    		$price      = $arguments[1];
    		
    		foreach ($fittings AS $val)
    		{
    			$sql = "INSERT INTO " . $this->model->pre. "group_goods (parent_id, goods_id, goods_price, admin_id) " .
    					"VALUES ('$goods_id', '$val', '$price', '$_SESSION[admin_id]')";
    			$this->model->query($sql);
    		}
    		
    		$arr = get_group_goods($goods_id);
    		$opt = array();
    		
    		foreach ($arr AS $val)
    		{
    			$opt[] = array('value'      => $val['goods_id'],
    					'text'      => $val['goods_name'],
    					'data'      => '');
    		}
    		
    		clear_cache_files();
    		make_json_result($opt);
    	}
    	elseif('drop_group_goods' == $act){
    		
    		$fittings   = json_decode(stripslashes($_GET['drop_ids']));
    		$arguments  = json_decode(stripslashes($_GET['JSON']));
    		$goods_id   = $arguments[0];
    		$price      = $arguments[1];
    		
    		$sql = "DELETE FROM " .$this->model->pre. "group_goods WHERE parent_id='$goods_id' AND " .db_create_in($fittings, 'goods_id');
    		if ($goods_id == 0)
    		{
    			$sql .= " AND admin_id = '$_SESSION[admin_id]'";
    		}
    		$this->model->query($sql);
    		
    		$arr = get_group_goods($goods_id);
    		$opt = array();
    		
    		foreach ($arr AS $val)
    		{
    			$opt[] = array('value'      => $val['goods_id'],
    					'text'      => $val['goods_name'],
    					'data'      => '');
    		}
    		
    		clear_cache_files();
    		make_json_result($opt);
    	}
    	elseif('get_article_list' == $act){
    		$filters =(array) json_decode(json_str_iconv($_GET['JSON']));
    		
    		$where = " WHERE cat_id > 0 ";
    		if (!empty($filters['title']))
    		{
    			$keyword  = trim($filters['title']);
    			$where   .=  " AND title LIKE '%" . mysql_like_quote($keyword) . "%' ";
    		}
    		
    		$sql        = 'SELECT article_id, title FROM ' .$this->model->pre. "article" . $where.
    		'ORDER BY article_id DESC LIMIT 50';
    		$res        = $this->model->query($sql);
    		$arr        = array();
    		
    		foreach ($res as $row)
    		{
    			$arr[]  = array('value' => $row['article_id'], 'text' => $row['title'], 'data'=>'');
    		}
    		
    		make_json_result($arr);
    	}
    	elseif('add_goods_article' == $act){
    		$articles   = json_decode(stripslashes($_GET['add_ids']));
    		$arguments  = json_decode(stripslashes($_GET['JSON']));
    		$goods_id   = $arguments[0];
    		
    		foreach ($articles AS $val)
    		{
    			$sql = "INSERT INTO " . $this->model->pre. "goods_article (goods_id, article_id, admin_id) " .
    					"VALUES ('$goods_id', '$val', '$_SESSION[admin_id]')";
    			$this->model->query($sql);
    		}
    		
    		$arr = get_goods_articles($goods_id);
    		$opt = array();
    		
    		foreach ($arr AS $val)
    		{
    			$opt[] = array('value'      => $val['article_id'],
    					'text'      => $val['title'],
    					'data'      => '');
    		}
    		
    		clear_cache_files();
    		make_json_result($opt);
    	}
    	elseif('drop_goods_article' == $act){
    		$articles   = json_decode(stripslashes($_GET['drop_ids']));
    		$arguments  = json_decode(stripslashes($_GET['JSON']));
    		$goods_id   = $arguments[0];
    		
    		$sql = "DELETE FROM " .$this->model->pre. "goods_article WHERE " . db_create_in($articles, "article_id") . " AND goods_id = '$goods_id'";
    		$this->model->query($sql);
    		
    		$arr = get_goods_articles($goods_id);
    		$opt = array();
    		
    		foreach ($arr AS $val)
    		{
    			$opt[] = array('value'      => $val['article_id'],
    					'text'      => $val['title'],
    					'data'      => '');
    		}
    		
    		clear_cache_files();
    		make_json_result($opt);
    	}
    	
    }
    
    public function batch(){
    	/* 检查权限 */
    	// admin_priv('goods_manage');
    	
    	$code = empty($_REQUEST['extension_code'])? '' : trim($_REQUEST['extension_code']);
    	
    	/* 取得要操作的商品编号 */
    	$goods_id = !empty($_POST['checkboxes']) ? join(',', $_POST['checkboxes']) : 0;
    	$url = U('index');
    	
    	if (isset($_POST['type']))
    	{
    		/* 放入回收站 */
    		if ($_POST['type'] == 'trash')
    		{
    			/* 检查权限 */
    			//admin_priv('remove_back');
    	
    			update_goods($goods_id, 'is_delete', '1');
    	
    			/* 记录日志 */
    			model('Admin')->admin_log('', 'batch_trash', 'goods');
    		}
    		/* 上架 */
    		elseif ($_POST['type'] == 'on_sale')
    		{
    			update_goods($goods_id, 'is_on_sale', '1');
    		}
    	
    		/* 下架 */
    		elseif ($_POST['type'] == 'not_on_sale')
    		{
    			update_goods($goods_id, 'is_on_sale', '0');
    		}
    	
    		/* 设为精品 */
    		elseif ($_POST['type'] == 'best')
    		{
    			update_goods($goods_id, 'is_best', '1');
    		}
    	
    		/* 取消精品 */
    		elseif ($_POST['type'] == 'not_best')
    		{
    			update_goods($goods_id, 'is_best', '0');
    		}
    	
    		/* 设为新品 */
    		elseif ($_POST['type'] == 'new')
    		{
    			update_goods($goods_id, 'is_new', '1');
    		}
    	
    		/* 取消新品 */
    		elseif ($_POST['type'] == 'not_new')
    		{
    			update_goods($goods_id, 'is_new', '0');
    		}
    	
    		/* 设为热销 */
    		elseif ($_POST['type'] == 'hot')
    		{
    			update_goods($goods_id, 'is_hot', '1');
    		}
    	
    		/* 取消热销 */
    		elseif ($_POST['type'] == 'not_hot')
    		{
    			update_goods($goods_id, 'is_hot', '0');
    		}
    	
    		/* 转移到分类 */
    		elseif ($_POST['type'] == 'move_to')
    		{
    			update_goods($goods_id, 'cat_id', $_POST['target_cat']);
    		}
    	
    		/* 转移到供货商 */
    		elseif ($_POST['type'] == 'suppliers_move_to')
    		{
    			update_goods($goods_id, 'suppliers_id', $_POST['suppliers_id']);
    		}
    	
    		/* 还原 */
    		elseif ($_POST['type'] == 'restore')
    		{
    			$url = U('trash');
    			update_goods($goods_id, 'is_delete', '0');
    	
    			/* 记录日志 */
    			model('Admin')->admin_log('', 'batch_restore', 'goods');
    		}
    		/* 删除 */
    		elseif ($_POST['type'] == 'drop')
    		{
    			$url = U('trash');
    			delete_goods($goods_id);
    	
    			/* 记录日志 */
    			model('Admin')->admin_log('', 'batch_remove', 'goods');
    		}
    	}
    	
    	/* 清除缓存 */
    	clear_cache_files();

    	$this->message(L('batch_handle_ok'),$url);
    }
    
    function update($data, $id){
    	$data['last_update'] = gmtime();
    	$rlt = $this->model->table('goods')->data($data)->where(" goods_id='$id'")->update();
    	return $rlt > 0;
    }
    
    /**
     * 保存某商品的相册图片
     *
     * @param int $goods_id
     * @param array $image_files
     * @param array $image_descs
     * @return void
     */
    function handle_gallery_image($goods_id, $image_files, $image_descs, $image_urls)
    {
    	/* 是否处理缩略图 */
    	$proc_thumb = true;
    	$image = new EcsImage(C('bgcolor'));
    	foreach ($image_descs as $key => $img_desc) {
    		/* 是否成功上传 */
    		$flag = false;
    		if (isset($image_files['error'])) {
    			if ($image_files['error'][$key] == 0) {
    				$flag = true;
    			}
    		} else {
    			if ($image_files['tmp_name'][$key] != 'none') {
    				$flag = true;
    			}
    		}
    
    		if ($flag) {
    			// 生成缩略图
    			if ($proc_thumb) {
    				$thumb_url = $image->make_thumb($image_files['tmp_name'][$key], C('thumb_width'), C('thumb_height'));
    				$thumb_url = is_string($thumb_url) ? $thumb_url : '';
    			}
    
    			$upload = array(
    					'name' => $image_files['name'][$key],
    					'type' => $image_files['type'][$key],
    					'tmp_name' => $image_files['tmp_name'][$key],
    					'size' => $image_files['size'][$key]
    			);
    			if (isset($image_files['error'])) {
    				$upload['error'] = $image_files['error'][$key];
    			}
    			$img_original = $image->upload_image($upload);
    			if ($img_original === false) {
    				$this->message($image->error_msg());
    			}
    			$img_url = $img_original;
    
    			if (! $proc_thumb) {
    				$thumb_url = $img_original;
    			}
    			// 如果服务器支持GD 则添加水印
    			if ($proc_thumb && gd_version() > 0) {
    				$pos = strpos(basename($img_original), '.');
    				$newname = dirname($img_original) . '/' . $image->random_filename() . substr(basename($img_original), $pos);
    				copy('./' . $img_original, './' . $newname);
    				$img_url = $newname;
    
    				$image->add_watermark('./' . $img_url, '', C('watermark'), C('watermark_place'), C('watermark_alpha'));
    			}
    
    			/* 重新格式化图片名称 */
    			$img_original = reformat_image_name('gallery', $goods_id, $img_original, 'source');
    			$img_url = reformat_image_name('gallery', $goods_id, $img_url, 'goods');
    			$thumb_url = reformat_image_name('gallery_thumb', $goods_id, $thumb_url, 'thumb');
    			$sql = "INSERT INTO " . $this->model->pre . 'goods_gallery ' . " (goods_id, img_url, img_desc, thumb_url, img_original) " . "VALUES ('$goods_id', '$img_url', '$img_desc', '$thumb_url', '$img_original')";
    			$this->model->query($sql);
    			/* 不保留商品原图的时候删除原图 */
    			if (! C('retain_original_img') && ! empty($img_original)) {
    				$this->model->query("UPDATE " . $this->model->pre . 'goods_gallery ' . " SET img_original='' WHERE `goods_id`='{$goods_id}'");
    				@unlink('./' . $img_original);
    			}
    		} elseif (! empty($image_urls[$key]) && ($image_urls[$key] != L('img_file')) && ($image_urls[$key] != 'http://') && copy(trim($image_urls[$key]), ROOT_PATH . 'temp/' . basename($image_urls[$key]))) {
    			$image_url = trim($image_urls[$key]);
    
    			// 定义原图路径
    			$down_img = ROOT_PATH . 'temp/' . basename($image_url);
    
    			// 生成缩略图
    			if ($proc_thumb) {
    				$thumb_url = $image->make_thumb($down_img, C('thumb_width'), C('thumb_height'));
    				$thumb_url = is_string($thumb_url) ? $thumb_url : '';
    				$thumb_url = reformat_image_name('gallery_thumb', $goods_id, $thumb_url, 'thumb');
    			}
    
    			if (! $proc_thumb) {
    				$thumb_url = htmlspecialchars($image_url);
    			}
    
    			/* 重新格式化图片名称 */
    			$img_url = $img_original = htmlspecialchars($image_url);
    			$sql = "INSERT INTO " . $this->model->pre . 'goods_gallery ' . " (goods_id, img_url, img_desc, thumb_url, img_original) " . "VALUES ('$goods_id', '$img_url', '$img_desc', '$thumb_url', '$img_original')";
    			$this->model->query($sql);
    
    			@unlink($down_img);
    		}
    	}
    }
}


