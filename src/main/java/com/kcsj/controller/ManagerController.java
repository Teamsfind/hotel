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

import com.kcsj.entitl.AttdData;
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
	 * 查找所有员工
	 */
	@RequestMapping(value="/toindex")
	@ResponseBody
	public ModelAndView toFindAllUser(HttpServletRequest request){
		session = request.getSession();
		session.setAttribute("list", userservice.FindAllUser());
		return new ModelAndView("newjsp/index");
	}
	
	/*
	 * 登入界面
	 */
	
	@RequestMapping("/tologin")
	public ModelAndView tologin( ){
		return new ModelAndView("newjsp/login");
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
		return new ModelAndView("newjsp/workmanager");
	}
	
	/*
	 * 同意申请
	 */
	@ResponseBody
	@RequestMapping(value="/sureappl")
	public void sureappl(HttpServletRequest request){	
		int  usernumber = Integer.valueOf(request.getParameter("usernumber"));
		
		applservice.agreeappl(usernumber);
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
		List<updateUser> list = userservice.updatauser();
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
		
		List<updateUser> list = userservice.updatauser();
		session.setAttribute("updatelist", list);
		
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
		
		List<updateUser> list = userservice.updatauser();
		session.setAttribute("updatelist", list);
		
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
	 * 职员档案
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
		
		return new ModelAndView("newjsp/lookuser");
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
		// to 刷新员工表格
		List<AttdData> list = attdservice.findattdayAll();
		
		session.setAttribute("AttdDatalist", list);
		
		return new ModelAndView("newjsp/kaoqinguser");
	}
	
	/*
	 * 考勤数据:查询单个员工的历史考勤
	 */
	@RequestMapping("/toKaoQingUserHistory")
	public ModelAndView  toKaoQingUserHistory(HttpServletRequest request ){
		//to 刷新邮件
		session = request.getSession();
		Manager m = (Manager) session.getAttribute("manager");
		Refreshmessage(m.getManagerid());
		// to 刷新员工表格
		List<AttdData> list = attdservice.findattdayAll();
		
		session.setAttribute("AttdDatalist", list);
		
		return new ModelAndView("newjsp/kaoqinguser");
	}
	
	/**
	 * 
	 * 刷新邮件和消息
	 */
	public void Refreshmessage(String login){
		session.setMaxInactiveInterval(600);
		session.setAttribute("message", applservice.findAllApplByApp_type1(login));
		session.setAttribute("messagesize", applservice.findAllApplByApp_type1(login).size());
		session.setAttribute("info", applservice.findAllApplByApp_type2(login));
		session.setAttribute("infosize", applservice.findAllApplByApp_type2(login).size());
		session.setAttribute("history", opretionservice.findAllOpertionBymanagerid(login));
		
	}
}

