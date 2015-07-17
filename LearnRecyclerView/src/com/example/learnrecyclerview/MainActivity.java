package com.example.learnrecyclerview;


import android.app.Activity;
import android.database.DataSetObserver;
import android.os.Bundle;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.Menu;
import android.view.MenuItem;

import android.widget.Adapter;
import android.widget.GridLayout;
import android.widget.LinearLayout;

public class MainActivity<ViewHolder> extends Activity {
	
	private RecyclerView rv;
	


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		rv = new RecyclerView(this);
		setContentView(rv);
		rv.setLayoutManager(new GridLayoutManager(this,3));
		rv.setAdapter(new MyAdapter<ViewHolder>());
	}
}
			
		

		
		
