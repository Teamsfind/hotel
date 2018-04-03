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

	@Override
	public String autousernumber(int m) {
		int dpt = userdao.autousernumber(m)+1;
		if (dpt<10) {
			return "2017"+m+"00"+dpt;
			
		}else if (dpt>=10&&dpt<100) {
			
			return "2017"+m+"0"+dpt;
		}else {
			
			return "2017"+m+dpt;
		}
	}

	@Override
	public boolean insertuser(User u) {
		
		int t = userdao.insertuser(u);
		
		if (t==1) {
			return true;
		}else
			
		return false;
	}
	
	
	
}
