package dto;

import java.util.Date;

public class memberStatusDTO {

	private String memberName, memberRank;
	private int memberPoint, buyCount, sellCount, memberFlagCnt;
	private char memberPremium, delFlag;
	private Date enrollDate, delDate;
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberRank() {
		return memberRank;
	}
	public void setMemberRank(String memberRank) {
		this.memberRank = memberRank;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public int getBuyCount() {
		return buyCount;
	}
	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	public int getMemberFlagCnt() {
		return memberFlagCnt;
	}
	public void setMemberFlagCnt(int memberFlagCnt) {
		this.memberFlagCnt = memberFlagCnt;
	}
	public char getMemberPremium() {
		return memberPremium;
	}
	public void setMemberPremium(char memberPremium) {
		this.memberPremium = memberPremium;
	}
	public char getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(char delFlag) {
		this.delFlag = delFlag;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public Date getDelDate() {
		return delDate;
	}
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}
	
} // end class
