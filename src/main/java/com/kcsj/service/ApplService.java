package com.kcsj.service;

import java.util.List;

import com.kcsj.pojo.Appl;


public interface ApplService {
	
	 //通知查找（appl_type="请假" or 休假  or出差 ）
    List<Appl> findAllApplByApp_type1(String managerid);
    
    //消息查找（appl_type="请示"）
    List<Appl> findAllApplByApp_type2(String managerid);
}
