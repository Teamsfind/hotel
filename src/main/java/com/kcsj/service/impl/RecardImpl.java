package com.kcsj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.RecardMapper;
import com.kcsj.pojo.Recard;
import com.kcsj.service.RecardService;



@Service("recardService")
public class RecardImpl implements RecardService{

	@Resource
	private  RecardMapper recarddao;

	@Override
	public int inserRecard(Recard re) {
		
		return recarddao.insert(re);
	}
	
	

}
