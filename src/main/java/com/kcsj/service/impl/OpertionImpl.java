package com.kcsj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.OpertionMapper;
import com.kcsj.pojo.Opertion;
import com.kcsj.service.OpertionService;



@Service("opretionService")
public class OpertionImpl implements OpertionService{

	@Resource
	private  OpertionMapper opretiondao;
	
	@Override
	public boolean inserOpretion(Opertion o) {
		// TODO Auto-generated method stub
		int i = opretiondao.insert(o);
		if (i==1) {
			return true;
		}
			return false;
	}

	@Override
	public List<Opertion> findAllOpertionBymanagerid(String managerid) {
		// TODO Auto-generated method stub
		return opretiondao.findAllOpertionBymanagerid(managerid);
	}

}
