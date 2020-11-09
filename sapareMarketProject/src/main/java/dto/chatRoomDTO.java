package dto;

import java.util.Date;

public class chatRoomDTO {

	private String memberName,itemMemberName, profileImg, nickname;
	private int chatRoomId, itemId;
	private Date roomDate;
	
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
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public Date getRoomDate() {
		return roomDate;
	}
	public void setRoomDate(Date roomDate) {
		this.roomDate = roomDate;
	}
	public String getItemMemberName() {
		return itemMemberName;
	}
	public void setItemMemberName(String itemMemberName) {
		this.itemMemberName = itemMemberName;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
} // end class
