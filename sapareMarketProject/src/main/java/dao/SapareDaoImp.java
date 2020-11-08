package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import dto.boardDTO;
import dto.chatMsgDTO;
import dto.chatRoomDTO;
import dto.chatviewDTO;
import dto.itemCategoryDTO;
import dto.itemDTO;
import dto.itemFlagDTO;
import dto.memberDTO;
import dto.memberFlagDTO;
import dto.memberStatusDTO;
import dto.orderDTO;
import dto.questionDTO;
import dto.reviewDTO;

public class SapareDaoImp implements SapareDAO{

	private SqlSessionTemplate sqlSession;
	
	public SapareDaoImp() {
		
	} // end sapareDAOImp()

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 김녹훈 start //////////////////////////////////////////
	
		// 회원정보 리턴
	@Override
	public memberDTO memberInfoMethod(memberDTO dto) {
		return sqlSession.selectOne("member.info", dto);
	}
	@Override
	public memberStatusDTO memberStatInfoMethod(memberDTO dto) {
		return sqlSession.selectOne("memberStatus.sInfo", dto);
	}
		
		// 회원이 구매한 상품 리턴
	@Override
	public List<orderDTO> buyInfoMethod(memberDTO dto) {
		return sqlSession.selectList("order.get", dto);
	}
		// 회원이 판매한 상품 리턴
	@Override
	public List<itemDTO> sellInfoMethod(memberDTO dto) {
		return sqlSession.selectList("item.get", dto);
	}
	
		// 닉네임 중복 체크
	@Override
	public int checkNicknameMethod(memberDTO dto) {
		return sqlSession.selectOne("member.checkNick", dto);
	}
	
		// 닉네임 변경
	@Override
	public void changeNicknameMethod(memberDTO dto) {
		sqlSession.update("member.changeNick", dto);
	}
	
		// 소개글 변경
	@Override
	public void changeAboutMethod(memberDTO dto) {
		sqlSession.update("member.changeAbout", dto);
	}
	
		// 프로필 사진 변경
	@Override
	public void changeProfileImgMethod(memberDTO dto) {
		sqlSession.update("member.changeProfileImg", dto);
	}
	
		// 비밀번호 변경
	@Override
	public void changePasswordMethod(memberDTO dto) {
		sqlSession.update("member.changePassword", dto);
	}
	
		// 찜 목록 가져오기
	@Override
	public List<itemDTO> wantItemMethod(memberDTO dto) {
		return sqlSession.selectList("item.wantItem", dto);
	}
	
		// 받은 후기 가져오기
	@Override
	public List<itemDTO> receivedReviewMethod(memberDTO dto) {
		return sqlSession.selectList("review.receivedReview", dto);
	}
		// 작성한 후기 가져오기
	@Override
	public List<itemDTO> sentReviewMethod(memberDTO dto) {
		return sqlSession.selectList("review.sentReview", dto);
	}
	
		// 판매중인 상품만 가져오기
	@Override
	public List<itemDTO> sellingOnlyMethod(memberDTO dto) {
		return sqlSession.selectList("item.sellingOnly", dto);
	}
		// 판매완료인 상품만 가져오기
	@Override
	public List<itemDTO> soldOnlyMethod(memberDTO dto) {
		return sqlSession.selectList("item.soldOnly", dto);
	}
	
		// 찜 많은 상품순
	@Override
	public List<itemDTO> wantNumMethod(memberDTO dto) {
		return sqlSession.selectList("item.wantNumItem", dto);
	}
		// 찜 저가순
	@Override
	public List<itemDTO> wantPriceMethod(memberDTO dto) {
		return sqlSession.selectList("item.wantPriceItem", dto);
	}
	
		// 판매 지난 주까지
	@Override
	public List<itemDTO> sellWeekMethod(memberDTO dto) {
		return sqlSession.selectList("item.getWeek", dto);
	}
		// 판매 지난 달까지
	@Override
	public List<itemDTO> sellMonthMethod(memberDTO dto) {
		return sqlSession.selectList("item.getMonth", dto);
	}
		// 판매 지난 6개월까지
	@Override
	public List<itemDTO> sellSixMonthsMethod(memberDTO dto) {
		return sqlSession.selectList("item.getSixMonths", dto);
	}
	
