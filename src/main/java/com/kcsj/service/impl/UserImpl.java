package com.kcsj.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.UserMapper;
import com.kcsj.pojo.User;
import com.kcsj.service.UserService;


@Service("userService")
public class UserImpl implements UserService{
	
	@Resource
	private UserMapper userdao;

	@Override
	public List<User> FindAllUser() {
		
		return userdao.FindAllUser();
	}

	@Override
	public List<User> FindAllUserByUidUname(String text) {
		
		return userdao.FindAllUserByUidUname(text);
	}

	
	
	
}
