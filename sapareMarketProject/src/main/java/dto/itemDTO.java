package dto;

import java.util.Date;

public class itemDTO {

	private String memberName, itemAbout, itemName, itemImagePath, itemType;
	private int itemId, itemPrice, itemViewCnt, itemWantCnt, itemFlagCnt;
	private char itemStatus;
	private Date itemUploadDate;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getItemAbout() {
		return itemAbout;
	}
	public void setItemAbout(String itemAbout) {
		this.itemAbout = itemAbout;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemImagePath() {
		return itemImagePath;
	}
	public void setItemImagePath(String itemImagePath) {
		this.itemImagePath = itemImagePath;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemViewCnt() {
		return itemViewCnt;
	}
	public void setItemViewCnt(int itemViewCnt) {
		this.itemViewCnt = itemViewCnt;
	}
	public int getItemWantCnt() {
		return itemWantCnt;
	}
	public void setItemWantCnt(int itemWantCnt) {
		this.itemWantCnt = itemWantCnt;
	}
	public int getItemFlagCnt() {
		return itemFlagCnt;
	}
	public void setItemFlagCnt(int itemFlagCnt) {
		this.itemFlagCnt = itemFlagCnt;
	}
	public char getItemStatus() {
		return itemStatus;
	}
	public void setItemStatus(char itemStatus) {
		this.itemStatus = itemStatus;
	}
	public Date getItemUploadDate() {
		return itemUploadDate;
	}
	public void setItemUploadDate(Date itemUploadDate) {
		this.itemUploadDate = itemUploadDate;
	}
	
} // end class