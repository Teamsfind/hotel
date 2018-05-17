package com.kcsj.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcsj.entitl.AnPaiUser;
import com.kcsj.entitl.AttdData;
import com.kcsj.entitl.Award1;
import com.kcsj.entitl.Bumen;
import com.kcsj.entitl.TravelcostNew;
import com.kcsj.entitl.Wage1;
import com.kcsj.entitl.updateUser;
import com.kcsj.pojo.Manager;
import com.kcsj.pojo.Opertion;
import com.kcsj.pojo.Recard;
import com.kcsj.pojo.User;
import com.kcsj.service.ApplService;
import com.kcsj.service.AttdService;
import com.kcsj.service.ManagerService;
import com.kcsj.service.OpertionService;
import com.kcsj.service.RecardService;
import com.kcsj.service.UserService;
import com.kcsj.util.MD5;


@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Resource
	private ManagerService managerservice;
	@Resource
	private UserService userservice;
	@Resource
	private ApplService applservice;
	@Resource
	private OpertionService opretionservice;
	@Resource
	private RecardService recardservice;
	@Resource
	private AttdService attdservice;
	
	public HttpSession session;
	
	
	/*
	 * 登入界面
	 */
	
	@RequestMapping("/tologin")
	public ModelAndView toexit( ){
		return new ModelAndView("newjsp/exit");
	}
	
	/*
	 * 主界面
	 */
	
	@RequestMapping("/tomain")
	public ModelAndView tomain( ){
		return new ModelAndView("newjsp/main");
	}
	
	/*
	 * 登录
	 */
	@RequestMapping("/tochecklogin")
	@ResponseBody
	public int tochecklogin(String login,String pwd,HttpServletRequest request){
		int msg = -1;
		session = request.getSession();
		Manager m = new Manager();
		m.setManagerid(login);
		m.setManagerpassword(MD5.MD5Encode(pwd));
		Manager manager = managerservice.findAllManager(m);
		
		managerservice.UpdateManagerlogintime(manager);
		session.setAttribute("manager", manager);
		Refreshmessage(login);
		if (manager!=null) {
			msg = 1;
		}
		
		return msg;
	}
	
	/*
	 * 主页面
	 */
	@RequestMapping("/toWorkManager")
	public ModelAndView toWorkManager(HttpServletRequest request ){
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		return new ModelAndView("newjsp/daohang");
	}
	
	/*
	 * 同意申请
	 */
	@ResponseBody
	@RequestMapping(value="/sureappl")
	public void sureappl(HttpServletRequest request){	
		int  usernumber = Integer.valueOf(request.getParameter("usernumber"));
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		userservice.SurelizhiUserAndUpUser(usernumber);
		applservice.agreeappl(usernumber,m.getManagerid());
	}
	
	/*
	 * 拒绝申请
	 */
	@ResponseBody
	@RequestMapping(value="/refuseappl")
	public void refuseappl(HttpServletRequest request){	
		int  usernumber = Integer.valueOf(request.getParameter("usernumber"));
		applservice.refuseappl(usernumber);
	}
	
	/*
	 * 员工入职
	 */
	@RequestMapping("/toRuZhiUser")
	public ModelAndView toRuZhiUser(HttpServletRequest request ){
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		return new ModelAndView("newjsp/ruzhiuser");
	}
	
	/*
	 * 自动生成员工编号
	 */
	@ResponseBody
	@RequestMapping(value="/autusernumber")
	public String upPassword(HttpServletRequest request){	
		int userDpt = 0;
		
		String  userDptnamae = request.getParameter("userDpt");
	
		if (userDptnamae.equals("采购部")) {
			userDpt = 10;
		}else if(userDptnamae.equals("市场部")){
			userDpt = 11;
		}else if(userDptnamae.equals("后勤部")){
			userDpt = 12;
		}else if(userDptnamae.equals("财务部")){
			userDpt = 13;
		}else if(userDptnamae.equals("生产部")){
			userDpt = 14;
		}
		String usernumber = userservice.autousernumber(userDpt);
		
		return usernumber;
	}
		
	/*
	 * 确定员工入职
	 */
	@RequestMapping("/toCheckRuZhiUser")
	public ModelAndView toCheckRuZhiUser(HttpServletRequest request ){
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		String username = request.getParameter("username");
		String idcard = request.getParameter("idCard");
		String  bankidcard = request.getParameter("bankidCard");
		int sex = Integer.parseInt(request.getParameter("radio1"));
		int dpt = Integer.valueOf(request.getParameter("select1"));
		String jbn = request.getParameter("select2");
		int usernumber = Integer.valueOf(request.getParameter("user_id"));
		String edu = request.getParameter("select3");
		int jobtype = Integer.parseInt(request.getParameter("select4"));
		Double user_phone = Double.valueOf(request.getParameter("user_phone"));
		String address = request.getParameter("city");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		String dstr = request.getParameter("datebirth");
		String dstr2[] = dstr.split("/");
		String day = dstr2[0];
		String month = dstr2[1];
		String year = dstr2[2];
		String dd = year+"-"+month+"-"+day+" "+"00:00:00";
		 java.util.Date date = null;
		 try {
			 	 date=sdf.parse(dd);
		} catch (ParseException e) {
			
		} 
		 User user = new User();
		 user.setUserUsername(username);
		 user.setUserIdcard(idcard);
		 user.setUserBankcard(bankidcard);
		 user.setUserSex(sex);
		 user.setUserDpt(dpt);
		 user.setUserDptJbn(jbn);
		 user.setUserNumber(usernumber);
		 user.setUserEdu(edu);
		 user.setUserJobtype(jobtype);
		 user.setUserPhone(user_phone);
		 user.setUserAddress(address);
		 user.setUserBirth(date);;
		 
		userservice.insertuser(user);
		 
		
		 String opretion_type = "员工新增";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 o.setUserNumber(usernumber);
		 opretionservice.inserOpretion(o);
		
		return new ModelAndView("newjsp/ruzhiuser");
	}
	
	/*
	 * 员工入职：判断是否有该员工
	 */
	@ResponseBody
	@RequestMapping(value="/CheckIdCard")
	public String CheckIdCard(HttpServletRequest request){	
		
		String  idcard = request.getParameter("idCard");
		
		return userservice.CheckIdCard(idcard);
	}
	
	/*
	 * 员工转正
	 */
	@RequestMapping("/toUpdateUser")
	public ModelAndView  toUpdateUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<updateUser> list = userservice.updatausernot();
		session.setAttribute("updatelist", list);
		
		return new ModelAndView("newjsp/updateuser");
	}
	
	/*
	 * 员工转正:查找单个员工信息
	 */
	@ResponseBody
	@RequestMapping("/toFindUpdateUser")
	public updateUser toFindUpdateUser(HttpServletRequest request ){
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		int usernumber = Integer.valueOf(request.getParameter("user_id"));
		
		return userservice.updatauserByUser_number(usernumber);
	}
	
	/*
	 * 员工转正:确认修改员工信息
	 */
	@ResponseBody
	@RequestMapping("/toSureUpdateUser")
	public updateUser toSureUpdateUser(HttpServletRequest request ){
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		int usernumber = Integer.valueOf(request.getParameter("user_number"));
		
		int jobtype = Integer.valueOf(request.getParameter("user_jobtype"));
		
		String reason = request.getParameter("reason");
		
		//分三步
		//1  修改员工职位状态
			User u = new User();
			u.setUserNumber(usernumber);
			u.setUserJobtype(jobtype);
			userservice.updataUserByUser_number(u);
		//2 增加员工职位改动记录
			Recard re = new Recard();
			re.setRecardManagerid(m.getManagerid());
			re.setRecardReason(reason);
			re.setRecardUsernumber(usernumber);
			 recardservice.inserRecard(re);
		//3 管理员操作留痕
			 String opretion_type = "给员工转正";
			 Opertion o = new Opertion();
			 o.setManagerName(m.getManagername());
			 o.setManagerId(m.getManagerid());
			 o.setOperatingType(opretion_type);
			 o.setUserNumber(usernumber);
			 opretionservice.inserOpretion(o);
			
		return userservice.updatauserByUser_number(usernumber);
	}
	
	
	/*
	 * 职员档案，在职
	 */
	@RequestMapping("/toLookUser")
	public ModelAndView  toLookUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<updateUser> list = userservice.updatauser();
		session.setAttribute("lookuserlist", list);
		
		return new ModelAndView("newjsp/Zlookuser");
	}
	
	/*
	 * 职员档案,离职
	 */
	@RequestMapping("/toLLookUser")
	public ModelAndView  toLLookUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<updateUser> list = userservice.notupdatauser();
		session.setAttribute("lookuserlist", list);
		
		return new ModelAndView("newjsp/Llookuser");
	}
	
	/*
	 * 职员档案:根据员工工号，查找员工相关信息
	 */
	@ResponseBody
	@RequestMapping("/toLookUserByuserId")
	public User  toLookUserByuserId(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<updateUser> list = userservice.updatauser();
		session.setAttribute("lookuserlist", list);
		
		int usernumber = Integer.valueOf(request.getParameter("user_id"));
		
		return userservice.lookuserByUid(usernumber);
	}
	
	/*
	 * 员工离职
	 */
	@RequestMapping("/toDeleteUser")
	public ModelAndView toDeleteUser(HttpServletRequest request ){
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		return new ModelAndView("newjsp/lizhiuser");
	}
	
	/*
	 * 员工离职：判断是否有该员工
	 */
	@ResponseBody
	@RequestMapping(value="/CheckuserByUserNumber")
	public User CheckuserByUserNumber(HttpServletRequest request){	
		User u = new User();
		String  idcard = request.getParameter("idCard");
		
		try {
			u = userservice.LiZhiUserByUid(idcard);
		} catch (Exception e) {
			u=null;
		}
		
		return u;
	}
	
	/*
	 * 员工离职：修改员工职位状态
	 */
	@ResponseBody
	@RequestMapping(value="/toSurelizhiUser")
	public ModelAndView toSurelizhiUser(HttpServletRequest request){	
	
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		String  usernumber = request.getParameter("username");
		//修改员工职位状态
		userservice.SurelizhiUser(usernumber);
		//操作留痕
		String opretion_type = "员工离职";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 
		 User u = new User();
		 u = userservice.LiZhiUserByUid(usernumber);
		 o.setUserNumber(u.getUserNumber());
		 opretionservice.inserOpretion(o);
		 
		 return new ModelAndView("newjsp/lizhiuser");
	}
	
	/*
	 * 考勤数据
	 */
	@RequestMapping("/toKaoQingUser")
	public ModelAndView  toKaoQingUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新考勤表格
		List<AttdData> list = attdservice.findattdayAll();
		
		session.setAttribute("AttdDatalist", list);
		//管理员操作留痕
		 String opretion_type = "查看考勤数据";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 
		 opretionservice.inserOpretion(o);
		return new ModelAndView("newjsp/kaoqinguser");
	}
	
	/*
	 * 考勤数据:查询单个员工的历史考勤
	 */
	@RequestMapping("/toKaoQingUserHistorymore")
	public ModelAndView  toKaoQingUserHistorymore(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		return new ModelAndView("newjsp/morekaoqinguser");
	}
	
	/*
	 * 考勤数据:查询单个员工的历史考勤
	 */
	@RequestMapping("/toKaoQingUserHistory")
	public void  toKaoQingUserHistory(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<AttdData> list = attdservice.findUserAttdayAll(request.getParameter("user_id"));
		session.setAttribute("moreAttdDatalist", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("AttdDatalistname", u.getUserUsername());
	}
	
	/*
	 * 考勤数据:查询单个员工的当月考勤
	 */
	@RequestMapping("/toKaoQingUserHistorydang")
	public void  toKaoQingUserHistoryDang(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<AttdData> list = attdservice.findUserAttdayAllMonthDang(request.getParameter("user_id"));
		session.setAttribute("moreAttdDatalist", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("AttdDatalistname", u.getUserUsername());
	}
	
	/*
	 * 休假数据
	 */
	@RequestMapping("/toXiuJiaUser")
	public ModelAndView  toXiuJiaUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新休假表格
		List<AttdData> list = attdservice.findvacationdayAll();
		//管理员操作留痕
		 String opretion_type = "查看休假数据";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 
		 opretionservice.inserOpretion(o);
		
		session.setAttribute("VacDatalist", list);
		
		return new ModelAndView("newjsp/xiujiauser");
	}
	
	/*
	 * 休假数据:查询单个员工的历史休假
	 */
	@RequestMapping("/toXiuJiaUserHistorymore")
	public ModelAndView  toXiuJiaUserHistorymore(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		return new ModelAndView("newjsp/morexiujiauser");
	}
	
	/*
	 * 休假数据:查询单个员工的休假
	 */
	@RequestMapping("/toXiuJiaUserHistory")
	public void  toXiuJiaUserHistory(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<AttdData> list = attdservice.findUserVacationdayAll(request.getParameter("user_id"));
		session.setAttribute("moreVacDatalist", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("VacDatalistname", u.getUserUsername());
	}
	
	/*
	 * 休假数据:查询单个员工当月的休假
	 */
	@RequestMapping("/toXiuJiaUserHistoryDangdang")
	public void  toXiuJiaUserHistoryDang(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<AttdData> list = attdservice.findUserVacationdayAllMonthDang(request.getParameter("user_id"));
		session.setAttribute("moreVacDatalist", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("VacDatalistname", u.getUserUsername());
	}
	
	/*
	 * 出差数据
	 */
	@RequestMapping("/toChuChaiUser")
	public ModelAndView  toChuChaiUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新休假表格
		List<AttdData> list = attdservice.findTraveldayAll();
		//管理员操作留痕
		 String opretion_type = "查看出差数据";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 
		 opretionservice.inserOpretion(o);
		session.setAttribute("TraDatalist", list);
		
		return new ModelAndView("newjsp/chuchaiuser");
	}
	
	/*
	 * 出差数据:查询单个员工的历史休假
	 */
	@RequestMapping("/toChuChaiUserHistorymore")
	public ModelAndView  toChuChaiUserHistorymore(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		return new ModelAndView("newjsp/morechuchaiuser");
	}
	
	/*
	 * 出差数据:查询单个员工的休假
	 */
	@RequestMapping("/toChuChaiUserHistory")
	public void  toChuChaiUserHistory(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<AttdData> list = attdservice.findUserTravelAll(request.getParameter("user_id"));
		session.setAttribute("moreTraDatalist", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("TraDatalistname", u.getUserUsername());
	}
	
	/*
	 * 出差数据:查询单个员工的休假
	 */
	@RequestMapping("/toChuChaiUserHistorydang")
	public void  toChuChaiUserHistoryDnag(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<AttdData> list = attdservice.findUserTravelAllMonthDang(request.getParameter("user_id"));
		session.setAttribute("moreTraDatalist", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("TraDatalistname", u.getUserUsername());
	}
	
	/*
	 * 人员安排
	 */
	@RequestMapping("/toAnPaiUser")
	public ModelAndView  toAnPaiUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新缺勤表格
		List<AnPaiUser> list = userservice.findApplByApp_type1();
		
		//管理员操作留痕
		 String opretion_type = "人员安排";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 
		opretionservice.inserOpretion(o);
		session.setAttribute("AnPaiDatalist", list);
		
		return new ModelAndView("newjsp/anpaiuser");
	}
	
	/*
	 * 人员安排:查询该部门的其它人员
	 */
	@RequestMapping("/toAnPaiUserHistorymore")
	public ModelAndView  toAnPaiUserHistorymore(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		return new ModelAndView("newjsp/moreanpaiuser");
	}
	
	/*
	 * 人员安排:查询该部门的其他人员
	 */
	@RequestMapping("/toAnPaiUserHistory")
	public void  toAnPaiUserHistory(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新部门表格
		List<AnPaiUser> list = userservice.findUserByUser_dpt(request.getParameter("user_id"));
		session.setAttribute("anpaiuser_id", request.getParameter("user_id"));
		session.setAttribute("moreAnPaiDatalist", list);
		User u = new User();
		try {
			u = userservice.lookuserByUid(Integer.valueOf( request.getParameter("user_id")));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("AnPaiDatalistname", u.getUserDpt());
	}
	
	/*
	 * 人员安排:派遣该部门的其他人员
	 */
	@RequestMapping("/toAnPaiUserHistorypai")
	public void  toAnPaiUserHistorypai(HttpServletRequest request ){
		Manager m = (Manager) session.getAttribute("manager");
		String user_id = (String) session.getAttribute("anpaiuser_id");
		//to 修改appl_jijue
		applservice.UpApplByUid(Integer.valueOf(user_id));
		// to 修改派遣员工的工作状态
		userservice.UpUserWorktypeByUsernumber(Integer.valueOf(user_id));
		//管理员操作留痕
		 String opretion_type = "人员安排派遣";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 o.setUserNumber(Integer.valueOf(user_id));
		opretionservice.inserOpretion(o);
	}
	
	/*
	 * 差旅报销:查询差旅报销未审核的
	 */
	@RequestMapping("/toBaoXiaoUser")
	public ModelAndView  toBaoXiaoUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查询数据
		List<TravelcostNew> list = userservice.FindCountTravelCost();
		//管理员操作留痕
		 String opretion_type = "差旅报销查询";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 opretionservice.inserOpretion(o);
		 
		session.setAttribute("Travelcost", list);
		return new ModelAndView("newjsp/baoxiaouser");
	}
	
	/*
	 * 差旅报销:审核差旅报销
	 */
	@ResponseBody
	@RequestMapping("/toCheckBaoXiaoUser")
	public void  toCheckBaoXiaoUser(HttpServletRequest request ){
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		int uid = Integer.valueOf(request.getParameter("user_id"));
		
		int type = Integer.valueOf(request.getParameter("type"));
		
		//管理员操作留痕
		 String opretion_type = "差旅报销";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 o.setUserNumber(uid);
		 opretionservice.inserOpretion(o);
		
		userservice.UpTravelCost(uid,type);
	}
	
	/*
	 * 员工奖励:查询所有员工的当月的奖励
	 */
	@RequestMapping("/toJiangLiUser")
	public ModelAndView  toJiangLiUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查询数据
		List<Award1> list = userservice.findall();
		//管理员操作留痕
		 String opretion_type = "员工奖励查询";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 opretionservice.inserOpretion(o);
		 
		session.setAttribute("Awardcost", list);
		return new ModelAndView("newjsp/JiangLiuser");
	}
	
	/*
	 * 员工奖励:查询单个员工的历史员工奖励
	 */
	@RequestMapping("/toJiangLiUsermorehistory")
	public ModelAndView  toJiangLiUsermorehistory(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		return new ModelAndView("newjsp/morejiangliuser");
	}
	
	/*
	 * 员工奖励:查询所有员工的当月的奖励
	 */
	@ResponseBody
	@RequestMapping("/toJiangLiUsermore")
	public void  toJiangLiUsermore(HttpServletRequest request ){
		//to 刷新邮件
			session = request.getSession();
			Manager m = (Manager) session.getAttribute("manager");
			Refreshmessage(m.getManagerid());
		//查询数据
		List<Award1> list = userservice.findall2(Integer.valueOf(request.getParameter("user_id")));
		
		//管理员操作留痕
		 String opretion_type = "员工奖励查询:更多历史";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 o.setUserNumber(Integer.valueOf(request.getParameter("user_id")));
		 opretionservice.inserOpretion(o);
		 
		session.setAttribute("Awardcostall", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("Awardcostallname", u.getUserUsername());
		
	}
	
	/*
	 * 薪酬汇总:查询所有员工的当月工资
	 */
	@RequestMapping("/toGeRenUser")
	public ModelAndView  toGeRenUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查询数据
		List<Wage1> list = userservice.findallWage();
		//管理员操作留痕
		 String opretion_type = "员工工资查看";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 opretionservice.inserOpretion(o);
		 
		session.setAttribute("Wagecost", list);
		return new ModelAndView("newjsp/gerenuser");
	}
	
	/*
	 * 薪酬汇总:批量生成当月员工工资
	 */
	@RequestMapping("/toPiliangGeRenUser")
	public ModelAndView  toPiliangGeRenUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//添加数据
		 userservice.InsertWage();
		//管理员操作留痕
		 String opretion_type = "批量生成当月员工工资";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 opretionservice.inserOpretion(o);
		 
		//查询数据
			List<Wage1> list = userservice.findallWage();
			session.setAttribute("Wagecost", list);
			return new ModelAndView("newjsp/gerenuser");
	}
	
	/*
	 * 薪酬汇总:发放工资
	 */
	@ResponseBody
	@RequestMapping("/toFaGongZi")
	public void  toFaGongZi(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//修改工资状态
		userservice.UpdateWage(Integer.valueOf(request.getParameter("user_id")));
		//管理员操作留痕
		 String opretion_type = "给员工发放工资";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 o.setUserNumber(Integer.valueOf(request.getParameter("user_id")));
		 opretionservice.inserOpretion(o);
		 
	}
	
	/*
	 * 薪酬汇总:查看最近半年的历史数据(页面跳转)
	 */
	@RequestMapping("/toZhuanmoreGongZi")
	public ModelAndView  toZhuanmoreGongZi(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		return new ModelAndView("newjsp/moregerenuser"); 
	}
	
	/*
	 * 薪酬汇总:查看最近半年的历史数据
	 */
	@ResponseBody
	@RequestMapping("/tomoreGongZi")
	public void  tomoreGongZi(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查找该员工最近半年工资状态
		List<Wage1> list = userservice.SelectWage(Integer.valueOf(request.getParameter("user_id")));
		session.setAttribute("moreWagecost", list);
		User u = new User();
		try {
			u = userservice.LiZhiUserByUid(request.getParameter("user_id"));
		} catch (Exception e) {
			u=null;
		}
		session.setAttribute("moreWagename", u.getUserUsername());
		//管理员操作留痕
		 String opretion_type = "查看员工最近半年工资状况";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 o.setUserNumber(Integer.valueOf(request.getParameter("user_id")));
		 opretionservice.inserOpretion(o);
		 
	}
	
	/*
	 * 部门薪酬汇总:查询所有部门的当月发放的工资
	 */
	@RequestMapping("/toBuMenUser")
	public ModelAndView  toBuMenUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查询数据
		List<Bumen> list = userservice.findallBumenWage();
		//管理员操作留痕
		 String opretion_type = "部门发放总工资查看";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 opretionservice.inserOpretion(o);
		 
		session.setAttribute("BumenWagecost", list);
		return new ModelAndView("newjsp/bumenuser");
	}
	
	/*
	 * 部门薪酬汇总:查询该部门下的所有员工工资
	 */
	@RequestMapping("/tomoreBuMenUser")
	public void  tomoreBuMenUser(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查询数据
		List<Wage1> list = userservice.findallBumenWageBydpt(Integer.valueOf(request.getParameter("user_dpt")));
		//管理员操作留痕
		 String opretion_type = "部门发放总工资:查看部门成员";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 opretionservice.inserOpretion(o);
		
		session.setAttribute("moreBumenWagecostname", list.get(1).getUserdpt());
		session.setAttribute("moreBumenWagecost", list);
		
	}
	
	/*
	 * 部门薪酬汇总:查询该部门下的所有员工工资(页面跳转)
	 */
	@RequestMapping("/tomoreBuMenUserjsp")
	public ModelAndView  tomoreBuMenUserjsp(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		
		return new ModelAndView("newjsp/morebumenuser");
		
	}
	
	/*
	 * 密码修改(查找身份证是否正确)
	 */
	@ResponseBody
	@RequestMapping("/toCheckManagerIdCard")
	public int  toCheckManagerIdCard(HttpServletRequest request ){
		int i  = -1;
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查找身份证
		Manager manager = managerservice.findAllManager(m);
		
		if (manager.getManageridcard().equals(request.getParameter("idCard"))) {
			i = 1;
		}
		return i;
		
	}
	
	/*
	 * 密码修改(查找密码是否原密码一样)
	 */
	@ResponseBody
	@RequestMapping("/toCheckManagerPassword")
	public int  toCheckManagerPassword(HttpServletRequest request ){
		int i  = -1;
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//查找原密码
		Manager manager = managerservice.findAllManager(m);
		
		if (manager.getManagerpassword().equals(MD5.MD5Encode(request.getParameter("password")))) {
			i = 1;
		}
		return i;
		
	}
	
	/*
	 * 密码修改
	 */
	@ResponseBody
	@RequestMapping("/toUpdateManager")
	public ModelAndView  toUpdateManager(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		//密码修改
		Manager manager = managerservice.findAllManager(m);
		manager.setManagerpassword(MD5.MD5Encode(request.getParameter("newpassword")));
		managerservice.UpdateManagerpassword(manager);
		return new ModelAndView("newjsp/workmanager");
		
	}
	
	/**
	 * 
	 * 刷新邮件和消息
	 */
	public void Refreshmessage(String login){
		session.setMaxInactiveInterval(600);
		session.setAttribute("travelcostcount", userservice.FindCountTravelCost().size());
		session.setAttribute("message", applservice.findAllApplByApp_type1(login));
		session.setAttribute("messagesize", applservice.findAllApplByApp_type1(login).size());
		session.setAttribute("info", applservice.findAllApplByApp_type2(login));
		session.setAttribute("infosize", applservice.findAllApplByApp_type2(login).size());
		session.setAttribute("history", opretionservice.findAllOpertionBymanagerid(login));
		
	}
}

