package com.kcsj.service;

import java.util.List;


import com.kcsj.pojo.appl;
import com.kcsj.entity.AttdData;
import com.kcsj.pojo.Attd;
import com.kcsj.pojo.Attdtable;
import com.kcsj.pojo.Manager;
import com.kcsj.pojo.User;

public interface ManagerService {
	
	 /**
     *管理员登录验证
     */
    public boolean findAllManager(Manager m); 
    
    /**
     *修改管理员登入时间
     */
    public boolean upLogintime(Manager m); 
    
    /**
     *查找manager所有信息
     */
    public Manager findManager(Manager m); 
    
    /**
     *查找appl信息
     */
    public List<appl> findappl(String text,String type);
    
    /**
     *同意appl
     */
    public int agreeappl(String usernumber); 
    
    /**
     *拒绝appl
     */
    public int refuseappl(String usernumber); 
    
    /**
     *提醒appl
     */
    public int remindappl(String usernumber); 
    
    /**
     *修改管理员手机号
     */
    public boolean upphone(Manager m); 
    
    /**
     *修改管理员密码
     */
    public boolean uppassword(Manager m); 
    
    /**
     *自动生成员工编号
     */
    public String autousernumber(int m); 
    
    /**
     *员工新增
     */
    public boolean insertuser(User u); 
    
    /**
     *查询所有员工
     */
    public List<User> selectAlluser(String text); 
    
    /**
     *查询单个员工
     */
    public User selectuserbyusernumber(String usernumber); 
    
    
    /**
     *员工离职办理离
     */
    public boolean deletetuser(String usernumber);
    
    /**
     *员工在职状态修改
     */
    public boolean upworkjob(User user); 
    
    /**
     *员工考勤数据
     */
    public Attdtable finduserday(String  usernumber); 
    
    /**
     *查找员工的考勤信息(考勤管理)
     */
    List<AttdData> findattdayAll ();
    
    /**
     * 查找单个员工的所有考勤信息(考勤管理)
     */
    List<AttdData> findUserAttdayAll (String usernumber);
    
    /**
     * 查找单个员工的考勤信息(考勤管理，当天)
     */
    List<AttdData> findUserAttday (String usernumber);
}
