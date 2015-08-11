package com.example.testapp;


import android.app.Activity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;

public class Welcome extends Activity {
	private boolean isFirstIn = false;
	private static final int Go_Login = 1000;
	private static final int Go_Guide = 1001;
	private static final int TIME = 2000;

	private Handler mHandler = new Handler() {
		@Override
		public void handleMessage(Message msg) {
			switch (msg.what) {
			case Go_Guide:
				goGuide();

				break;
			case Go_Login:
				goLogin();
				break;

			default:
				break;
			}
		};

	};

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.welcome);
		init();
	}
	private void init(){
		SharedPreferences preferences = getSharedPreferences("hah", Context.MODE_PRIVATE);
		isFirstIn = preferences.getBoolean("isFirstIn", true);
		if(!isFirstIn){
			mHandler.sendEmptyMessageDelayed(Go_Login, TIME);
			
		}else{
			mHandler.sendEmptyMessageDelayed(Go_Guide, TIME);
			Editor editor = preferences.edit();
			editor.putBoolean("isFirstIn", false);
			editor.commit();
		}
		 
		
	}
	private void goGuide(){
		Intent intent = new Intent(getApplicationContext(),Guide.class);
		startActivity(intent);
		finish();
		
	}
	private void goLogin(){
		Intent intent = new Intent(getApplicationContext(),Login.class);
		startActivity(intent);
		finish();
	
	}

}
