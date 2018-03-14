package com.kcsj.service;

import java.util.List;

import com.kcsj.pojo.User;

public interface UserService {
	/**
	 * 查询所有员工
	 * @param o
	 * @return
	 */
	public List<User> FindAllUser( );
     
	//模糊查找员工
    public List<User> FindAllUserByUidUname(String  text);
}
