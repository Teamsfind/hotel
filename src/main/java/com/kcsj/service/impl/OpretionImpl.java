package com.kcsj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.OpretionMapper;
import com.kcsj.pojo.Opretion;
import com.kcsj.service.OpretionService;



@Service("opretionService")
public class OpretionImpl implements OpretionService{

	@Resource
	private  OpretionMapper opretiondao;
	
	@Override
	public boolean inserOpretion(Opretion o) {
		int m = opretiondao.insert(o);
		
		if (m==1) {
			return true;
		}
			return false;
	}

}
