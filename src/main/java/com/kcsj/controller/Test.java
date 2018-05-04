package com.kcsj.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.kcsj.util.MD5;


public class Test {
	public static void main(String[] args) {
		String msg=MD5.MD5Encode("123456");
		System.out.println(msg);
//		Date date = new Date();
//		System.out.println(date);
//		String dateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
//		System.out.println(dateStr);
//		int dateStr22 = Integer.valueOf(new SimpleDateFormat("HH").format(new Date()));
//		int dateStr222 = Integer.valueOf(new SimpleDateFormat("mm").format(new Date()));
//		System.out.println(dateStr22);
//		System.out.println(dateStr222);
//		int year = Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));
//		int month = Integer.valueOf(new SimpleDateFormat("MM").format(new Date()));
////		System.out.println(dateStr2);
//		
//		MonthDay mothdate = new MonthDay();
//		int date = mothdate.getdate(year, month);
//		System.out.println(date);
//		System.out.println(Integer.valueOf(-100));
		
//		int year = Integer.valueOf(new SimpleDateFormat("MM").format(new Date()));//获取月份
//		int month = Integer.valueOf(new SimpleDateFormat("yyyy").format(new Date()));//获取年份
//		MonthDay mothdate = new MonthDay();
//		System.out.println(year);
//		System.out.println(month);
//		System.out.println(mothdate.getdate(year, month));
//		String s = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		
//		System.out.println(dateStr22);
//		System.out.println(dateStr222);
//		BigDecimal bd = new BigDecimal("4.31228199505191615E17");
//		System.out.println(bd.toPlainString());
	}
}
