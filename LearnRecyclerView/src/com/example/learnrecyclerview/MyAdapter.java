package com.example.learnrecyclerview;

import android.R;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public  class MyAdapter<ViewHolder> extends RecyclerView.Adapter {
	private CellData[] data= new CellData[]{new CellData("hha","ahhaha"),new CellData("dhhd","dhdh")};


	class ViewHolder extends RecyclerView.ViewHolder{
		private View root;
		private TextView title,content;
		public ViewHolder(View root) {
			super(root);
			// TODO Auto-generated constructor stub
			title =(TextView) root.findViewById(R.id.title);
			content = (TextView) root.findViewById(R.id.content);
			
		}
		public TextView getTitle() {
			return title;
		}
		public TextView getContent() {
			return content;
		}

		
		
		
	}

	@Override
	public int getItemCount() {
		// TODO Auto-generated method stub
		return data.length;
	}

	@Override
	public void onBindViewHolder(
			android.support.v7.widget.RecyclerView.ViewHolder arg0,
			int arg1) {
		// TODO Auto-generated method stub
		ViewHolder vHolder = (com.example.learnrecyclerview.MyAdapter.ViewHolder) arg0;
		CellData cdCellData =data[arg1];
		vHolder.getTitle().setText(cdCellData.title);
		vHolder.getContent().setText(cdCellData.content);
		
		
		
	}

	@Override
	public android.support.v7.widget.RecyclerView.ViewHolder onCreateViewHolder(
			ViewGroup arg0, int arg1) {
		// TODO Auto-generated method stub
		return new ViewHolder(LayoutInflater.from(arg0.getContext()).inflate(R.layout.list_cell, null));
	}
}