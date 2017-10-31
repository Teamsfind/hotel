
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>酒店人事管理系统</title>
   <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/nav.css" media="screen" />
    
    <!-- BEGIN: load jquery -->
    <script src="<%=basePath %>houCss/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!--jQuery Date Picker-->
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.datepicker.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.progressbar.min.js" type="text/javascript"></script>
    
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.donutRenderer.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.bubbleRenderer.min.js"></script>
    <!-- END: load jqplot -->
    <script src="<%=basePath %>houCss/js/setup.js" type="text/javascript"></script>
  <script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();
            setDatePicker('date-picker');
          	setSidebarHeight();
        });
        
      //setup DatePicker
        function setDatePicker(containerElement) {
            var datePicker = $('#' + containerElement);
            datePicker.datepicker({
                showOn: "button",
                buttonImage: "<%=basePath %>houCss/img/calendar.gif",
                buttonImageOnly: true
            });
        }
        //定义数组，存储省份信息  
        var province = ["北京", "上海", "天津", "重庆", "浙江", "江苏", "广东", "福建", "湖南", "湖北", "辽宁",  
        "吉林", "黑龙江", "河北", "河南", "山东", "陕西", "甘肃", "新疆", "青海", "山西", "四川",  
        "贵州", "安徽", "江西", "云南", "内蒙古", "西藏", "广西", "宁夏", "海南", "香港", "澳门", "台湾"];  
          
        //定义数组,存储城市信息  
        var beijing = ["东城区", "西城区", "海淀区", "朝阳区", "丰台区", "石景山区", "通州区", "顺义区", "房山区", "大兴区", "昌平区", "怀柔区", "平谷区", "门头沟区", "延庆县", "密云县"];  
        var shanghai = ["浦东新区", "徐汇区", "长宁区", "普陀区", "闸北区", "虹口区", "杨浦区", "黄浦区", "卢湾区", "静安区", "宝山区", "闵行区", "嘉定区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县"];  
        var tianjing = ["河东", "南开", "河西", "河北", "和平", "红桥", "东丽", "津南", "西青", "北辰", "塘沽", "汉沽", "大港", "蓟县", "宝坻", "宁河", "静海", "武清"];  
        var chongqing = ["渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区", "渝北区", "巴南区", "万州区", "涪陵区", "黔江区", "长寿区", "江津区", "合川区", "永川区", "南川区"];  
        var jiangsu = ["南京", "无锡", "常州", "徐州", "苏州", "南通", "连云港", "淮安", "扬州", "盐城", "镇江", "泰州", "宿迁"];  
        var zhejiang = ["杭州", "宁波", "温州", "嘉兴", "湖州", "绍兴", "金华", "衢州", "舟山", "台州", "利水"];  
        var guangdong = ["广州", "韶关", "深圳", "珠海", "汕头", "佛山", "江门", "湛江", "茂名", "肇庆", "惠州", "梅州", "汕尾", "河源", "阳江", "清远", "东莞", "中山", "潮州", "揭阳"];  
        var fujiang = ["福州", "厦门", "莆田", "三明", "泉州", "漳州", "南平", "龙岩", "宁德"];  
        var hunan = ["长沙", "株洲", "湘潭", "衡阳", "邵阳", "岳阳", "常德", "张家界", "益阳", "郴州", "永州", "怀化", "娄底", "湘西土家苗族自治区"];  
        var hubei = ["武汉", "襄阳", "黄石", "十堰", "宜昌", "鄂州", "荆门", "孝感", "荆州", "黄冈", "咸宁", "随州", "恩施土家族苗族自治州"];  
        var liaoning = ["沈阳", "大连", "鞍山", "抚顺", "本溪", "丹东", "锦州", "营口", "阜新", "辽阳", "盘锦", "铁岭", "朝阳", "葫芦岛"];  
        var jilin = ["长春", "吉林", "四平", "辽源", "通化", "白山", "松原", "白城", "延边朝鲜族自治区"];  
        var heilongjiang = ["哈尔滨", "齐齐哈尔", "鸡西", "牡丹江", "佳木斯", "大庆", "伊春", "黑河", "大兴安岭"];  
        var hebei = ["石家庄", "保定", "唐山", "邯郸", "承德", "廊坊", "衡水", "秦皇岛", "张家口"];  
        var henan = ["郑州", "洛阳", "商丘", "安阳", "南阳", "开封", "平顶山", "焦作", "新乡", "鹤壁", "许昌", "漯河", "三门峡", "信阳", "周口", "驻马店", "济源"];  
        var shandong = ["济南", "青岛", "菏泽", "淄博", "枣庄", "东营", "烟台", "潍坊", "济宁", "泰安", "威海", "日照", "滨州", "德州", "聊城", "临沂"];  
        var shangxi = ["西安", "宝鸡", "咸阳", "渭南", "铜川", "延安", "榆林", "汉中", "安康", "商洛"];  
        var gansu = ["兰州", "嘉峪关", "金昌", "金川", "白银", "天水", "武威", "张掖", "酒泉", "平凉", "庆阳", "定西", "陇南", "临夏", "合作"];  
        var qinghai = ["西宁", "海东地区", "海北藏族自治州", "黄南藏族自治州", "海南藏族自治州", "果洛藏族自治州", "玉树藏族自治州", "海西蒙古族藏族自治州"];  
        var xinjiang = ["乌鲁木齐", "奎屯", "石河子", "昌吉", "吐鲁番", "库尔勒", "阿克苏", "喀什", "伊宁", "克拉玛依", "塔城", "哈密", "和田", "阿勒泰", "阿图什", "博乐"];  
        var shanxi = ["太原", "大同", "阳泉", "长治", "晋城", "朔州", "晋中", "运城", "忻州", "临汾", "吕梁"];  
        var sichuan = ["成都", "自贡", "攀枝花", "泸州", "德阳", "绵阳", "广元", "遂宁", "内江", "乐山", "南充", "眉山", "宜宾", "广安", "达州", "雅安", "巴中", "资阳", "阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州"];  
        var guizhou = ["贵阳", "六盘水", "遵义", "安顺", "黔南布依族苗族自治州", "黔西南布依族苗族自治州", "黔东南苗族侗族自治州", "铜仁", "毕节"];  
        var anhui = ["合肥", "芜湖", "安庆", "马鞍山", "阜阳", "六安", "滁州", "宿州", "蚌埠", "巢湖", "淮南", "宣城", "亳州", "淮北", "铜陵", "黄山", "池州"];  
        var jiangxi = ["南昌", "九江", "景德镇", "萍乡", "新余", "鹰潭", "赣州", "宜春", "上饶", "吉安", "抚州"];  
        var yunnan = ["昆明", "曲靖", "玉溪", "保山", "昭通", "丽江", "普洱", "临沧", "楚雄彝族自治州", "大理白族自治州", "红河哈尼族彝族自治州", "文山壮族苗族自治州", "西双版纳傣族自治州", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "迪庆藏族自治州"];  
        var neimenggu = ["呼和浩特", "包头", "乌海", "赤峰", "通辽", "鄂尔多斯", "呼伦贝尔", "巴彦淖尔", "乌兰察布"];  
        var guangxi = ["南宁", "柳州", "桂林", "梧州", "北海", "防城港", "钦州", "贵港", "玉林", "百色", "贺州", "河池", "崇左"];  
        var xizang = ["拉萨", "昌都地区", "林芝地区", "山南地区", "日喀则地区", "那曲地区", "阿里地区"];  
        var ningxia = ["银川", "石嘴山", "吴忠", "固原", "中卫"];  
        var hainan = ["海口", "三亚"];  
        var xianggang = ["中西区", "湾仔区", "东区", "南区", "九龙城区", "油尖旺区", "观塘区", "黄大仙区", "深水埗区", "北区", "大埔区", "沙田区", "西贡区", "元朗区", "屯门区", "荃湾区", "葵青区", "离岛区"];  
        var taiwan = ["台北", "高雄", "基隆", "台中", "台南", "新竹", "嘉义"];  
        var aomeng = ["澳门半岛", "氹仔岛", "路环岛"];  
          
        //页面加载方法  
        $(function () {  
        //设置省份数据  
        setProvince();  
          
        //设置背景颜色  
        setBgColor();  
        });  
          
          
        //设置省份数据  
        function setProvince() {  
        //给省份下拉列表赋值  
        var option, modelVal;  
        var $sel = $("#selProvince");  
          
        //获取对应省份城市  
        for (var i = 0, len = province.length; i < len; i++) {  
        modelVal = province[i];  
        option = "<option value='" + modelVal + "'>" + modelVal + "</option>";  
          
        //添加到 select 元素中  
        $sel.append(option);  
        }  
          
        //调用change事件，初始城市信息  
        provinceChange();  
        }  
          
          
        //根据选中的省份获取对应的城市  
        function setCity(provinec) {  
        var $city = $("#selCity");  
        var proCity, option, modelVal;  
          
        //通过省份名称，获取省份对应城市的数组名  
        switch (provinec) {  
        case "北京":  
        proCity = beijing;  
        break;  
        case "上海":  
        proCity = shanghai;  
        break;  
        case "天津":  
        proCity = tianjing;  
        break;  
        case "重庆":  
        proCity = chongqing;  
        break;  
        case "浙江":  
        proCity = zhejiang;  
        break;  
        case "江苏":  
        proCity = jiangsu;  
        break;  
        case "广东":  
        proCity = guangdong;  
        break;  
        case "福建":  
        proCity = fujiang;  
        break;  
        case "湖南":  
        proCity = hunan;  
        break;  
        case "湖北":  
        proCity = hubei;  
        break;  
        case "辽宁":  
        proCity = liaoning;  
        break;  
        case "吉林":  
        proCity = jilin;  
        break;  
        case "黑龙江":  
        proCity = heilongjiang;  
        break;  
        case "河北":  
        proCity = hebei;  
        break;  
        case "河南":  
        proCity = henan;  
        break;  
        case "山东":  
        proCity = shandong;  
        break;  
        case "陕西":  
        proCity = shangxi;  
        break;  
        case "甘肃":  
        proCity = gansu;  
        break;  
        case "新疆":  
        proCity = xinjiang;  
        break;  
        case "青海":  
        proCity = qinghai;  
        break;  
        case "山西":  
        proCity = shanxi;  
        break;  
        case "四川":  
        proCity = sichuan;  
        break;  
        case "贵州":  
        proCity = guizhou;  
        break;  
        case "安徽":  
        proCity = anhui;  
        break;  
        case "江西":  
        proCity = jiangxi;  
        break;  
        case "云南":  
        proCity = yunnan;  
        break;  
        case "内蒙古":  
        proCity = neimenggu;  
        break;  
        case "西藏":  
        proCity = xizang;  
        break;  
        case "广西":  
        proCity = guangxi;  
        break;  
        case "":  
        proCity = xizang;  
        break;  
        case "宁夏":  
        proCity = ningxia;  
        break;  
        case "海南":  
        proCity = hainan;  
        break;  
        case "香港":  
        proCity = xianggang;  
        break;  
        case "澳门":  
        proCity = aomeng;  
        break;  
        case "台湾":  
        proCity = taiwan;  
        break;  
        }  
          
        //先清空之前绑定的值  
        $city.empty();  
          
        //设置对应省份的城市  
        for (var i = 0, len = proCity.length; i < len; i++) {  
        modelVal = proCity[i];  
        option = "<option value='" + modelVal + "'>" + modelVal + "</option>";  
          
        //添加  
        $city.append(option);  
        }  
          
        //设置背景  
        setBgColor();  
        }  
          
          
        //省份选中事件  
        function provinceChange() {  
        var $pro = $("#selProvince");  
        setCity($pro.val());  
        }  
          
          
        //设置下拉列表间隔背景样色  
        function setBgColor() {  
        var $option = $("select option:odd");  
        $option.css({ "background-color": "#DEDEDE" });  
        }  
      
    </script>

