package com.example.viewpagerdemo;

import java.util.ArrayList;
import java.util.List;

import com.example.viewpagerdemo.R.drawable;

import android.R.integer;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;

public class Guide extends Activity implements OnPageChangeListener{
	private ViewPager vPager;
	private ViewPagerAdapter vPagerAdapter;
	private List<View> views;
	private ImageView[] dots;
	private int[] ids={R.id.iv1,R.id.iv2,R.id.iv3};
	private Button btnButton;
	
	
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		setContentView(R.layout.viewpager);
		initViews();
		initDots();
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
		vPager.setOnPageChangeListener(this);
		btnButton = (Button) views.get(2).findViewById(R.id.btn);
		btnButton.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Intent intent = new Intent(Guide.this, MainActivity.class);
				startActivity(intent);
				
			}
		});
		
		
	}
	private void initDots(){
		dots = new ImageView[views.size()];
		for (int i = 0; i < views.size(); i++) {
			dots[i]=(ImageView) findViewById(ids[i]);
			
		}
		
	}

	@Override
	public void onPageScrollStateChanged(int arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onPageScrolled(int arg0, float arg1, int arg2) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onPageSelected(int arg0) {
		// TODO Auto-generated method stub
		for (int i = 0; i < views.size(); i++) {
			if (arg0==i) {
				dots[i].setImageResource(android.R.drawable.ic_input_add);
				
			}else {
				dots[i].setImageResource(android.R.drawable.ic_menu_add);
			}
			
		}
	}

}
