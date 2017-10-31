package com.kcsj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.kcsj.dao.applMapper;
import com.kcsj.entity.AttdData;
import com.kcsj.dao.AttdMapper;
import com.kcsj.dao.ManagerMapper;
import com.kcsj.dao.UserMapper;
import com.kcsj.pojo.appl;
import com.kcsj.pojo.Attd;
import com.kcsj.pojo.Attdtable;
import com.kcsj.pojo.Manager;
import com.kcsj.pojo.User;
import com.kcsj.service.ManagerService;


@Service("managerService")
public class ManagerImpl implements ManagerService{
	
	@Resource
	private ManagerMapper managerdao;
	
	@Resource
	private applMapper appldao;
	
	@Resource
	private UserMapper userdao;
	
	@Resource
	private AttdMapper attdao;

	@Override
	public boolean findAllManager(Manager m) {
		
		Manager m1=managerdao.findAllManager(m);
			
			if (m1!=null) {
				
				return true;
				
			}else {
				
				return false;
				
			}
	}

	@Override
	public boolean upLogintime(Manager m) {
		
		int a = managerdao.upLogintime(m);
		
		if (a==0) {
			
			return false;
			
		} else {
			return true;
		}
		
	}

	@Override
	public Manager findManager(Manager m) {
		
		return managerdao.findAllManager(m);
	}

	@Override
	public List<appl> findappl(String text,String type) {
		
		if (text.equals("0")&&type.equals("0")) {
		
			return appldao.findappl2();
		}else if (type.equals("0")) {
			
			return appldao.findappl(text);
		}else if(text.equals("0")&&type.equals("1")){
			
			return appldao.findappl3();
		}else {
			
			return appldao.findappl4(text);
		}
	}

	@Override
	public int agreeappl(String usernumber) {
		
		return appldao.agreeappl(usernumber);
	}

	@Override
	public int refuseappl(String usernumber) {
		
		return appldao.refuseappl(usernumber);
	}

	@Override
	public int remindappl(String usernumber) {
		
		return appldao.remindappl(usernumber);
	}
	
	@Override
	public boolean upphone(Manager m) {
		int t = managerdao.upphone(m);
		
		if (t==1) {
			
			return true;
			
		}
		return false;
	}

	@Override
	public boolean uppassword(Manager m) {
		int t = managerdao.uppassword(m);
		if (t==1) {
			
			return true;
		}
		return false;
	}

	@Override
	public String autousernumber(int m) {
		int dpt = userdao.autousernumber(m)+1;
		if (dpt<10) {
			return "2017"+m+"00"+dpt;
			
		}else if (dpt>=10&&dpt<100) {
			
			return "2017"+m+"0"+dpt;
		}else {
			
			return "2017"+m+dpt;
		}
	}

	@Override
	public boolean insertuser(User u) {
	
		int t = userdao.insertuser(u);
		
		if (t==1) {
			return true;
		}else
			
		return false;
	}

	@Override
	public List<User> selectAlluser(String text) {
		if (text.equals("0")) {
			return userdao.selectAlluser();
		}else {
			switch (text) {
				case "采购部":
					 text = "10";
					break;
				case "市场部":
					 text = "11";
					break;	
				case "后勤部":
					 text = "12";
					break;	
				case "财务部":
					text = "13";
					 break;
				case "生产部":
					text = "14";
					 break;	
			}
			return userdao.selectuser(text);
		}
	
	}

	@Override
	public User selectuserbyusernumber(String usernumber) {
		
		return userdao.selectuserbyusernumber(usernumber);
	}

	@Override
	public boolean deletetuser(String usernumber) {
		int t = userdao.deletetuser(usernumber);
		if (t==1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean upworkjob(User user) {
		int t = userdao.upworkjob(user);
		if (t==1) {
			return true;
		}else
			return false;
	}

	@Override
	public Attdtable finduserday(String usernumber) {
		int  attday = attdao.findattday(usernumber);
		int  vacationday = attdao.findvacationday(usernumber);
		int  travelday = attdao.findtravelday(usernumber);
		
		Attdtable attdtable = new Attdtable();
		attdtable.setAttdDay(attday);
		attdtable.setAttdVactionDay(vacationday);
		attdtable.setAttdTravelDay(travelday);
		return attdtable;
	}

	@Override
	public List<AttdData> findattdayAll() {
		
		return attdao.findattdayAll();
	}

	@Override
	public List<AttdData> findUserAttdayAll(String usernumber) {
		
		return attdao.findUserAttdayAll(usernumber);
	}

	@Override
	public List<AttdData> findUserAttday(String usernumber) {
		
		return attdao.findUserAttday(usernumber);
	}

	@Override
	public List<AttdData> findvacationdayAll() {
		
		return attdao.findvacationdayAll();
	}

	@Override
	public List<AttdData> findUserVacationdayAll(String usernumber) {
		
		return attdao.findUserVacationdayAll(usernumber);
	}

	@Override
	public List<AttdData> findUserVacationday(String usernumber) {
		
		return attdao.findUserVacationday(usernumber);
	}

	@Override
	public List<AttdData> findTraveldayAll() {
		
		return attdao.findTraveldayAll();
	}

	@Override
	public List<AttdData> findUserTravelAll(String usernumber) {
		
		return attdao.findUserTravelAll(usernumber);
	}

	@Override
	public List<AttdData> findUserTravelday(String usernumber) {
		
		return attdao.findUserTravelday(usernumber);
	}

	@Override
	public List<User> selectuserForAnPai() {
		
		return userdao.selectuserForAnPai();
	}

	

}
