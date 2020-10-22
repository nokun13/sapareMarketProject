package dto;

import java.util.Date;

public class auctionDTO {

	private String memberName, sellerName;
	private int auctionNo, itemId, auctionCallPrice;
	private Date auctionDate;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getAuctionNo() {
		return auctionNo;
	}
	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getAuctionCallPrice() {
		return auctionCallPrice;
	}
	public void setAuctionCallPrice(int auctionCallPrice) {
		this.auctionCallPrice = auctionCallPrice;
	}
	public Date getAuctionDate() {
		return auctionDate;
	}
	public void setAuctionDate(Date auctionDate) {
		this.auctionDate = auctionDate;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	
} // end class