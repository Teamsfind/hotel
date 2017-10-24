package com.kcsj.controller;



import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcsj.pojo.appl;
import com.kcsj.entity.AttdData;
import com.kcsj.pojo.Attdtable;
import com.kcsj.pojo.Manager;
import com.kcsj.pojo.Opretion;
import com.kcsj.pojo.User;
import com.kcsj.service.ManagerService;
import com.kcsj.service.OpretionService;
import com.kcsj.util.MD5;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	public HttpSession session;
	
	@Resource
	private ManagerService managerservice;
	
	@Resource
	private OpretionService opretionrservice;
	
	@RequestMapping("/toindex")
	public ModelAndView toindex( ){
		return new ModelAndView("houjsp/index");
	}
	@RequestMapping("/tomain")
	public ModelAndView tomain( ){
		return new ModelAndView("houjsp/main");
	}
	@RequestMapping("/tohistorymain")
	public ModelAndView tohistorymain( ){
		return new ModelAndView("houjsp/historymain");
	}
	@RequestMapping("/toruzhi")
	public ModelAndView toruzhi( ){
		return new ModelAndView("houjsp/ruzhi");
	}
	@RequestMapping("/tokaoqing")
	public ModelAndView tokaoqing( ){
		return new ModelAndView("houjsp/kaoqing");
	}
	@RequestMapping("/toxinchou")
	public ModelAndView toxinchou( ){
		return new ModelAndView("houjsp/xinchou");
	}
	@RequestMapping("/totable")
	public ModelAndView totable(){
		return new ModelAndView("houjsp/table");
	}
	@RequestMapping("/tologin")
	public ModelAndView tologin( ){
		return new ModelAndView("houjsp/login");
	}
	@RequestMapping("/toPerson")
	public ModelAndView toPerson( ){
		return new ModelAndView("houjsp/Person");
	}
	@RequestMapping("/touserXinxi")
	public ModelAndView touserXinxi(){
		return new ModelAndView("houjsp/userXinxi");
	}
	@RequestMapping("/tolizhi")
	public ModelAndView tolizhi( ){
		return new ModelAndView("houjsp/lizhi");
	}
	
	/**
	 	登录验证
	 */
	@ResponseBody
	@RequestMapping(value="/checklogin",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int checklogin(Manager m,HttpServletRequest request){		
		int msg=0;
		session = request.getSession();
		m.setManagerpassword(MD5.MD5Encode(m.getManagerpassword()));
		
		/**
		 * 查找管理员
		 */
		boolean flag = managerservice.findAllManager(m);
		if(flag){
			
			/**
			 * 修改管理员最近登入时间
			 */
			Manager savem = managerservice.findManager(m);
			
			BigDecimal bigDecimal = new BigDecimal(savem.getManagerphone());  
		    
			String phone = bigDecimal.toString();  
		   
			session.setAttribute("manager",savem);
		
			session.setAttribute("phone",phone);
			
			boolean flag2 = managerservice.upLogintime(m);
			if (flag2) {				
				msg = 1;
			}
		}else{
			msg = -1;	
		}
		return msg;
	}
	/**
 		今日消息：查找申请
	 */
	@ResponseBody
	@RequestMapping(value="/findAppl",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public List<appl> findAppl(HttpServletRequest request){
		
		String text = request.getParameter("text");
		
		String type = request.getParameter("type");
		
		if (text.equals("")) {
			
			text="0";
			
		}
		
		List<appl> appllist = managerservice.findappl(text,type);
		return appllist;
	}
	/**
	 	今日消息：同意申请
	 */
	@ResponseBody
	@RequestMapping(value="/agreeAppl",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int agreeAppl(HttpServletRequest request){
		int msg=0;
		
		String usernumber = request.getParameter("usernumber");
		
		
		int t = managerservice.agreeappl(usernumber);
		
		if (t!=0) {
			
			 msg = 1;
			
			return msg;
		}else{
			
			 msg = -1;
					
			return msg;
		}
		
	}
	/**
	 	今日消息：拒绝申请
	 */
	@ResponseBody
	@RequestMapping(value="/refuseAppl",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int refuseAppl(HttpServletRequest request){
		int msg=0;
		
		String usernumber = request.getParameter("usernumber");
		
		int t = managerservice.refuseappl(usernumber);
		
		if (t!=0) {
			
			 msg = 1;
			
			return msg;
		}else{
			
			 msg = -1;
					
			return msg;
		}
	}
	
	/**
		检验旧密码
	 */
	@ResponseBody
	@RequestMapping(value="/checkoldpassword",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int checkoldepassword(HttpServletRequest request){		
		int msg=0;
		
		session = request.getSession();
		
		String oldpassword1 = request.getParameter("managerpassword");
		
		Manager m2 = new Manager();
		
		m2 = (Manager) session.getAttribute("manager");
		
		Manager m = new Manager();
		
		m.setManagerpassword(MD5.MD5Encode(oldpassword1));
		
		m.setManagerid(m2.getManagerid());
		
		boolean flag2 = managerservice.findAllManager(m);
			
		if (flag2) {				
				
				msg = 1;
		}else{
			   msg = -1;
		}
		return msg;
	}
	
	/**
	 	修改手机号码
	 */
	@ResponseBody
	@RequestMapping(value="/upPhone",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int upPhone(Manager m,HttpServletRequest request){		
		int msg=0;
		String  newphone1 = request.getParameter("newphone");
		
		Double newphone2 = Double.valueOf(newphone1);
		
		session = request.getSession();
	
		m = (Manager) session.getAttribute("manager");
		
		Manager m2 = new Manager();
		m2.setManagerid(m.getManagerid());
		m2.setManagerpassword(m.getManagerpassword());
		m2.setManagerphone(newphone2);
		
		boolean flag2 = managerservice.upphone(m2);
		
		Manager savem = managerservice.findManager(m);
		
		BigDecimal bigDecimal = new BigDecimal(savem.getManagerphone());  
	    
		String phone = bigDecimal.toString();  
	   
		session.setAttribute("manager",savem);
		
		session.setAttribute("phone",phone);
		
		if (flag2) {				
				msg = 1;
		}else{
				msg = -1;	
		}
		return msg;
	}
	
	/**
	 	修改密码
	 */
	@ResponseBody
	@RequestMapping(value="/upPassword",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int upPassword(Manager m,HttpServletRequest request){		
		int msg=0;
		
		String  newpassword = request.getParameter("newpassword");
		
		session = request.getSession();
	
		m = (Manager) session.getAttribute("manager");
		
		Manager m2 = new Manager();
		m2.setManagerid(m.getManagerid());
		m2.setManagerpassword(MD5.MD5Encode(newpassword));
		
		boolean flag2 = managerservice.uppassword(m2);
		
		if (flag2) {				
				msg = 1;
		}else{
				msg = -1;	
		}
		return msg;
	}
	
		/**
		 	员工新增
		 */
		@RequestMapping("adduser")
		public ModelAndView adduser(HttpServletRequest request){	
			int msg;
				
			 String username = request.getParameter("username");
			 String idcard = request.getParameter("idCard");
			 String  bankidcard = request.getParameter("bankidCard");
			 int sex = Integer.parseInt(request.getParameter("rd1"));
			 int dpt = Integer.valueOf(request.getParameter("select1"));
			 String jbn = request.getParameter("select2");
			 int usernumber = Integer.valueOf(request.getParameter("user_id"));
			 String edu = request.getParameter("select3");
			 Double user_phone = Double.valueOf(request.getParameter("user_phone"));
			 String selProvince = request.getParameter("selProvince");
			 String selCity = request.getParameter("selCity");
			 String detl = request.getParameter("detl");
			 String address = selProvince+"-"+selCity+"-"+detl;
			 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
			 String dstr = request.getParameter("date-picker");
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
			 user.setUserPhone(user_phone);
			 user.setUserAddress(address);
			 user.setUserBirth(date);;
			 
			 boolean flag = managerservice.insertuser(user);
			 
			 Manager  m =  (Manager) session.getAttribute("manager");
			 String manager_name = m.getManagername();
			 String opretion_type = "员工新增";
			 Opretion o = new Opretion();
			 o.setManagerName(manager_name);
			 o.setOperatingType(opretion_type);
			 
			 boolean flag2 = opretionrservice.inserOpretion(o);
			 if (flag&&flag2) {
				 return new ModelAndView("houjsp/xinchou");
			}else 
				return new ModelAndView("houjsp/ruzhi");
		}
		
		/**
		 	自动生成员工编号
		 */
		@ResponseBody
		@RequestMapping(value="/autusernumber",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
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
			String usernumber = managerservice.autousernumber(userDpt);
			
			return usernumber;
		}
	
		/**
		 	查询所有员工信息
		 */
		@ResponseBody
		@RequestMapping(value="/selectAlluser",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
		public List<User> selectAlluser(HttpServletRequest request){
			String text = request.getParameter("text");
			if (text=="") {
				text = "0";
			}
			return managerservice.selectAlluser(text);
		}
		
		/**
		 	查询员工信息
		 */
		@ResponseBody
		@RequestMapping(value="/selectuser",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
		public User selectuser(HttpServletRequest request){
			String usernumber = request.getParameter("usernumber");
			User user = managerservice.selectuserbyusernumber(usernumber);
			
			session =  request.getSession();
			session.removeAttribute("user");
			try {
				BigDecimal bigDecimal = new BigDecimal(user.getUserPhone());  
				Double userphone = Double.valueOf(bigDecimal.toString());
				user.setUserPhone(userphone);
				
				session.setAttribute("user", user);
			} catch (Exception e) {
				user = null;
			}
			return user;
		}
		
	/**
	 	员工离职
	 */
	@ResponseBody
	@RequestMapping(value="/deletetuser",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int deletetuser(HttpServletRequest request){
		String usernumber = request.getParameter("user_id");
		int msg = 0;
		boolean flag = managerservice.deletetuser(usernumber);
		if (flag) {
			msg = 1;
		}
		return msg;
	}
	
	
	/**
	 	修改员工在职状态
	 */
	@ResponseBody
	@RequestMapping(value="/upworkjob",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int upworkjob(HttpServletRequest request){
		int userworkjob = Integer.parseInt(request.getParameter("userworkjob"));
		int msg = 0;
		User user = (User) session.getAttribute("user");
		user.setUserJobtype(userworkjob);
		boolean flag = managerservice.upworkjob(user);
		if (flag) {
			msg = 1;
		}
		return msg;
	}
	
	/**
	 	查找员工考勤数据
	 */
	@ResponseBody
	@RequestMapping(value="/finduser",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public Attdtable finduser(HttpServletRequest request){
			String usernumber = request.getParameter("usernumber");
			
		return managerservice.finduserday(usernumber);
	}
	
	/**
	 	历史数据，提醒员工再次申请
	 */
	@ResponseBody
	@RequestMapping(value="/toremind",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public int toremind(HttpServletRequest request){
			String usernumber = request.getParameter("usernumber");
			int msg = 0;
			int t = managerservice.remindappl(usernumber);
			
			if (t!=0) {
				
				 msg = 1;
				
				return msg;
			}else{
				
				 msg = -1;
						
				return msg;
			}
	}
	
	/**
	 	考勤管理(今日所有考勤)
	 */
	@ResponseBody
	@RequestMapping(value="/findattdayAll",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public List<AttdData> findattdayAll(HttpServletRequest request){
		
			return managerservice.findattdayAll();
	}
	
	/**
	 	考勤管理(每个员工所有数据所有考勤)
	 */
	@ResponseBody
	@RequestMapping(value="/findUserAttdayAll",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public List<AttdData> findUserAttdayAll(HttpServletRequest request){
			String usernumber = request.getParameter("usernumber");
			
			return managerservice.findUserAttdayAll(usernumber);
	}
	
	/**
	 	考勤管理(每个员工所有数据所有考勤)
	 */
	@ResponseBody
	@RequestMapping(value="/findUserAttday",method=RequestMethod.POST,produces={"application/json;charset=UTF-8"})
	public List<AttdData> findUserAttday(HttpServletRequest request){
			String usernumber = request.getParameter("usernumber");
			
			return managerservice.findUserAttday(usernumber);
	}
}

