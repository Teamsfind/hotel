package com.kcsj.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.ApplMapper;
import com.kcsj.dao.AttdMapper;
import com.kcsj.pojo.Appl;
import com.kcsj.pojo.Attd;
import com.kcsj.service.ApplService;


@Service("applService")
public class ApplImpl implements ApplService{
	
	@Resource
	private ApplMapper appldao;
	@Resource
	private AttdMapper attddao;
	
	@Override
	public List<Appl> findAllApplByApp_type1(String managerid) {
		// TODO Auto-generated method stub
		return appldao.findAllApplByApp_type1(managerid);
	}

	@Override
	public List<Appl> findAllApplByApp_type2(String managerid) {
		// TODO Auto-generated method stub
		return appldao.findAllApplByApp_type2(managerid);
	}

	@Override
	public int agreeappl(int usernumber,String managerid) {
		
		Appl appl = new Appl();
		appl.setUserNumber(usernumber);
		appl.setApplManagerid(managerid);
		System.out.println(appl.getUserNumber());
		System.out.println(appl.getApplManagerid());
		//查找申请时间，申请类型
			Appl list = appldao.findAllApplByApp_type11(appl);
			Attd at = new Attd();
			String str = "2018-05-17 17:30:00";  
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
			Date date = null; //初始化date   
			try {  
			    date = sdf.parse(str); //Mon Jan 14 00:00:00 CST 2013
			} catch (ParseException e) {  
			    e.printStackTrace();  
			}  
			
			if (list.getApplType().equals("请假")) {
				
				at.setUserNumber(list.getUserNumber());
				at.setAttdVactionBegintime(list.getApplTime());
				at.setAttdVactionEndtime(date);
				at.setAttdVactionRemark(list.getApplRemark());
				at.setAttdStatus(0);
			}else if(list.getApplType().equals("出差")) {
				
				at.setUserNumber(list.getUserNumber());
				at.setAttdTravelBegintime(list.getApplTime());
				at.setAttdTravelPlace(list.getApplRemark());
				at.setAttdTravelEndtime(date);
				at.setAttdTravelRemark("工作安排");
				at.setAttdStatus(0);
			}else if(list.getApplType().equals("休假")) {
				
				at.setUserNumber(list.getUserNumber());
				at.setAttdVactionBegintime(list.getApplTime());
				at.setAttdVactionRemark(list.getApplRemark());
				at.setAttdVactionEndtime(date);
				at.setAttdStatus(0);
			}
		//添加记录
			attddao.insert(at);
		
		return appldao.agreeappl(usernumber);
	}

	@Override
	public int refuseappl(int usernumber) {
		// TODO Auto-generated method stub
		return appldao.refuseappl(usernumber);
	}

	@Override
	public int UpApplByUid(int uid) {
		
		return appldao.UpApplByUid(uid);
	}

	
	
}
