package com.kcsj.util;

import java.math.BigDecimal;

public class Todouble {
		public static String togetString(double d){
			BigDecimal bd = new BigDecimal(String.valueOf(d));
			return bd.toPlainString();
		}
}
