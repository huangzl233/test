package com.example.mysocketclient;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {
	private EditText editText1,editText2;
	private TextView tView;
	Socket socket;
	BufferedReader bReader;
	BufferedWriter writer;
	
	

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		editText1 = (EditText) findViewById(R.id.et1);
		editText2 = (EditText) findViewById(R.id.et2);
		tView = (TextView) findViewById(R.id.tv);
		findViewById(R.id.connect).setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				connect();
			
				
			}
		});
		findViewById(R.id.send).setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				send();
				
			}
		});
	}
	//---------------------------------------------------------------
	public void connect(){
		new AsyncTask<Void, String, Void>(){

			@Override
			protected Void doInBackground(Void... params) {
				        try {
							socket = new Socket(editText1.getText().toString(), 12345);
							bReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
							writer = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
							publishProgress("@success");
							   String lineString;
						        while((lineString=bReader.readLine())!=null){
						        	publishProgress(lineString);
						        }
						        bReader.close();
						} catch (UnknownHostException e) {
							Toast.makeText(MainActivity.this, "connect failure", Toast.LENGTH_SHORT).show();
							e.printStackTrace();
						} catch (IOException e) {
							Toast.makeText(MainActivity.this, "connect failure", Toast.LENGTH_SHORT).show();
							e.printStackTrace();
						}
				   
				
				
				return null;
			}

			@Override
			protected void onProgressUpdate(String... values) {
				if(values[0].equals("@success")){
				Toast.makeText(MainActivity.this, "connect success", Toast.LENGTH_SHORT).show();
				}
				tView.append("he say:"+values[0]+"\n");
				super.onProgressUpdate(values);
			}
			
			
		}.execute();
	}
		
		
		
	
	public void send(){
		try {
			tView.append("i say:"+editText2.getText().toString()+"\n");
			writer.write(editText2.getText().toString()+"\n");
			writer.flush();
			editText2.setText("");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	

}
