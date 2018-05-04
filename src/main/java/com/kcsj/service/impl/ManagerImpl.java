package com.kcsj.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.ManagerMapper;
import com.kcsj.pojo.Manager;
import com.kcsj.service.ManagerService;


@Service("managerService")
public class ManagerImpl implements ManagerService{
	
	@Resource
	private ManagerMapper managerdao;

	@Override
	public Manager findAllManager(Manager m) {
		Manager manager = managerdao.selectManagerByUsernamePassword(m);
		return manager;
	}

	@Override
	public int UpdateManagerpassword(Manager m) {
		
		return managerdao.UpdateManagerpassword(m);
	}

	@Override
	public int UpdateManagerlogintime(Manager m) {
		
		return managerdao.UpdateManagerlogintime(m);
	}
	
	
}
