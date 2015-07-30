package com.example.viewpagerdemo;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;

public class Guide extends Activity{
	private ViewPager vPager;
	private ViewPagerAdapter vPagerAdapter;
	private List<View> views;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.viewpager);
		initViews();
	}
	
	private void initViews(){
		LayoutInflater inflater = LayoutInflater.from(this);
		views = new ArrayList<View>();
		views.add(inflater.inflate(R.layout.one,null));
		views.add(inflater.inflate(R.layout.two,null));
		views.add(inflater.inflate(R.layout.three, null));
		vPagerAdapter = new ViewPagerAdapter(views, this);
		vPager =(ViewPager) findViewById(R.id.vp);
		vPager.setAdapter(vPagerAdapter);
		
		
	}

}
