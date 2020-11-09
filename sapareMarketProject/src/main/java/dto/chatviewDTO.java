package dto;

import java.sql.Timestamp;

public class chatviewDTO {

	private String memberName, itemName, nickname, itemImagePath, profileImg;
	private int chatRoomId, itemId, isreadcount;
	private Timestamp myenter, myexit, enterTime, exitTime;
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
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
	public Timestamp getMyenter() {
		return myenter;
	}
	public void setMyenter(Timestamp myenter) {
		this.myenter = myenter;
	}
	public Timestamp getMyexit() {
		return myexit;
	}
	public void setMyexit(Timestamp myexit) {
		this.myexit = myexit;
	}
	public int getIsreadcount() {
		return isreadcount;
	}
	public void setIsreadcount(int isreadcount) {
		this.isreadcount = isreadcount;
	}
	public Timestamp getEnterTime() {
		return enterTime;
	}
	public void setEnterTime(Timestamp enterTime) {
		this.enterTime = enterTime;
	}
	public Timestamp getExitTime() {
		return exitTime;
	}
	public void setExitTime(Timestamp exitTime) {
		this.exitTime = exitTime;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getItemImagePath() {
		return itemImagePath;
	}
	public void setItemImagePath(String itemImagePath) {
		this.itemImagePath = itemImagePath;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
} // end class
