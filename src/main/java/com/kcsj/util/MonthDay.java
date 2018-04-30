package com.kcsj.util;

public class MonthDay {
	public int getdate(int year,int month) {
		
		int  date = 31;;
		
		if (year % 4 == 0 && year % 100 == 0 || year % 400 == 0) {
			
			 		if (month == 4 || month == 6 || month == 9 || month == 11) {
						date = 30;
						
					} else if (month == 2) {
						date = 29;
					}
			} else {
				
				if (month == 4 || month == 6 || month == 9 || month == 11) {
					date = 30;
					
				} else if (month == 2) {
					date = 28;
				}
			}
		return date;
	}
}