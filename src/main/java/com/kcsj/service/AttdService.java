package com.kcsj.service;

import java.util.List;

import com.kcsj.entitl.AttdData;


public interface AttdService {
	 /**
     * 考勤数据：查找员工的考勤信息(考勤管理，当天)
     */
    List<AttdData> findattdayAll ();
    
    /**
     * 考勤数据：查找单个员工的所有考勤信息(考勤管理，历史)
     */
    List<AttdData> findUserAttdayAll (String usernumber);
}
