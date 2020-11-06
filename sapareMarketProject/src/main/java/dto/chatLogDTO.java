package dto;

import java.util.Date;

public class chatLogDTO {

	private String memberName;
	private int chatRoomId;
	private Date entertime,exittime;
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(int chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public Date getEntertime() {
		return entertime;
	}
	public void setEntertime(Date entertime) {
		this.entertime = entertime;
	}
	public Date getExittime() {
		return exittime;
	}
	public void setExittime(Date exittime) {
		this.exittime = exittime;
	}
	
	
	
} // end class
