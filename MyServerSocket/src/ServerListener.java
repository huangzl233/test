import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.JOptionPane;


public class ServerListener extends Thread {

	@Override
	public void run() {
	
		
		try {
			ServerSocket serverSocket = new ServerSocket(12345);
			while (true) {
				Socket socket =	serverSocket.accept();
				JOptionPane.showMessageDialog(null, "client connected to the port 12345");
				ChatSocket chatSocket = new ChatSocket(socket);
				chatSocket.start();
				ChatManager.getChatManager().add(chatSocket);
				
			}
				
				
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	
	

}
