package com.kcsj.service;

import java.util.List;

import com.kcsj.entitl.updateUser;
import com.kcsj.pojo.User;

public interface UserService {
	/**
	 * 查询所有员工
	 * @param o
	 * @return
	 */
	public List<User> FindAllUser( );
     
	//模糊查找员工
    public List<User> FindAllUserByUidUname(String  text);
    
    /*
     * 自动生成员工编号
     */
    public String autousernumber(int dpt );
    
    /*
     * 员工新增
     */
    public boolean insertuser(User u);
    
    /*
     * 员工新增：判断该员工是否入职
     */
    public String CheckIdCard(String idcard);
    
    /*
     * 职员转正:查询所有员工
     */
    public List<updateUser> updatauser();
    
    /*
     * 职员转正:查询单个员工
     */
    public updateUser updatauserByUser_number(int usernumber);
    
    /*
     * 职员转正:修改员工职位状态
     */
    public int updataUserByUser_number(User u);
    
    /*
     * 职员档案:通过员工工号，查找相关信息
     */
    public User lookuserByUid(int uid);
    
    /*
     * 职员离职:通过员工工号或者员工身份证，查找相关信息
     */
    public User LiZhiUserByUid(String uid);
    
    /*
     * 职员离职:通过usernumber，修改员工职位状态
     */
    public int SurelizhiUser(String uid);
}
