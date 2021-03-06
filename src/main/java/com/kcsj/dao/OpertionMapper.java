package com.kcsj.dao;

import java.util.List;

import com.kcsj.pojo.Opertion;

public interface OpertionMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table opertion
     *
     * @mbggenerated Thu Apr 05 08:46:31 CST 2018
     */
    int deleteByPrimaryKey(Integer operatingId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table opertion
     *
     * @mbggenerated Thu Apr 05 08:46:31 CST 2018
     */
    int insert(Opertion record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table opertion
     *
     * @mbggenerated Thu Apr 05 08:46:31 CST 2018
     */
    int insertSelective(Opertion record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table opertion
     *
     * @mbggenerated Thu Apr 05 08:46:31 CST 2018
     */
    Opertion selectByPrimaryKey(Integer operatingId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table opertion
     *
     * @mbggenerated Thu Apr 05 08:46:31 CST 2018
     */
    int updateByPrimaryKeySelective(Opertion record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table opertion
     *
     * @mbggenerated Thu Apr 05 08:46:31 CST 2018
     */
    int updateByPrimaryKey(Opertion record);
    
    //根据管理员id查找
  	public List<Opertion> findAllOpertionBymanagerid(String managerid);
}