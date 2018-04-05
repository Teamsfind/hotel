package com.kcsj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.ApplMapper;
import com.kcsj.pojo.Appl;
import com.kcsj.service.ApplService;


@Service("applService")
public class ApplImpl implements ApplService{
	
	@Resource
	private ApplMapper appldao;

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
	public int agreeappl(int usernumber) {
		// TODO Auto-generated method stub
		return appldao.agreeappl(usernumber);
	}

	@Override
	public int refuseappl(int usernumber) {
		// TODO Auto-generated method stub
		return appldao.refuseappl(usernumber);
	}

	
	
}
