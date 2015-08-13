import java.util.Vector;


public class ChatManager {
	
	private ChatManager(){
		
	}
	private static final ChatManager cm = new ChatManager();
	public static ChatManager getChatManager(){
		return cm;
	}
	Vector<ChatSocket> vector = new Vector<ChatSocket>();
	public void add(ChatSocket e){
		vector.add(e);
		
	}
	public void publish(ChatSocket cs,String outsString){
		for (int i = 0; i < vector.size(); i++) {
			ChatSocket chatSocket = vector.get(i);
			if (!cs.equals(chatSocket)) {
				chatSocket.out(outsString);
				
			}
			
		}
		
	}
	
	

}
