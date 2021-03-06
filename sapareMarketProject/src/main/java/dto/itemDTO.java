package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class itemDTO {

	private String orderId, memberName, itemAbout, itemName, itemImagePath, itemType, profileImg, nickname, reviewContent, searchWord;
	private String itemBigCat, itemMidCat, itemSmallCat, itemCity, itemGu, itemDong, memberRank, sellerName;
	private int itemId, itemPrice, itemViewCnt, itemWantCnt, itemFlagCnt, reviewNo, reviewStar, orderPrice;
	private char itemStatus;
	private Date orderDate, itemUploadDate;
	private MultipartFile filepath;
	
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
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
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
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getItemBigCat() {
		return itemBigCat;
	}
	public void setItemBigCat(String itemBigCat) {
		this.itemBigCat = itemBigCat;
	}
	public String getItemMidCat() {
		return itemMidCat;
	}
	public void setItemMidCat(String itemMidCat) {
		this.itemMidCat = itemMidCat;
	}
	public String getItemSmallCat() {
		return itemSmallCat;
	}
	public void setItemSmallCat(String itemSmallCat) {
		this.itemSmallCat = itemSmallCat;
	}
	public String getItemCity() {
		return itemCity;
	}
	public void setItemCity(String itemCity) {
		this.itemCity = itemCity;
	}
	public String getItemGu() {
		return itemGu;
	}
	public void setItemGu(String itemGu) {
		this.itemGu = itemGu;
	}
	public String getItemDong() {
		return itemDong;
	}
	public void setItemDong(String itemDong) {
		this.itemDong = itemDong;
	}
	public String getMemberRank() {
		return memberRank;
	}
	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}
	public MultipartFile getFilepath() {
		return filepath;
	}
	public void setFilepath(MultipartFile filepath) {
		this.filepath = filepath;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public Date getItemUploadDate() {
		return itemUploadDate;
	}
	public void setItemUploadDate(Date itemUploadDate) {
		this.itemUploadDate = itemUploadDate;
	}
	public String getSellerName() {
		return sellerName;
	}
	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}
	
} // end class