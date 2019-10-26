package com;

import java.util.Calendar;
import java.util.Date;
import Bean.*;

public class FutureWorkThread extends Thread{
	private int mYear, mMonth, mDay, mHour, mMinute, mPrice;
	private String mEmail;
	
	public FutureWorkThread(int year, int month, int day, int hour, int minute, String email, int price) {
		mYear = year;
		mMonth = month;
		mDay = day;
		mHour = hour;
		mMinute = minute;
		mEmail = email;
		mPrice = price;
	}

	@Override
	public void run() {
		try {
			sleep(timeUntil(mYear, mMonth, mDay, mHour, mMinute));
			work();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		interrupt();
	}

	public void work(){
		Shop shop = Shop.getInstance();
		shop.plusPoint(mEmail, mPrice);
	}

	public long timeUntil(int year, int month, int day, int hour, int minute) {
		Calendar calNow = Calendar.getInstance();
		calNow.set(Calendar.YEAR, year);
		calNow.set(Calendar.MONTH, month - 1);
		calNow.set(Calendar.DAY_OF_WEEK, day);
		calNow.set(Calendar.HOUR_OF_DAY, hour);
		calNow.set(Calendar.MINUTE, minute);
		calNow.set(Calendar.SECOND, 0);

		Calendar calUntil = Calendar.getInstance();
		calUntil.set(Calendar.YEAR, year);
		calUntil.set(Calendar.MONTH, month - 1);
		calUntil.set(Calendar.DAY_OF_WEEK, day);
		calUntil.set(Calendar.HOUR_OF_DAY, hour);
		calUntil.set(Calendar.MINUTE, minute + 1);
		calUntil.set(Calendar.SECOND, 0);

		Date until = calUntil.getTime();
		Date now = calNow.getTime();

		long sleep = until.getTime() - now.getTime();

		return sleep;
	}
}
