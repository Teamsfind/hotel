package com.kcsj.service;

import java.util.List;

import com.kcsj.entitl.AnPaiUser;
import com.kcsj.entitl.Award1;
import com.kcsj.entitl.Bumen;
import com.kcsj.entitl.Travelcost2;
import com.kcsj.entitl.TravelcostNew;
import com.kcsj.entitl.Wage1;
import com.kcsj.entitl.updateUser;
import com.kcsj.pojo.User;

public interface UserService {
	/**
	 * 查询所有员工
	 * @param o
	 * @return
	 */
	public List<User> FindAllUser( );
     

    
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
     * 职员转正:查询所有未转正的员工
     */
    public List<updateUser> updatausernot();
    
    /*
     * 职员档案:查询已经离职的职员
     */
    public List<updateUser> notupdatauser();
    
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
    
    /*
     *  :通过usernumber和worktype，修改员工职位状态
     */
    public int SurelizhiUserAndUpUser(int user_number);
    
    /*
     * 人员安排：查找员工请假、休假、出差、缺勤成功的人
     */
    public List<AnPaiUser> findApplByApp_type1();
    
    /*
     * 人员安排：查找该部门的其它人
     */
    public List<AnPaiUser> findUserByUser_dpt(String uid);
    
    /*
     * 人员安排：修改员工的工作状态
     */
    public int UpUserWorktypeByUsernumber(int uid);
    
    /*
     * 职员薪酬汇总：差旅报销：刷新申请以及所有数据
     */
    public List<TravelcostNew> FindCountTravelCost2(int uid);
    
    /*
     * 差旅报销：刷新申请
     */
    public List<TravelcostNew> FindCountTravelCost();
    
    /*
     * 差旅报销：修改状态
     */
    public int UpTravelCost(int uid,int type);
    
    /*
     * 员工奖励
     */
    List<Award1> findall();
    
    /*
     * 员工奖励:单个历史记录
     */
    List<Award1> findall2(int uid);
    
    /*
     * 员工薪酬汇总查询
     */
    List<Wage1> findallWage();
    
    /*
     * 员工薪酬汇总(批量操作)
     */
    int InsertWage();
    
    /*
     * 员工薪酬汇总(发放员工工资)
     */
    int UpdateWage(int uid);
    
    /*
     * 员工薪酬汇总(查看员工最近半年工资状况)
     */
    List<Wage1> SelectWage(int uid);
    
    /*
     * 部门薪酬汇总查询
     */
    List<Bumen> findallBumenWage();
    
    /*
     * 部门薪酬汇总查询
     */
    List<Wage1> findallBumenWageBydpt(int udpt );
}
