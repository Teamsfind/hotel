package com.kcsj.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcsj.pojo.Manager;
import com.kcsj.pojo.Opertion;
import com.kcsj.pojo.User;
import com.kcsj.service.ApplService;
import com.kcsj.service.ManagerService;
import com.kcsj.service.OpertionService;
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
		String msg = null;
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
		 
		 boolean flag = userservice.insertuser(user);
		 
		
		 String opretion_type = "员工新增";
		 Opertion o = new Opertion();
		 o.setManagerName(m.getManagername());
		 o.setManagerId(m.getManagerid());
		 o.setOperatingType(opretion_type);
		 
		 boolean flag2 = opretionservice.inserOpretion(o);
		
		return new ModelAndView("newjsp/ruzhiuser");
	}
	
	/*
	 * 模糊查找所有员工
	 */
	@RequestMapping(value="/toFindAllUserByUidUname")
	@ResponseBody
	public Map<String, Object>  toFindAllUserByUidUname(HttpServletRequest request){
		Map<String, Object> result=new HashMap<String, Object>(); 
		String text = request.getParameter("text");
		
		List list = userservice.FindAllUserByUidUname(text);
		result.put("status", "success");
		result.put("totals", list.size());
		result.put("data", list);
		return result;
	}
	/**
	 * 
	 * 刷新邮件和消息
	 */
	public void Refreshmessage(String login){
		
		session.setAttribute("message", applservice.findAllApplByApp_type1(login));
		session.setAttribute("messagesize", applservice.findAllApplByApp_type1(login).size());
		session.setAttribute("info", applservice.findAllApplByApp_type2(login));
		session.setAttribute("infosize", applservice.findAllApplByApp_type2(login).size());
		session.setAttribute("history", opretionservice.findAllOpertionBymanagerid(login));
		
	}
}