</head>
<body>
    <div class="container_12">
        <div class="grid_12 header-repeat">
            <div id="branding">
                <div class="floatleft">
                    <img src="<%=basePath %>houCss/img/logo.png" alt="Logo" /></div>
                <div class="floatright">
                    <div class="floatleft">
                        <img src="<%=basePath %>houCss/img/img-profile.jpg" alt="Profile Pic" /></div>
                    <div class="floatleft marginleft10">
                        <ul class="inline-ul floatleft">
                            <li>Hello Admin</li>
                            <li><a href="<%=basePath %>manager/tologin">Logout</a></li>
                        </ul>
                        <br />
                        <span class="small grey">Last Login: ${manager.managerlogintime} </span>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
       <div class="grid_12">
            <ul class="nav main">
            	<li class="ic-dashboard"><a href="<%=basePath %>manager/tomain" ><span>首页</span></a> </li>
                <li class="ic-form-style"><a href="<%=basePath %>manager/toruzhi" ><span>人事档案管理</span></a> </li>        
                <li class="ic-charts"><a href="<%=basePath %>manager/tokaoqing" ><span>考勤管理</span></a> </li>  	
                <li class="ic-grid-tables"><a href="<%=basePath %>manager/toxinchou" ><span>薪酬管理</span></a> </li>         
            </ul>
        </div>
        <div class="clear">
        </div>
        <div class="grid_2">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                        <li><a class="menuitem">人事档案管理</a>
                            <ul class="submenu">
                                <li><a href="<%=basePath %>manager/toruzhi">职员入职</a> </li>	
                           		<li><a href="<%=basePath %>manager/touserXinxi">职员信息</a> </li>
                           		<li><a href="<%=basePath %>manager/tolizhi">职员离职</a> </li>
                            </ul>
                        </li>                       
                    </ul>
                </div>
            </div>
        </div>
        <div class="grid_10" style="font-size: 17px;font-family: "宋体"">
            <div class="box round first">
                <h2>职员入职</h2>
                <div class="block">
                	<form method="post"  action="<%=basePath %>manager/adduser" onsubmit="return check()">
	                    <table class="form">
	                        <tr>
	                            <td>
	                                <label> 员工姓名:</label>
	                            </td>
	                            <td>
	                                <input type="text" id="username" class="medium" name="username"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <label>员工身份证</label>
	                            </td>
	                            <td>
	                                <input type="text" id="idCard" name="idCard" class="medium" onblur="checkid()"/>
	                                <span class="error" id="idCarderror"></span>
	                                <span class="success" id="idCardsuccess"></span>
	                            </td>
	                        </tr>
	                         <tr>
	                            <td>
	                                <label>员工银行工资卡</label>
	                            </td>
	                            <td>
	                                <input type="text" id="bankidCard" name="bankidCard" class="medium" onblur="checkbankid()"/>
	                                <span class="error" id="bankidCarderror"></span>
	                                <span class="success" id="bankidCardsuccess"></span>
	                            </td>
	                        </tr>
	                        <tr>
	                         	<td>
                               		 <label>性别</label>
                            	</td>
                           		 <td>
	                                <input type="radio" name="rd1" value="1"/>男
	                                <input type="radio" name="rd1" value="2"/>女
                            	</td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <label>部门职位</label>
	                            </td>
	                            <td>
	                                <select id="select1" name="select1">
	                                    <option value="10">采购部</option>
	                                    <option value="11">市场部</option>
	                                    <option value="12">后勤部</option>
	                                    <option value="13">财务部</option>
	                                    <option value="14">生产部</option>
	                                </select>
	                                &nbsp;&nbsp;&nbsp;&nbsp;
		                            <select id="select2" name="select2" onblur="productid()">
		                                <option value="普通员工">普通员工</option>
		                                <option value="部门经理">部门经理</option>
		                                <option value="组长">组长</option>
		                            </select>
	                           </td>
                        	</tr>
                        	<tr>
	                         	<td>
                               		 <label>员工工号</label>
                            	</td>
                           		 <td>
                             		<input type="text" id="user_id" name="user_id" readonly="readonly" class="medium"/>
                             		<span style="color: red">(* 自动填写)</span>
                            	</td>
	                       </tr>
	                       <tr>
	                         	<td>
                               		 <label>教育背景</label>
                            	</td>
                           		<td>
                             		<select id="select3" name="select3">
	                                    <option value="博士">博士</option>
	                                    <option value="硕士">硕士</option>
	                                    <option value="本科">本科</option>
	                                    <option value="高中">高中</option>
	                                    <option value="初中">初中</option>
	                                </select>
	                            </td>
	                       </tr>
	                       <tr>
	                         	<td>
                               		 <label>手机号码</label>
                            	</td>
                           		<td>
                             		<input type="text" id="user_phone" name="user_phone" class="medium" onblur="checkphone()"/>
                             		<span class="error" id="user_phoneerror"></span>
                             		<span class="success" id="user_phonesuccess"></span>
	                            </td>
	                       </tr>
	                       <tr>
	                       		<td><label>地区</label></td>
	                       		<td>省 份：<select id="selProvince" name="selProvince" onchange="provinceChange();"></select>  
									市  (区)：<select id="selCity" name="selCity"></select>详细地址：<input type="text" class="medium" name="detl" id="detl">
								</td>
	                       </tr>
	                       <tr>
	                        <td>
                               	<label>生日</label>
                            </td>
                           	<td>
                               	<input type="text" id="date-picker" name="date-picker"/>
	                        </td>
	                   </tr>
	                    </table>
	                    </br>
	                    <div class="tools">
    						<center style="font-size: 15px;"><input type="submit" value="确定" style="background:url(<%=basePath %>houCss/img/buttonbg.png) repeat-x;width:96px; height:35px;"/>
   									<input type="reset" value="重置" style="background:url(<%=basePath %>houCss/img/buttonbg.png) repeat-x;width:96px; height:35px;"/>
   									<span class="error" id="subeerror"></span>
   							</center>
   						</div>
   					 </form>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="site_info">
        <p>
            	酒店人事管理系统
        </p>
    </div>
    