		// 구매 지난 주까지
	@Override
	public List<itemDTO> buyWeekMethod(memberDTO dto) {
		return sqlSession.selectList("order.getWeek", dto);
	}
		// 구매 지난 달까지
	@Override
	public List<itemDTO> buyMonthMethod(memberDTO dto) {
		return sqlSession.selectList("order.getMonth", dto);
	}
		// 구매 지난 6개월까지
	@Override
	public List<itemDTO> buySixMonthsMethod(memberDTO dto) {
		return sqlSession.selectList("order.getSixMonths", dto);
	}
	
		// 후기 작성 후
	@Override
	public void submitReviewMethod(reviewDTO dto) {
		sqlSession.insert("review.submitReview", dto);
	}
	
		// 판매상품 검색
	@Override
	public List<itemDTO> sellSearchMethod(memberDTO dto) {
		return sqlSession.selectList("item.sellSearch", dto);
	}
		// 구매상품 검색
	@Override
	public List<orderDTO> buySearchMethod(memberDTO dto) {
		return sqlSession.selectList("order.buySearch", dto);
	}
	
		// 찜 목록에서 제거
	@Override
	public void removeWantMethod(memberDTO dto) {
		sqlSession.delete("wantItem.removeWant", dto);
	}
		// 찜 갯수 더하기
	@Override
	public void addWantCntMethod(memberDTO dto) {
		sqlSession.update("item.addWantCnt", dto);
	}
		// 찜 갯수 빼기
	@Override
	public void subtWantCntMethod(memberDTO dto) {
		sqlSession.update("item.subtWantCnt", dto);
	}
	
		// 전화번호 중복체크
	@Override
	public int checkPhoneNumMethod(memberDTO dto) {
		return sqlSession.selectOne("member.checkPhoneNum", dto);
	}
		// 전화번호 변경
	@Override
	public void changePhoneNumMethod(memberDTO dto) {
		sqlSession.update("member.changePhoneNum", dto);
	}
	
		// 비밀번호 체크
	@Override
	public memberDTO checkPasswordMethod(memberDTO dto) {
		return sqlSession.selectOne("member.checkPassword", dto);
	}
		// 회원 탈퇴
	@Override
	public void cancelMemberMethod(memberDTO dto) {
		sqlSession.update("memberStatus.cancelMember", dto);
	}
	
		// 회원 중복 아이디 체크
	@Override
	public int idCheckMethod(memberDTO dto) {
		return sqlSession.selectOne("member.idCheck", dto);
	}
	
		// 회원가입 회원 정보
	@Override
	public void signupStatusMethod(memberDTO dto) {
		sqlSession.insert("memberStatus.signupstatus", dto);
	}
	
		// 신고 카운트 +1
	@Override
	public void plusItemFlagMethod(itemFlagDTO dto) {
		sqlSession.update("itemFlag.plusItemFlag", dto);
	}
	
		// 회원 신고
	@Override
	public void memberFlagInsertMethod(memberFlagDTO dto) {
		sqlSession.insert("memberFlag.memberFlagInsert", dto);
	}
		// 회원 신고 카운트 +1
	@Override
	public void plusMemberFlagMethod(memberFlagDTO dto) {
		sqlSession.update("memberFlag.plusMemberFlag", dto);
	}
	
		// 최근 찜 3개
	@Override
	public List<itemDTO> wantItemMiniMethod(memberDTO dto) {
		return sqlSession.selectList("item.wantItemMini", dto);
	}
	// 김녹훈 end //////////////////////////////////////////
	
	
	
	// 김소정 start /////////////////////////////////////////

	@Override
	public void readCount(int num) {
		sqlSession.update("board.readCount",num);
		
	}

	@Override
	public boardDTO content(int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.content",num);
	}

	@Override
	public void save(boardDTO dto) {
		sqlSession.insert("board.save",dto);
		
	}

