package com.kcsj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.kcsj.util.MD5;

public class Test {
	public static void main(String[] args) {
//		String msg=MD5.MD5Encode("123456");
//		System.out.println(msg);
		Date date = new Date();
		System.out.println(date);
		String dateStr = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		System.out.println(dateStr);
		String dateStr2 = new SimpleDateFormat("HH").format(date);
		System.out.println(dateStr2);
	}
}
