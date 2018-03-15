package com.kcsj.controller;

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
import com.kcsj.pojo.User;
import com.kcsj.service.ApplService;
import com.kcsj.service.ManagerService;
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
	}
}