	@Override
	public boardDTO updateNum(int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.content",num);
	}

	@Override
	public void update(boardDTO dto) {
		 sqlSession.update("board.upt",dto);
		
	}

	@Override
	public void delete(int num) {
		sqlSession.delete("board.del",num);
		
	}

	@Override
	public List<boardDTO> list() {
		
		return sqlSession.selectList("board.boardSelect");
	}

	@Override
	public boardDTO category(boardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.category",dto);
	}

	@Override
	public List<boardDTO> faqlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardSelectfaq");
	}

	@Override
	public List<itemDTO> itemlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("item.itemSelect");
	}

	@Override
	public List<questionDTO> questionlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("question.questionSelect");
	}

	@Override
	public void postq(questionDTO dto) {
		sqlSession.insert("question.questioninsert", dto);
		
	}

	@Override
	public List<memberDTO> memberlist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.memberSelect");
	}

	@Override
	public void signup(memberDTO dto) {
		// TODO Auto-generated method stub
		sqlSession.insert("member.signup", dto);
	}

	@Override
	public boolean loginCheck(memberDTO dto) {
		
		return (sqlSession.selectOne("member.loginCheck", dto) == null) ? false : true;
	}

	@Override
	public memberDTO viewMember(memberDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.viewMember",dto);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public memberDTO infoByIdMethod(memberDTO dto) {
		return sqlSession.selectOne("member.infoById", dto);
	}
	@Override
	public memberStatusDTO cancelCheckMethod(memberDTO dto) {
		return sqlSession.selectOne("member.cancelCheck", dto);
	}
	@Override
	public int flagCheckMethod(memberDTO dto) {
		return sqlSession.selectOne("member.flagCheck", dto);
	}
	
	// 김소정 end ///////////////////////////////////////////
	
	
	
	
	// 오용준 start //////////////////////////////////////////
	//상품아이템(상품가격 소개 조회수 상품명 상품이미지 상품등록날짜 상품타입)
	@Override
	public itemDTO itemcontent(int itemId) {
		return sqlSession.selectOne("item.itemView", itemId);
	}
	
	//상품 아이템의 카테고리 (상품분류 및 상품위치분류)
	@Override
	public itemCategoryDTO itemCatContent(int itemId) {
		return sqlSession.selectOne("item.itemCat", itemId);
	}
	
	//회원 닉네임 회원프로필사진
	@Override
	public memberDTO itemMemberContent(int itemId) {
		return sqlSession.selectOne("member.itemMember", itemId);
	}
	
	//회원 등급
	@Override
	public memberStatusDTO itemMemberStatContent(int itemId) {
		return sqlSession.selectOne("member.itemMemberStat", itemId);
	}
	
	
	//상품삭제
	@Override
	public void deleteItem(int itemId) {
		sqlSession.delete("item.deleteItem", itemId);
	}

	// 상품 수정
	@Override
	public void updateItemMethod(itemDTO dto) {
		sqlSession.update("item.uptItem", dto);
	}
	@Override
	public void updateItemCatMethod(itemDTO dto) {
		sqlSession.update("item.uptItemCat", dto);
	}
	
	@Override
	public List<itemDTO> itemCurrvalMethod(memberDTO dto) {
		return sqlSession.selectList("item.currItem", dto);
	}
		
	@Override
	public void itemflaginsert(itemFlagDTO dto) {
		 sqlSession.insert("itemFlag.itemflaginsert",dto);
	}

	// 찜하기 체크
	@Override
	public int checkWantItemMethod(memberDTO dto) {
		return sqlSession.selectOne("wantItem.checkWantItem", dto);
	}
	// 찜하기 클릭
	@Override
	public void clickWantMethod(memberDTO dto) {
		sqlSession.insert("wantItem.clickWantItem", dto);
	}
	// 찜하기 언클릭
	@Override
	public void unclickWantMethod(memberDTO dto) {
		sqlSession.delete("wantItem.unclickWantItem", dto);
	}
	@Override
	public void updateViewCnt(int itemId) {
		sqlSession.update("item.updateViewCnt", itemId);
	}
	// 오용준 end //////////////////////////////////////////
	
	
	
	
	// 마정협 start //////////////////////////////////////////
	public void itemUploadMethod(itemDTO dto) {
		System.out.println(dto.getItemName());
		sqlSession.insert("item.itemUpload",dto);
	}
	public itemDTO uploadViewMethod() {
		return sqlSession.selectOne("item.itemFirst");
	}
	
	public List<memberDTO> memberLookupMethod() {
		return sqlSession.selectList("member.memberJo");
	}
	
	public List<memberDTO> memberIdOrderMethod() {
		return sqlSession.selectList("member.memberIdOrder");
	}
	
	public List<memberDTO> memberDateOrderMethod() {
		return sqlSession.selectList("member.memberDate");
	}
	
	public List<memberDTO> memberRankOrderMethod() {
		return sqlSession.selectList("member.memberRankOrder");
	}
	
	public List<memberFlagDTO> memberFlagMethod(){
		return sqlSession.selectList("memberFlag.memberFlags");
	}
	
	public void adminMemberFlagMethod(int memberFlagNo) {
			sqlSession.update("memberFlag.memberFlagUpdate",memberFlagNo);
	}
	public void adminItemFlagMethod(int itemFlagNo) {
		sqlSession.update("itemFlag.itemFlagUpdate",itemFlagNo);
}
	public void adminMemberDeleteMethod(String memberId) {
		sqlSession.delete("member.memberdelete",memberId);
	}
	
	public List<itemFlagDTO> itemFlagMethod(){
		return sqlSession.selectList("itemFlag.itemFlags");
	}
	
	public List<itemCategoryDTO> countCategoryMethod() {
		return sqlSession.selectList("item.countCategory");
	}
	
	public List<questionDTO> questionMessageMethod(){
		return sqlSession.selectList("question.questions");
	}
	// 마정협 end //////////////////////////////////////////
	
	
	
	// 오정우 start //////////////////////////////////////////
	
	@Override
	public void crawlingMethod(itemDTO dto) {
		sqlSession.insert("item.crawlingProcess", dto);		
	}
	
	
	@Override
	public List<itemDTO> selectMethod() {
		return sqlSession.selectList("item.selectProcess");
	}

	@Override
	public List<itemDTO> searchMethod(itemDTO dto) {
		System.out.println(dto.getSearchWord());
		return sqlSession.selectList("item.searchItem", dto);
	}

	@Override
	public List<itemDTO> itemCategoryMethod(itemDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("item.category", dto);
	}
	@Override
	public List<itemDTO> searchCategoryMethod(itemDTO dto) {
		return sqlSession.selectList("item.categorySearch", dto);
	}


	// 오정우 end //////////////////////////////////////////
	
	
	// 표다몬 start //////////////////////////////////////////
	@Override
	public List<chatviewDTO> friendList(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chatRoom.RoomList", id);
	}

	@Override
	public List<chatMsgDTO> msglog(int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chatMsg.MsgList", num);
	}

	@Override
	public void msgSave(chatMsgDTO dto) {
		sqlSession.insert("chatMsg.MsgSave", dto);
	}

	@Override
	public void enterTime(chatviewDTO dto) {
		sqlSession.update("chatRoom.enterupdate", dto);
	}

	@Override
	public void exitTime(chatviewDTO dto) {
		sqlSession.update("chatRoom.exitupdate", dto);
		
	}

	@Override
	public List<chatviewDTO> chatLog(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chatRoom.RoomLog", id);
	}
//FRoomlog

	@Override
	public chatviewDTO fenterTime(chatviewDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatRoom.FRoomlog", dto);
	}

	@Override
	public void addRoom(chatRoomDTO dto) {
		sqlSession.insert("chatRoom.addRoom", dto);
	}

	@Override
	public String findItemMember(int itemId) {
		return sqlSession.selectOne("chatRoom.itemMember", itemId);
	}
	
	// 표다몬 end //////////////////////////////////////////

} // end class