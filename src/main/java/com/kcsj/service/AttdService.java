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
   
    /**
     * 考勤数据：查找单个员工的所有考勤信息(考勤管理，当月)
     */
    List<AttdData> findUserAttdayAllMonthDang (String usernumber);
    
    /**
     * 查找员工的休假信息(考勤管理，当天)
     */
    List<AttdData> findvacationdayAll ();
    
    /**
     * 查找单个员工的所有休假信息(考勤管理，历史)
     */
    List<AttdData> findUserVacationdayAll (String usernumber);
    
    /**
     * 查找单个员工的所有休假信息(考勤管理，当月)
     */
    List<AttdData> findUserVacationdayAllMonthDang (String usernumber);
    
    /**
     * 查找员工的出差信息(考勤管理，当天)
     */
    List<AttdData> findTraveldayAll ();
    
    /**
     * 查找单个员工的所有出差信息(考勤管理，历史)
     */
    List<AttdData> findUserTravelAll (String usernumber);
    
    /**
     * 查找单个员工的所有出差信息(考勤管理，当月)
     */
    List<AttdData> findUserTravelAllMonthDang (String usernumber);
}
