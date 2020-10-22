package dto;

import java.util.Date;

public class chatMsgDTO {

	private String memberName, messageContent, chatImgPath;
	private int messageId, chatRoomId, itemId;
	private char isRead;
	private Date messageDate;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getChatImgPath() {
		return chatImgPath;
	}
	public void setChatImgPath(String chatImgPath) {
		this.chatImgPath = chatImgPath;
	}
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
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
	public char getIsRead() {
		return isRead;
	}
	public void setIsRead(char isRead) {
		this.isRead = isRead;
	}
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	
} // end class