package com.kcsj.dao;

import com.kcsj.pojo.Manager;

public interface ManagerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Thu Oct 12 12:54:05 CST 2017
     */
    int deleteByPrimaryKey(Integer mid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Thu Oct 12 12:54:05 CST 2017
     */
    int insert(Manager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Thu Oct 12 12:54:05 CST 2017
     */
    int insertSelective(Manager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Thu Oct 12 12:54:05 CST 2017
     */
    Manager selectByPrimaryKey(Integer mid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Thu Oct 12 12:54:05 CST 2017
     */
    int updateByPrimaryKeySelective(Manager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Thu Oct 12 12:54:05 CST 2017
     */
    int updateByPrimaryKey(Manager record);
    
    
    /**
     *管理员登录验证
     */
    public Manager findAllManager(Manager m); 
    
    /**
     *修改管理员登入时间
     */
    public int upLogintime(Manager m); 
    
    /**
     *修改管理员手机号
     */
    public int upphone(Manager m); 
    
    /**
     *修改管理员密码
     */
    public int uppassword(Manager m);
}