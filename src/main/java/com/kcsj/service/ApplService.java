package com.kcsj.service;

import java.util.List;

import com.kcsj.pojo.Appl;


public interface ApplService {
	
	 //通知查找（appl_type="请假" or 休假  or出差 ）
    List<Appl> findAllApplByApp_type1(String managerid);
    
    //消息查找（appl_type="请示"）
    List<Appl> findAllApplByApp_type2(String managerid);
    
    /**
     *同意appl
     */
    public int agreeappl(int usernumber); 
    
    /**
     *拒绝appl
     */
    public int refuseappl(int usernumber); 
    
    /*
     * 人员安排；修改员工appl_jijue
     */
    int UpApplByUid(int uid);
}
