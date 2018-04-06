package com.kcsj.service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.ApplMapper;
import com.kcsj.dao.TravelcostMapper;
import com.kcsj.dao.UserMapper;
import com.kcsj.entitl.AnPaiUser;
import com.kcsj.entitl.Travelcost2;
import com.kcsj.entitl.TravelcostNew;
import com.kcsj.entitl.UpAppl;
import com.kcsj.entitl.updateUser;
import com.kcsj.pojo.Appl;
import com.kcsj.pojo.Travelcost;
import com.kcsj.pojo.User;
import com.kcsj.service.UserService;


@Service("userService")
public class UserImpl implements UserService{
	
	@Resource
	private UserMapper userdao;
	@Resource
	private ApplMapper appldao;
	@Resource
	private TravelcostMapper traveldao;

	@Override
	public List<User> FindAllUser() {
		
		return userdao.FindAllUser();
	}

	
	@Override
	public String autousernumber(int m) {
		String dpt = String.valueOf(userdao.autousernumber(m)+1) ;
		return dpt;
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
	public String CheckIdCard(String idcard) {
		
		User user = userdao.CheckIdCard(idcard);
		if (user == null) {
			return "0";
		}
		return "1";
	}

	@Override
	public List<updateUser> updatauser() {
		List<User> list = userdao.FindAllUser();
		List<updateUser> list2 = new ArrayList<updateUser>();
		for (User u:list ) {
			updateUser u2 = new updateUser();
			u2.setUserId(u.getUserId());
			u2.setUserNumber(u.getUserNumber());
			if (u.getUserDpt()==10) {
				u2.setUserDpt("采购部");
			}else if (u.getUserDpt()==11) {
				u2.setUserDpt("市场部");
			}else if (u.getUserDpt()==12) {
				u2.setUserDpt("后勤部");
			}else if (u.getUserDpt()==13) {
				u2.setUserDpt("财务部");
			}else{
				u2.setUserDpt("生产部");
			}
			u2.setUserDptJbn(u.getUserDptJbn());
			u2.setUserUsername(u.getUserUsername());
			u2.setUserWorktime(u.getUserWorktime());
			if (u.getUserJobtype()==1) {
				u2.setUserJobtype("实习期");
			}else if(u.getUserJobtype()==2){
				u2.setUserJobtype("试用期");
			}else if(u.getUserJobtype()==3){
				u2.setUserJobtype("正式员工");
			}
			if (u.getUserWorktype()==1) {
				u2.setUserWorktype("上班");
			}else if(u.getUserJobtype()==2){
				u2.setUserWorktype("休假");
			}else if(u.getUserJobtype()==3){
				u2.setUserWorktype("出差");
			}else {
				u2.setUserWorktype("缺勤");
			}
			
			list2.add(u2);
		}
		return list2;
	}

	@Override
	public updateUser updatauserByUser_number(int usernumber) {
		User u= userdao.updatauserByUser_number(usernumber);
		updateUser u2 = new updateUser();
		u2.setUserId(u.getUserId());
		u2.setUserNumber(u.getUserNumber());
		if (u.getUserDpt()==10) {
			u2.setUserDpt("采购部");
		}else if (u.getUserDpt()==11) {
			u2.setUserDpt("市场部");
		}else if (u.getUserDpt()==12) {
			u2.setUserDpt("后勤部");
		}else if (u.getUserDpt()==13) {
			u2.setUserDpt("财务部");
		}else{
			u2.setUserDpt("生产部");
		}
		u2.setUserDptJbn(u.getUserDptJbn());
		u2.setUserUsername(u.getUserUsername());
		u2.setUserWorktime(u.getUserWorktime());
		if (u.getUserJobtype()==1) {
			u2.setUserJobtype("实习期");
		}else if(u.getUserJobtype()==2){
			u2.setUserJobtype("试用期");
		}else {
			u2.setUserJobtype("正式员工");
		}
		return u2;
	}

	@Override
	public int updataUserByUser_number(User u) {
		
		return userdao.updataUserByUser_number(u);
	}

	@Override
	public User lookuserByUid(int uid) {
		
		return userdao.lookuserByUid(uid);
	}

	@Override
	public User LiZhiUserByUid(String uid) {
		
		return userdao.LiZhiUserByUid(uid);
	}

	@Override
	public int SurelizhiUser(String uid) {
		
		return userdao.SurelizhiUser(uid);
	}

	@Override
	public int SurelizhiUserAndUpUser(int user_number) {
		Appl app1 = appldao.findAllApplByusernumber(user_number);
		UpAppl app2 = new UpAppl();
		app2.setUserNumber(app1.getUserNumber());
		
		if (app1.getApplType().equals("请假")) {
			app2.setApplType(2);
		}else if(app1.getApplType().equals("出差")){
			app2.setApplType(3);
		}else if(app1.getApplType().equals("休假")){
			app2.setApplType(2);
		}else if(app1.getApplType().equals("缺勤")){
			app2.setApplType(4);
		}
		
		return userdao.SurelizhiUserAndUpUser(app2);
	}


	@Override
	public List<AnPaiUser> findApplByApp_type1() {
		
		List<Appl> ap = appldao.findApplByApp_type1();
		List<AnPaiUser> listan =  new ArrayList<AnPaiUser>();
		for (Appl Appl : ap) {
			User u =userdao.lookuserByUid(Appl.getUserNumber());
			AnPaiUser u2= new AnPaiUser();
			u2.setRemark(Appl.getApplRemark());
			u2.setUserUsername(u.getUserUsername());
			u2.setUserNumber(u.getUserNumber());
			if (u.getUserDpt()==10) {
				u2.setUserDpt("采购部");
			}else if (u.getUserDpt()==11) {
				u2.setUserDpt("市场部");
			}else if (u.getUserDpt()==12) {
				u2.setUserDpt("后勤部");
			}else if (u.getUserDpt()==13) {
				u2.setUserDpt("财务部");
			}else{
				u2.setUserDpt("生产部");
			}
			u2.setUserDptJbn(u.getUserDptJbn());
			u2.setUserAddress(u.getUserAddress());
			u2.setUserDangerphone(u.getUserDangerphone());
			listan.add(u2);
		}
		return listan;
	}


	@Override
	public List<AnPaiUser> findUserByUser_dpt(String uid) {
		User u = userdao.LiZhiUserByUid(uid);
		List<User> ap = userdao.findUserByUser_dpt(u.getUserDpt());
		List<AnPaiUser> listan =  new ArrayList<AnPaiUser>();
		for (User Appl : ap) {
			AnPaiUser u2= new AnPaiUser();
			u2.setUserUsername(Appl.getUserUsername());
			u2.setUserNumber(Appl.getUserNumber());
			u2.setUserDptJbn(Appl.getUserDptJbn());
			u2.setUserAddress(Appl.getUserAddress());
			u2.setUserDangerphone(Appl.getUserDangerphone());
			listan.add(u2);
		}
		return listan;
	}


	@Override
	public int UpUserWorktypeByUsernumber(int uid) {
		
		return userdao.UpUserWorktypeByUsernumber(uid);
	}


	@Override
	public List<TravelcostNew> FindCountTravelCost() {
		List<TravelcostNew> list2 =new ArrayList<TravelcostNew>();
		List<Travelcost2> list = traveldao.FindCountTravelCost();
		
		for (Travelcost2 travelcost2 : list) {
			TravelcostNew tra = new TravelcostNew();
			tra.setTravelcostCost(travelcost2.getTravelcostCost());
			if (travelcost2.getUserDpt()==10) {
				tra.setUserDpt("采购部");
			}else if (travelcost2.getUserDpt()==11) {
				tra.setUserDpt("市场部");
			}else if (travelcost2.getUserDpt()==12) {
				tra.setUserDpt("后勤部");
			}else if (travelcost2.getUserDpt()==13) {
				tra.setUserDpt("财务部");
			}else{
				tra.setUserDpt("生产部");
			}
			tra.setUserName(travelcost2.getUserName());
			tra.setUserDptJbn(travelcost2.getUserDptJbn());
			tra.setUserNumber(travelcost2.getUserNumber());
			
			tra.setTravelcostType(travelcost2.getTravelcostType());
			
			Date date = travelcost2.getTravelcostTime();
			String dateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
			tra.setTravelcostTime(dateStr);
			list2.add(tra);
		}
		
		return list2;
	}


	@Override
	public int UpTravelCost(int uid, int type) {
		if (type==1) {
			traveldao.UpTravelCost1(uid);
		}else {
			traveldao.UpTravelCost2(uid);
		}
		return 0;
	}


	
	
}
