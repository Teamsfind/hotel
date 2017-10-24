package com.kcsj.controller;

import java.sql.DriverManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.kcsj.util.MD5;
import com.mysql.jdbc.Connection;

public class Test {
	public static void main(String [] args){
//	  String driverName="com.mysql.jdbc.Driver";
//	  String dbURL="jdbc:mysql://127.0.0.1/hotelkcsj?useUnicode=true&characterEncoding=utf-8";
//	  String userName="dfw";
//	  String userPwd="dfw6854571";
//	  try
//	  {
//	   Class.forName(driverName);
//	   Connection dbConn=(Connection) DriverManager.getConnection(dbURL,userName,userPwd);
//	    System.out.println("连接数据库成功");
//	  }
//	  catch(Exception e)
//	  {
//	   e.printStackTrace();
//	   System.out.print("连接失败");
//	  }    
//		String msg=MD5.MD5Encode("123456");
//		System.out.println(msg);
		
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟 
		 String dstr = "10/02/2017";
		 String dstr2[] = dstr.split("/");
		 String day = dstr2[0];
		 String month = dstr2[1];
		 String year = dstr2[2];
		 String dd = year+"-"+month+"-"+day+" "+"00:00:00";
		 System.out.println(dd);
		 java.util.Date date = null;
		 try {
			 	 date=sdf.parse("2017");
			 	 System.out.println(date);
		} catch (ParseException e) {
			
		} 
	}
}
