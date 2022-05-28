package com;

import Bean.*;

public class FutureWorkThread extends Thread{
	private int mPrice;
	private String mEmail;
	
	public FutureWorkThread(String email, int price) {
		mEmail = email;
		mPrice = price;
	}

	@Override
	public void run() {
		try {
			sleep(15000);
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
}
