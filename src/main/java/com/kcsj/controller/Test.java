package com.kcsj.controller;

import com.kcsj.util.MD5;

public class Test {
	public static void main(String[] args) {
		String msg=MD5.MD5Encode("123456");
		System.out.println(msg);
	}
}
