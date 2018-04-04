package com.kcsj.service;

import java.util.List;

import com.kcsj.pojo.Opertion;

public interface OpertionService {
	/**
	 * 增加操作记录
	 * @param o
	 * @return
	 */
	public int inserOpretion(Opertion o);
    
	//根据管理员id查找
	public List<Opertion> findAllOpertionBymanagerid(String managerid);
}
