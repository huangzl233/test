package com.example.testapp;

import android.app.Activity;
import android.app.Dialog;
import android.content.Intent;

import android.os.Bundle;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;



public class Login extends Activity implements OnClickListener {
	private Button login;
	private View showBottomView,liner3;
	private boolean mshowBottom = false;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.login);
		initView();
	
	}
	private void initView(){
		login = (Button) findViewById(R.id.login);
		login.setOnClickListener(this);
		showBottomView = findViewById(R.id.showmore);
		liner3=findViewById(R.id.liner3);
		showBottomView.setOnClickListener(this);
		
	}
	@Override
	public void onClick(View v) {
		// TODO Auto-generated method stub
		switch (v.getId()) {
		case R.id.login:
			goHome();
			
			break;
		case R.id.showmore:
			showBottom(!mshowBottom);

		default:
			break;
		}
		
	}
	private void goHome(){
		Intent intent = new Intent(getApplicationContext(),MainActivity.class);
		startActivity(intent);
		
	}
	private void showBottom(boolean bshow){
		if (bshow) {
			liner3.setVisibility(View.GONE);
			mshowBottom = true;
			
			
			
		}else {
			liner3.setVisibility(View.VISIBLE);
			mshowBottom = false;
			
			
		}
		
		
	}

}
