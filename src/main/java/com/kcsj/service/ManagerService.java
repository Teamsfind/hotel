package com.kcsj.service;



import com.kcsj.pojo.Manager;



public interface ManagerService {
	
	 /**
     *管理员登录验证
     */
    public Manager findAllManager(Manager m); 
    
    /**
     *管理员密码修改
     */
    public int UpdateManagerpassword(Manager m); 
    
    /**
     *管理员最近时间登入时间更改
     */
    public int UpdateManagerlogintime(Manager m); 
}
