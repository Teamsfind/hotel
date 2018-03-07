package com.kcsj.dao;

import java.util.List;

import com.kcsj.pojo.Manager;

public interface ManagerMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Tue Mar 06 22:20:19 CST 2018
     */
    int deleteByPrimaryKey(Integer mid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Tue Mar 06 22:20:19 CST 2018
     */
    int insert(Manager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Tue Mar 06 22:20:19 CST 2018
     */
    int insertSelective(Manager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Tue Mar 06 22:20:19 CST 2018
     */
    Manager selectByPrimaryKey(Integer mid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Tue Mar 06 22:20:19 CST 2018
     */
    int updateByPrimaryKeySelective(Manager record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table manager
     *
     * @mbggenerated Tue Mar 06 22:20:19 CST 2018
     */
    int updateByPrimaryKey(Manager record);
    
    /*
     * 根据username和password查找manager所有信息
     */
    List<Manager> selectManagerByUsernamePassword(Manager m);
}