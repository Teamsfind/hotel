package com.kcsj.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kcsj.pojo.Manager;
import com.kcsj.service.ManagerService;
import com.kcsj.util.MD5;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Resource
	private ManagerService managerservice;
	
	public HttpSession session;
	
	@RequestMapping("/toindex")
	public ModelAndView toindex( ){
		return new ModelAndView("newjsp/index");
	}
	
	@RequestMapping("/totop")
	public ModelAndView totop( ){
		return new ModelAndView("newjsp/top");
	}
	
	@RequestMapping("/tocenter")
	public ModelAndView tocenter( ){
		return new ModelAndView("newjsp/center");
	}
	
	@RequestMapping("/todown")
	public ModelAndView todown( ){
		return new ModelAndView("newjsp/down");
	}
	
	@RequestMapping("/toleft")
	public ModelAndView toleft( ){
		return new ModelAndView("newjsp/left");
	}
	
	@RequestMapping("/toright")
	public ModelAndView toright( ){
		return new ModelAndView("newjsp/right");
	}
	
	@RequestMapping("/tologin")
	public ModelAndView tologin( ){
		return new ModelAndView("newjsp/login");
	}
	
	@RequestMapping("/toTest")
	public ModelAndView toTest( ){
		return new ModelAndView("newjsp/Test");
	}
	
	@RequestMapping("/tochecklogin")
	@ResponseBody
	public int tochecklogin(String login,String pwd,HttpServletRequest request){
		int msg = -1;
		Manager m = new Manager();
		m.setManagerid(login);
		m.setManagerpassword(MD5.MD5Encode(pwd));
		List<Manager> list = managerservice.findAllManager(m);
		
		if (list!=null && !list.isEmpty()) {
			msg = 1;
		}
		
		return msg;
	}
}

