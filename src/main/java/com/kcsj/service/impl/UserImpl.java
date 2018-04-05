package com.kcsj.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kcsj.dao.UserMapper;
import com.kcsj.entitl.updateUser;
import com.kcsj.pojo.User;
import com.kcsj.service.UserService;


@Service("userService")
public class UserImpl implements UserService{
	
	@Resource
	private UserMapper userdao;

	@Override
	public List<User> FindAllUser() {
		
		return userdao.FindAllUser();
	}

	@Override
	public List<User> FindAllUserByUidUname(String text) {
		
		return userdao.FindAllUserByUidUname(text);
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
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return userdao.lookuserByUid(uid);
	}

	@Override
	public User LiZhiUserByUid(String uid) {
		// TODO Auto-generated method stub
		return userdao.LiZhiUserByUid(uid);
	}

	@Override
	public int SurelizhiUser(String uid) {
		// TODO Auto-generated method stub
		return userdao.SurelizhiUser(uid);
	}
	
	
	
}
