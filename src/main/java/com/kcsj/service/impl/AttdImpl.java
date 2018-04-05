package com.kcsj.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.AttdMapper;
import com.kcsj.entitl.AttdData;
import com.kcsj.entitl.preAttdData;
import com.kcsj.service.AttdService;




@Service("attdService")
public class AttdImpl implements AttdService{

	@Resource
	private  AttdMapper attddao;

	@Override
	public List<AttdData> findattdayAll() {
List<preAttdData> list = attddao .findattdayAll();
		
		List<AttdData> list2 = new ArrayList<AttdData>();
		
		for (preAttdData preattdData : list) {
			
			AttdData pre = new AttdData();
			
			pre.setUsernumber(preattdData.getUsernumber());
			pre.setUsername(preattdData.getUsername());
			
			if (preattdData.getUserdpt()==10) {
				pre.setUserdpt("采购部");
			}else if (preattdData.getUserdpt()==11) {
				pre.setUserdpt("市场部");
			}else if (preattdData.getUserdpt()==12) {
				pre.setUserdpt("后勤部");
			}else if (preattdData.getUserdpt()==13) {
				pre.setUserdpt("财务部");
			}else{
				pre.setUserdpt("生产部");
			}
			pre.setUserdptjob(preattdData.getUserdptjob());
			Date date = preattdData.getAttdBegintime();
			String dateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
			String dateStr1 = new SimpleDateFormat("HH").format(date);
			String dateStr11 = new SimpleDateFormat("mm").format(date);
			pre.setAttdBegintime(dateStr);
			
			Date date2 = preattdData.getAttdEndtime();
			String dateStr2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date2);
			String dateStr22 = new SimpleDateFormat("HH").format(date2);
			String dateStr222 = new SimpleDateFormat("mm").format(date);
			
			if ((Integer.valueOf(dateStr1)*60+(Integer.valueOf(dateStr11)))>570){
				pre.setAtttype("迟到");
			}else {
				if ((Integer.valueOf(dateStr1)*60+(Integer.valueOf(dateStr11)))<1050) {
					pre.setAtttype("早退");
				}else{
					pre.setAtttype("正常");
				}
			}
		
			pre.setAttdEndtime(dateStr2);
			list2.add(pre);
		}
		return list2;
	}

	@Override
	public List<AttdData> findUserAttdayAll(String usernumber) {
		List<preAttdData> list = attddao .findUserAttdayAll(usernumber);
		
		List<AttdData> list2 = new ArrayList<AttdData>();
		
		for (preAttdData preattdData : list) {
			
			AttdData pre = new AttdData();
			
			pre.setUsernumber(preattdData.getUsernumber());
			pre.setUsername(preattdData.getUsername());
			
			if (preattdData.getUserdpt()==10) {
				pre.setUserdpt("采购部");
			}else if (preattdData.getUserdpt()==11) {
				pre.setUserdpt("市场部");
			}else if (preattdData.getUserdpt()==12) {
				pre.setUserdpt("后勤部");
			}else if (preattdData.getUserdpt()==13) {
				pre.setUserdpt("财务部");
			}else{
				pre.setUserdpt("生产部");
			}
			pre.setUserdptjob(preattdData.getUserdptjob());
			Date date = preattdData.getAttdBegintime();
			String dateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
			String dateStr1 = new SimpleDateFormat("HH").format(date);
			String dateStr11 = new SimpleDateFormat("mm").format(date);
			pre.setAttdBegintime(dateStr);
			
			Date date2 = preattdData.getAttdEndtime();
			String dateStr2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date2);
			String dateStr22 = new SimpleDateFormat("HH").format(date2);
			String dateStr222 = new SimpleDateFormat("mm").format(date);
			
			if ((Integer.valueOf(dateStr1)*60+(Integer.valueOf(dateStr11)))>570){
				pre.setAtttype("迟到");
			}else {
				if ((Integer.valueOf(dateStr1)*60+(Integer.valueOf(dateStr11)))<1050) {
					pre.setAtttype("早退");
				}else{
					pre.setAtttype("正常");
				}
			}
			System.out.println(pre.getAtttype());
			pre.setAttdEndtime(dateStr2);
			list2.add(pre);
		}
		return list2;
	}
	
	
}
