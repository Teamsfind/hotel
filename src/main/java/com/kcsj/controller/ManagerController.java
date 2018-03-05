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
	
}

