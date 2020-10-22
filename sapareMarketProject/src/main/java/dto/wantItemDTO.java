package dto;

public class wantItemDTO {

	private String memberName, sellerName;
	private int wantItemId, itemId;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getWantItemId() {
		return wantItemId;
	}
	public void setWantItemId(int wantItemId) {
		this.wantItemId = wantItemId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	
} // end class