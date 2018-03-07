package com.kcsj.service.impl;

import java.util.List;

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
	public List<Manager> findAllManager(Manager m) {
		List<Manager> list = managerdao.selectManagerByUsernamePassword(m);
		return list;
	}
	
	
}
