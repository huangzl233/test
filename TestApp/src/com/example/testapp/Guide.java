package com.example.testapp;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;



public class Guide extends Activity{
	private ViewPager viewPager;
	private ViewPagerAdapter viewPagerAdapter;
	private List<View> views;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.guide);
		initViews();
	}
	private void initViews(){
		 views = new ArrayList<View>(); 
		 LayoutInflater layoutInflater = LayoutInflater.from(getApplicationContext());
		 views.add(layoutInflater.inflate(R.layout.img01, null));
		 views.add(layoutInflater.inflate(R.layout.img02, null));
		 views.add(layoutInflater.inflate(R.layout.img03, null));
		 viewPager = (ViewPager) findViewById(R.id.iv1);
		 viewPagerAdapter = new ViewPagerAdapter(this, views);
		 viewPager.setAdapter(viewPagerAdapter);
		
	}

}
