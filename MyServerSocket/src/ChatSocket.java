import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.Socket;


public class ChatSocket extends Thread {
	Socket socket;
	public ChatSocket(Socket s){
		this.socket = s;
		
	}
	public void out(String s){
		try {
			socket.getOutputStream().write(s.getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	@Override
	public void run() {
		try {
			InputStream isInputStream =socket.getInputStream();
			InputStreamReader iStreamReader = new InputStreamReader(isInputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(iStreamReader);
			String line ;
			while ((line=bufferedReader.readLine())!=null) {
				ChatManager.getChatManager().publish(this, line);
			}
			bufferedReader.close();
			iStreamReader.close();
			isInputStream.close();
				
				
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}

}
