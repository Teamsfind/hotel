package com.kcsj.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	public HttpSession session;
	
	@RequestMapping("/toindex")
	public ModelAndView toindex( ){
		return new ModelAndView("newjsp/index.jsp");
	}
	
	@RequestMapping("/totop")
	public ModelAndView totop( ){
		return new ModelAndView("newjsp/top.jsp");
	}
	
	@RequestMapping("/tocenter")
	public ModelAndView tocenter( ){
		return new ModelAndView("newjsp/center.jsp");
	}
	
	@RequestMapping("/todown")
	public ModelAndView todown( ){
		return new ModelAndView("newjsp/down.jsp");
	}
	
}