</body>
<script type="text/javascript">
	
	function productid() {
		var dpt = jQuery("#select1  option:selected").text();
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '<%=basePath%>manager/autusernumber?userDpt=' + dpt,
			success : function(data) {	
				if (data != "") {
					$("#user_id").val(data);
				}
			}
		});
	}
	
	function  checkid() {
		var idCard = $("#idCard").val();
		if(!(/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/.test(idCard))){ 
			$("#idCardsuccess").html("");
			$("#idCarderror").html("× 身份证格式有误，请重填"); 
		}else {
			$("#idCarderror").html(""); 
			$("#idCardsuccess").html("✔ 身份证格式正确，可以使用");
		} 
	}

	function  checkbankid() {
		var bankidCard = $("#bankidCard").val();
		if(!(/^([1-9]{1})(\d{14}|\d{18})$/.test(bankidCard))){ 
			$("#bankidCardsuccess").html("");
			$("#bankidCarderror").html("× 银行卡位数不正确，请仔细填写"); 
		}else {
			$("#bankidCarderror").html("");
			$("#bankidCardsuccess").html("✔ 银行卡位数正确，可以使用");
		} 
	}
	
	function  checkphone() {
		var user_phone = $("#user_phone").val();
		if(!(/^1[34578]\d{9}$/.test(user_phone))){ 
			$("#user_phonesuccess").html("");
		  	$("#user_phoneerror").html("× 手机号码格式有误，请重填");
		}else {
			$("#user_phoneerror").html("");
			$("#user_phonesuccess").html("✔ 手机号码格式正确，可以使用");
		} 
	}

	function check() {
		var username = $("#username").val();
		var idCard = $("#idCard").val();
		var bankidCard = $("#bankidCard").val();
		var sex = $("input[name='rd1']:checked").val();
		var dpt = jQuery("#select1  option:selected").text();
		var jbn = jQuery("#select2  option:selected").text();
		var usernumber = $("#user_id").val();
		var edu = jQuery("#select3  option:selected").text();
		var user_phone = $("#user_phone").val();
		var selProvince = $("#selProvince").val();
		var selCity = $("#selCity").val();
		var detl = $("#detl").val();
		var date_picker = $("#date-picker").val();
		if (usernumber!=""&&bankidCard!=""&&username!=""&&idCard!=""&&user_phone!=""&&selProvince!=""&&selCity!=""&&detl!=""&&date_picker!="") {
			return true;
		}else {
			$('#subeerror').html("");
			$('#subeerror').html('× 提交的数据不能为空，请仔细检查');
			return false;
		}
		
	}
	
</script>
</html>
