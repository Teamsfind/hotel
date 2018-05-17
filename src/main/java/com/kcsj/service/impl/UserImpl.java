package com.kcsj.service.impl;


import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.ApplMapper;
import com.kcsj.dao.AttdMapper;
import com.kcsj.dao.AwardMapper;
import com.kcsj.dao.BasewageMapper;
import com.kcsj.dao.TravelcostMapper;
import com.kcsj.dao.UserMapper;
import com.kcsj.dao.WageMapper;
import com.kcsj.entitl.AnPaiUser;
import com.kcsj.entitl.Award1;
import com.kcsj.entitl.Bumen;
import com.kcsj.entitl.Travelcost2;
import com.kcsj.entitl.TravelcostNew;
import com.kcsj.entitl.UpAppl;
import com.kcsj.entitl.Wage1;
import com.kcsj.entitl.preAttdData;
import com.kcsj.entitl.updateUser;
import com.kcsj.pojo.Appl;
import com.kcsj.pojo.Award;
import com.kcsj.pojo.Basewage;
import com.kcsj.pojo.User;
import com.kcsj.pojo.Wage;
import com.kcsj.service.UserService;
import com.kcsj.util.MonthDay;


@Service("userService")
public class UserImpl implements UserService{
	
	@Resource
	private UserMapper userdao;
	@Resource
	private ApplMapper appldao;
	@Resource
	private TravelcostMapper traveldao;
	@Resource
	private AwardMapper awarddao;
	@Resource
	private WageMapper wagedao;
	@Resource
	private AttdMapper attddao;
	@Resource
	private BasewageMapper basewagedao;
	
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
			System.out.println(u.getUserPhone());
			BigDecimal bd = new BigDecimal(String.valueOf(u.getUserPhone()));
			u2.setUserPhone(bd.toString());
			listan.add(u2);
		}
		return listan;
	}


	@Override
	public List<AnPaiUser> findUserByUser_dpt(String uid) {
		User u = userdao.LiZhiUserByUid(uid);
		List<User> ap = userdao.findUserByUser_dpt(u);
		List<AnPaiUser> listan =  new ArrayList<AnPaiUser>();
		if (ap!=null) {
			for (User Appl : ap) {
				AnPaiUser u2= new AnPaiUser();
				u2.setUserUsername(Appl.getUserUsername());
				u2.setUserNumber(Appl.getUserNumber());
				u2.setUserDptJbn(Appl.getUserDptJbn());
				u2.setUserAddress(Appl.getUserAddress());
				BigDecimal bd = new BigDecimal(String.valueOf(Appl.getUserPhone()));
				u2.setUserPhone(bd.toString());
				u2.setUserDangerphone(Appl.getUserDangerphone());
				listan.add(u2);
			}
		}else {
			List<User> ap1 = userdao.findUserByUser_dpt2();
			for (User Appl : ap1) {
				AnPaiUser u2= new AnPaiUser();
				u2.setUserUsername(Appl.getUserUsername());
				u2.setUserNumber(Appl.getUserNumber());
				u2.setUserDptJbn(Appl.getUserDptJbn());
				u2.setUserAddress(Appl.getUserAddress());
				BigDecimal bd = new BigDecimal(String.valueOf(Appl.getUserPhone()));
				u2.setUserPhone(bd.toString());
				u2.setUserDangerphone(Appl.getUserDangerphone());
				listan.add(u2);
			}
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


	@Override
	public List<Award1> findall() {
		
		List<Award1> list2 = awarddao.findall();
		for (Award1 travelcost2 : list2) {
		
			if (travelcost2.getUserdpt().equals("10")) {
				travelcost2.setUserdpt("采购部");
			}else if (travelcost2.getUserdpt().equals("11")) {
				travelcost2.setUserdpt("市场部");
			}else if (travelcost2.getUserdpt().equals("12")) {
				travelcost2.setUserdpt("后勤部");
			}else if (travelcost2.getUserdpt().equals("13")) {
				travelcost2.setUserdpt("财务部");
			}else{
				travelcost2.setUserdpt("生产部");
			}
			
		}
		return list2;
	}


	@Override
	public List<Award1> findall2(int uid) {
		List<Award1> list2 = awarddao.findall2(uid);
		for (Award1 travelcost2 : list2) {
		
			if (travelcost2.getUserdpt().equals("10")) {
				travelcost2.setUserdpt("采购部");
			}else if (travelcost2.getUserdpt().equals("11")) {
				travelcost2.setUserdpt("市场部");
			}else if (travelcost2.getUserdpt().equals("12")) {
				travelcost2.setUserdpt("后勤部");
			}else if (travelcost2.getUserdpt().equals("13")) {
				travelcost2.setUserdpt("财务部");
			}else{
				travelcost2.setUserdpt("生产部");
			}
			
		}
		return list2;
	}


	@Override
	public List<Wage1> findallWage() {
		List<Wage1> list2 = wagedao.findall();
		for (Wage1 travelcost2 : list2) {
		
			if (travelcost2.getUserdpt().equals("10")) {
				travelcost2.setUserdpt("采购部");
			}else if (travelcost2.getUserdpt().equals("11")) {
				travelcost2.setUserdpt("市场部");
			}else if (travelcost2.getUserdpt().equals("12")) {
				travelcost2.setUserdpt("后勤部");
			}else if (travelcost2.getUserdpt().equals("13")) {
				travelcost2.setUserdpt("财务部");
			}else{
				travelcost2.setUserdpt("生产部");
			}
			
		}
		return list2;
	}


	@Override
	public int InsertWage() {
		int i = 0;
		//查询所有员工usernumber
			List<User> user = userdao.FindAllUser();
			for (User user2 : user) {
				Wage wage = new Wage();
				wage.setUserNumber(user2.getUserNumber());
				//查询考勤天数
					List<preAttdData> preattd = attddao.findUserAttdayAllMonth(user2.getUserNumber());
					wage.setWageAttd(preattd.size());
					
				//查询出差天数
					List<preAttdData> preattd2 = attddao.findUserTravelAllMonth(user2.getUserNumber());
					wage.setWageTravel(preattd2.size());
					
				//查询休假天数
					List<preAttdData> preattd3 = attddao.findUserVacationdayAllMonth(user2.getUserNumber());
					wage.setWageVacation(preattd3.size());
					
				//查询差旅总报销
					Double travlecost;
					try {
						 travlecost = traveldao.selectAllCost(user2.getUserNumber());
						wage.setWageTravelcostall(travlecost);
					} catch (Exception e) {
						travlecost=0.00;
						wage.setWageTravelcostall(travlecost);
					}
					
				//查询员工奖励
					Award award = awarddao.findallAward(user2.getUserNumber());
					if (award!=null) {
						wage.setWageBirth(award.getAwardBirthRedb());
						wage.setWagePersonal(award.getAwardPersonalCost());
						wage.setWageDpt(award.getAwardDptCost());
					}else {
						wage.setWageBirth(0.00);
						wage.setWagePersonal(0.00);
						wage.setWageDpt(0.00);
					}
					
				//查询员工基础工资
					Basewage basewage2 = new Basewage();
					basewage2.setBasewageDptId(user2.getUserDpt());
					basewage2.setBasewageDptJbname(user2.getUserDptJbn());
					
					Basewage basewage = basewagedao.selectByDept(basewage2);
					wage.setWageBasswage(basewage.getBasewageWage());
				//员工总工资汇总
					/*
					 * 满勤+400,没缺勤一天扣100，最多扣500 
					 */
						int year = Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));//获取月份
						int month = Integer.valueOf(new SimpleDateFormat("MM").format(new Date()));//获取年份
						MonthDay mothdate = new MonthDay();
						int date = mothdate.getdate(year, month); 
						int notattd = date-preattd.size()-preattd2.size()-preattd3.size();
						if (notattd<=5&&notattd>0) {
							wage.setWageAttdcost(Double.valueOf(-notattd*100));
						}else if(notattd>5){
							wage.setWageAttdcost(Double.valueOf(-500));
						}else{
							wage.setWageAttdcost(Double.valueOf(400));
						}
						wage.setWageNotattd(notattd);

						Award award22 = awarddao.findallAward(user2.getUserNumber());
						double allwage;
						if (award22!=null) {
							 allwage = basewage.getBasewageWage()+travlecost+award.getAwardBirthRedb()+award.getAwardPersonalCost()+award.getAwardDptCost()+wage.getWageAttdcost();
						}else {
							 allwage = basewage.getBasewageWage()+travlecost+wage.getWageAttdcost();
						}
						wage.setWageAllwage(allwage);
						wage.setWageTobank(0);
						wage.setWageRemark("");
						
					//添加员工记录
						i = wagedao.insert(wage);
			}
		return i;
	}


	@Override
	public int UpdateWage(int uid) {
		
		return wagedao.UpdateWage(uid);
	}


	@Override
	public List<Wage1> SelectWage(int uid) {
		
		return wagedao.SelectWage(uid);
	}


	@Override
	public List<Bumen> findallBumenWage() {
		List<Wage1> list2 = wagedao.findall();
		List<Bumen> listall = new  ArrayList<Bumen>();
		List<Bumen> list10 = new  ArrayList<Bumen>();
		List<Bumen> list11 = new  ArrayList<Bumen>();
		List<Bumen> list12 = new  ArrayList<Bumen>();
		List<Bumen> list13 = new  ArrayList<Bumen>();
		List<Bumen> list14 = new  ArrayList<Bumen>();
		for (Wage1 travelcost2 : list2) {
			Bumen bumen = new Bumen();
			
			if (travelcost2.getUserdpt().equals("10")) {
				bumen.setAcount(1);
				bumen.setDptid(Integer.valueOf(travelcost2.getUserdpt()));
				bumen.setMoney(travelcost2.getWageAllwage());
				bumen.setTime(travelcost2.getWageAllwagetime());
				bumen.setName("采购部");
				list10.add(bumen);
			}else if (travelcost2.getUserdpt().equals("11")) {
				bumen.setAcount(1);
				bumen.setDptid(Integer.valueOf(travelcost2.getUserdpt()));
				bumen.setMoney(travelcost2.getWageAllwage());
				bumen.setTime(travelcost2.getWageAllwagetime());
				bumen.setName("市场部");
				list11.add(bumen);
			}else if (travelcost2.getUserdpt().equals("12")) {
				bumen.setAcount(1);
				bumen.setDptid(Integer.valueOf(travelcost2.getUserdpt()));
				bumen.setMoney(travelcost2.getWageAllwage());
				bumen.setTime(travelcost2.getWageAllwagetime());
				bumen.setName("后勤部");
				list12.add(bumen);
				
			}else if (travelcost2.getUserdpt().equals("13")) {
				bumen.setAcount(1);
				bumen.setDptid(Integer.valueOf(travelcost2.getUserdpt()));
				bumen.setMoney(travelcost2.getWageAllwage());
				bumen.setTime(travelcost2.getWageAllwagetime());
				bumen.setName("财务部");
				list13.add(bumen);
				
			}else{
				bumen.setAcount(1);
				bumen.setDptid(Integer.valueOf(travelcost2.getUserdpt()));
				bumen.setMoney(travelcost2.getWageAllwage());
				bumen.setTime(travelcost2.getWageAllwagetime());
				bumen.setName("生产部");
				list14.add(bumen);
				
			}
		}
		Bumen bumn10 = new Bumen();
		Double i  = 0.0;
		bumn10.setAcount(list10.size());
		bumn10.setDptid(10);
		for (Bumen bumen1010 : list10) {
			i+=bumen1010.getMoney();
			bumn10.setTime(bumen1010.getTime());
		}
		bumn10.setMoney(i);
		bumn10.setName("采购部");
		listall.add(bumn10);
		
		Bumen bumn11 = new Bumen();
		Double j  = 0.0;
		bumn11.setAcount(list11.size());
		bumn11.setDptid(11);
		for (Bumen bumen1010 : list11) {
			j+=bumen1010.getMoney();
			bumn11.setTime(bumen1010.getTime());
		}
		bumn11.setMoney(j);
		bumn11.setName("市场部");
		listall.add(bumn11);
		
		Bumen bumn12 = new Bumen();
		Double k  = 0.0;
		bumn12.setAcount(list12.size());
		bumn12.setDptid(12);
		for (Bumen bumen1010 : list12) {
			k+=bumen1010.getMoney();
			bumn12.setTime(bumen1010.getTime());
		}
		bumn12.setMoney(k);
		bumn12.setName("后勤部");
		listall.add(bumn12);
		
		Bumen bumn13 = new Bumen();
		Double l  = 0.0;
		bumn13.setAcount(list13.size());
		bumn13.setDptid(13);
		for (Bumen bumen1010 : list13) {
			l+=bumen1010.getMoney();
			bumn13.setTime(bumen1010.getTime());
		}
		bumn13.setMoney(l);
		bumn13.setName("财务部");
		listall.add(bumn13);
		
		Bumen bumn14 = new Bumen();
		Double m  = 0.0;
		bumn14.setAcount(list14.size());
		bumn14.setDptid(14);
		for (Bumen bumen1010 : list14) {
			m+=bumen1010.getMoney();
			bumn14.setTime(bumen1010.getTime());
		}
		bumn14.setMoney(m);
		bumn14.setName("生产部");
		listall.add(bumn14);
		
		return listall;
	}


	@Override
	public List<Wage1> findallBumenWageBydpt(int udpt) {
		List<Wage1> list = findallWage();
		List<Wage1> listdpt = new ArrayList<Wage1>();
		String udptname;
		if (udpt==10) {
			udptname="采购部";
		}else if (udpt==11) {
			udptname="市场部";
		}else if (udpt==12) {
			udptname="后勤部";
		}else if (udpt==13) {
			udptname="财务部";
		}else{
			udptname="生产部";
		}
		
		for (Wage1 wage1 : list) {
			if (wage1.getUserdpt().equals(udptname)) {
				listdpt.add(wage1);
			}
		}
		
		return listdpt;
	}


	@Override
	public List<updateUser> updatausernot() {
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
			if (u.getUserJobtype()!=3) {
				list2.add(u2);	
			}
		}
		return list2;
	}


	@Override
	public List<updateUser> notupdatauser() {
		List<User> list = userdao.FindAllUsernot();
		
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
			}else{
				u2.setUserJobtype("已离职");
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
			if (u.getUserJobtype()!=3) {
				list2.add(u2);	
			}
		}
		return list2;
	}

	
	
}
