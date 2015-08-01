package com.example.viewpagerdemo;

import android.R.integer;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.os.Handler;

public class Welcome extends Activity {
	private boolean isFirstIn ;
	private static final int TIME = 2000;
	private static final int Go_Home = 1000;
	private static final int Go_Guide = 1001;
	private Handler mHandler = new Handler() {
		public void handleMessage(android.os.Message msg) {
			switch (msg.what) {
			case Go_Home:
				goHome();
				break;
			case Go_Guide:
				goGuide();

			default:
				break;
			}
		}

		private void goGuide() {
			// TODO Auto-generated method stub
			Intent intent = new Intent(Welcome.this, Guide.class);
			startActivity(intent);
			finish();
			

		}

		private void goHome() {
			// TODO Auto-generated method stub
			Intent intent = new Intent(Welcome.this, MainActivity.class);
			startActivity(intent);
			finish();

		};

	};

	private void init() {
		SharedPreferences preferences = getSharedPreferences("hah",
				MODE_PRIVATE);
		isFirstIn = preferences.getBoolean("isFirstIn", true);
		if (!isFirstIn) {
			mHandler.sendEmptyMessageDelayed(Go_Home, TIME);

		} else {
			mHandler.sendEmptyMessageDelayed(Go_Guide, TIME);
			Editor editor = preferences.edit();
			editor.putBoolean("isFirstIn", false);
			editor.commit();

		}

	}

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.welcome);
		init();

	}

}
