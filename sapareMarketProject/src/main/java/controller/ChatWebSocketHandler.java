package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import dto.chatMsgDTO;
import dto.chatviewDTO;
import service.SapareService;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	public static List<WebSocketSession> list = new ArrayList<WebSocketSession>();
	private HashMap<String, Object> userMap;
	private SapareService service;

	public ChatWebSocketHandler() {
		// TODO Auto-generated constructor stub
		userMap = new HashMap<String, Object>();
	}

	public void setService(SapareService service) {
		this.service = service;
	}

	// 클라이언트가 서버에 연결 되었을떄 호출되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println(session.getId() + " 연결 됨");
		list.add(session);
	}

	// 클라이언트가 서버에 보냈을때 호출되는 메소드
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		String msg = (String) message.getPayload();
		System.out.println(msg);
		String[] mms = msg.split("\\|");
		if (mms[0].equals("login")) {
			System.out.println("로그인");
			userMap.put(mms[1], session);// 세션을 저장
		} else if (mms[0].equals("msg")) {
			System.out.println("메세지");
			chatMsgDTO dto = new chatMsgDTO();// 1 itemid 2 Roomid 3 상대방아이디 4 myid 5 메세지 내용
			dto.setMessageContent(mms[5]);
			dto.setMemberName(mms[4]);
			dto.setChatRoomId(Integer.parseInt(mms[2]));
			dto.setItemId(Integer.parseInt(mms[1]));
			megSave(dto);// msg 저장
			List<chatviewDTO> aa = service.friendProcess(mms[3]);
			List<chatviewDTO> bb = service.LogProcess(mms[3]);
			int memn = 0;
			loop: for (int i = 0; i < aa.size(); i++) {
				for (int j = 0; j < bb.size(); j++)
					if (aa.get(i).getChatRoomId() == bb.get(j).getChatRoomId()) {
						aa.get(i).setIsreadcount(bb.get(j).getIsreadcount());
						if (aa.get(i).getChatRoomId() == Integer.parseInt(mms[2])) {
							memn = i;
							break loop;
						}
						break;
					}
			}

			if (userMap.get(mms[3]) != null) {
				WebSocketMessage<String> sendMsg = new TextMessage(
						mms[2] + ":" + mms[5] + ":" + aa.get(memn).getIsreadcount());
				WebSocketMessage<String> on = new TextMessage("on:on");
				((WebSocketSession) userMap.get(mms[4])).sendMessage(on);
				((WebSocketSession) userMap.get(mms[3])).sendMessage(sendMsg);
			}
		} else if (mms[0].equals("chatroomON")) {
			if (userMap.get(mms[1]) != null) {
				WebSocketMessage<String> on = new TextMessage("on:on");
				((WebSocketSession) userMap.get(mms[1])).sendMessage(on);
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + " 연결 종료");
		String aa = getKey(userMap, session);
		userMap.remove(aa);
		list.remove(session);
	}

	private void megSave(chatMsgDTO dto) {
		System.out.println(dto.getItemId());
		System.out.println(dto.getMemberName());
		service.msgSaveProcess(dto);

	}

	public String getKey(HashMap<String, Object> m, Object value) {
		for (String o : m.keySet()) {
			if (m.get(o).equals(value)) {
				return o;
			}
		}
		return null;
	}

}
