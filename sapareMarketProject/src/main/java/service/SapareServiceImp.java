package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import dao.SapareDAO;
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

public class SapareServiceImp implements SapareService{

	private SapareDAO dao;
	
	public SapareServiceImp() {
		
	} // end sapareServiceImp()
	
	public void setDao(SapareDAO dao) {
		this.dao = dao;
	}
	
	// 김녹훈 start //////////////////////////////////////////
	
		// 회원정보 리턴
	@Override
	public memberDTO memberInfoProcess(memberDTO dto) {
		return dao.memberInfoMethod(dto);
	}
	@Override
	public memberStatusDTO memberStatInfoProcess(memberDTO dto) {
		return dao.memberStatInfoMethod(dto);
	}
	
		// 회원이 구매한 상품 리턴
	@Override
	public List<orderDTO> buyInfoProcess(memberDTO dto) {
		return dao.buyInfoMethod(dto);
	}
		// 회원이 판매한 상품 리턴
	@Override
	public List<itemDTO> sellInfoProcess(memberDTO dto) {
		return dao.sellInfoMethod(dto);
	}
	
		// 닉네임 중복 체크
	@Override
	public int checkNicknameProcess(memberDTO dto) {
		return dao.checkNicknameMethod(dto);
	}
	
		// 닉네임 변경
	@Override
	public void changeNicknameProcess(memberDTO dto) {
		dao.changeNicknameMethod(dto);
	}
	
		// 소개글 변경
	@Override
	public void changeAboutProcess(memberDTO dto) {
		dao.changeAboutMethod(dto);
	}
	
		// 프로필 사진 변경
	@Override
	public void changeProfileImgProcess(memberDTO dto) {
		dao.changeProfileImgMethod(dto);
	}
	
		// 비밀번호 변경
	@Override
	public void changePasswordProcess(memberDTO dto) {
		dao.changePasswordMethod(dto);
	}
	
		// 찜 목록 가져오기
	@Override
	public List<itemDTO> wantItemProcess(memberDTO dto) {
		return dao.wantItemMethod(dto);
	}
	
		// 받은 후기 가져오기
	@Override
	public List<itemDTO> receivedReviewProcess(memberDTO dto) {
		return dao.receivedReviewMethod(dto);
	}
		// 작성한 후기 가져오기
	@Override
	public List<itemDTO> sentReviewProcess(memberDTO dto) {
		return dao.sentReviewMethod(dto);
	}

		// 판매중인 상품만 가져오기
	@Override
	public List<itemDTO> sellingOnlyProcess(memberDTO dto) {
		return dao.sellingOnlyMethod(dto);
	}
		// 판매완료인 상품만 가져오기
	@Override
	public List<itemDTO> soldOnlyProcess(memberDTO dto) {
		return dao.soldOnlyMethod(dto);
	}
		
		// 찜 많은 상품순
	@Override
	public List<itemDTO> wantNumProcess(memberDTO dto) {
		return dao.wantNumMethod(dto);
	}
		// 찜 저가순
	@Override
	public List<itemDTO> wantPriceProcess(memberDTO dto) {
		return dao.wantPriceMethod(dto);
	}
	
		// 판매 지난 주까지
	@Override
	public List<itemDTO> sellWeekProcess(memberDTO dto) {
		return dao.sellWeekMethod(dto);
	}
		// 판매 지난 달까지
	@Override
	public List<itemDTO> sellMonthProcess(memberDTO dto) {
		return dao.sellMonthMethod(dto);
	}
		// 판매 지난 6개월까지
	@Override
	public List<itemDTO> sellSixMonthsProcess(memberDTO dto) {
		return dao.sellSixMonthsMethod(dto);
	}
	
		// 구매 지난 주까지
	@Override
	public List<itemDTO> buyWeekProcess(memberDTO dto){
		return dao.buyWeekMethod(dto);
	};
		// 구매 지난 달까지
	@Override
	public List<itemDTO> buyMonthProcess(memberDTO dto){;
		return dao.buyMonthMethod(dto);
	}
		// 구매 지난 6개월까지
	@Override
	public List<itemDTO> buySixMonthsProcess(memberDTO dto) {
		return dao.buySixMonthsMethod(dto);
	}
	
		// 후기 작성 후
	@Override
	public void submitReviewProcess(reviewDTO dto) {
		dao.submitReviewMethod(dto);
	}
	
		// 판매 상품 검색
	@Override
	public List<itemDTO> sellSearchProcess(memberDTO dto) {
		return dao.sellSearchMethod(dto);
	}
		// 구매 상품 검색
	@Override
	public List<orderDTO> buySearchProcess(memberDTO dto) {
		return dao.buySearchMethod(dto);
	}
	
		// 찜 목록에서 제거
	@Override
	public void removeWantProcess(memberDTO dto) {
		dao.removeWantMethod(dto);
	}
		// 찜 갯수 더하기
	@Override
	public void addWantCntProcess(memberDTO dto) {
		dao.addWantCntMethod(dto);
	}
		// 찜 갯수 빼기
	@Override
	public void subtWantCntProcess(memberDTO dto) {
		dao.subtWantCntMethod(dto);
	}
	
		// 전화번호 중복 체크
	@Override
	public int checkPhoneNumProcess(memberDTO dto) {
		return dao.checkPhoneNumMethod(dto);
	}
		// 전화번호 변경
	@Override
	public void changePhoneNumProcess(memberDTO dto) {
		dao.changePhoneNumMethod(dto);
	}
	
		// 비밀번호 체크
	@Override
	public memberDTO checkPasswordProcess(memberDTO dto) {
		return dao.checkPasswordMethod(dto);
	}
		// 회원 탈퇴
	@Override
	public void cancelMemberProcess(memberDTO dto) {
		dao.cancelMemberMethod(dto);
	}
	
		// 회원 중복 아이디 체크
	@Override
	public int idCheckProcess(memberDTO dto) {
		return dao.idCheckMethod(dto);
	}
	
		// 회원가입 회원 정보
	@Override
	public void signupStatusProcess(memberDTO dto) {
		dao.signupStatusMethod(dto);
	}
	
		// 신고 카운트 +1
	@Override
	public void plusItemFlagProcess(itemFlagDTO dto) {
		dao.plusItemFlagMethod(dto);
	}
	
		// 회원 신고
	@Override
	public void memberFlagInsertProcess(memberFlagDTO dto) {
		dao.memberFlagInsertMethod(dto);
	}
		// 회원 신고 카운트 +1
	@Override
	public void plusMemberFlagProcess(memberFlagDTO dto) {
		dao.plusMemberFlagMethod(dto);
	}
	
		// 최근 찜 3개
	@Override
	public List<itemDTO> wantItemMiniProcess(memberDTO dto) {
		return dao.wantItemMiniMethod(dto);
	}
	
		// 채팅 구매자 이름
	@Override
	public List<chatRoomDTO> getBuyerNameProcess(int itemId) {
		return dao.getBuyerNameMethod(itemId);
	}
	
		// 닉네임으로 회원 정보
	@Override
	public memberDTO getInfoByNickProcess(String nickname) {
		return dao.getInfoByNickMethod(nickname);
	}
	
		// 거래완료 주문
	@Override
	public void submitOrderProcess(orderDTO odto) {
		dao.submitOrderMethod(odto);
	}
		// 상품 판매완료 변경
	@Override
	public void itemSoldProcess(int itemId) {
		dao.itemSoldMethod(itemId);
	}
	
		// 구매 횟수 증가
	@Override
	public void plusBuyCountProcess(memberDTO dto) {
		dao.plusBuyCountMethod(dto);
	}
		// 판매 횟수 증가
	@Override
	public void plusSellCountProcess(memberDTO dto) {
		dao.plusSellCountMethod(dto);
	}
	// 김녹훈 end //////////////////////////////////////////
	
	
	// 김소정 start ////////////////////////////////////////

	@Override
	public void insertProcess(boardDTO dto) {
		 dao.save(dto);
		
	}

	@Override
	public boardDTO contentProcess(int num) {
		return dao.content(num);
	}

	@Override
	public boardDTO updateSelectProcess(int num) {
		// TODO Auto-generated method stub
	    return dao.updateNum(num);
	}

	@Override
	public void updateProcess(boardDTO dto) {
		dao.update(dto);
		
	}

	@Override
	public void deleteProcess(int num) {
		dao.delete(num);
		
	}

	@Override
	public List<boardDTO> listProcess() {
		return dao.list();
	}

	@Override
	public boardDTO categoryProcess(boardDTO dto) {
		// TODO Auto-generated method stub
		return dao.category(dto);
	}

	@Override
	public List<boardDTO> faqlistProcess() {
		// TODO Auto-generated method stub
		return dao.faqlist();
	}

	@Override
	public List<itemDTO> itemlistProcess() {
		// TODO Auto-generated method stub
		return dao.itemlist();
	}

	@Override
	public List<questionDTO> questionlistProcess() {
		// TODO Auto-generated method stub
		return dao.questionlist();
	}

	@Override
	public void questioninsertProcess(questionDTO dto) {
		dao.postq(dto);
		
	}

	@Override
	public List<memberDTO> memberlistProcess() {
		// TODO Auto-generated method stub
		return dao.memberlist();
	}

	@Override
	public void signupProcess(memberDTO dto) {
		// TODO Auto-generated method stub
		dao.signup(dto);
	}


	@Override
	public memberDTO viewMember(memberDTO dto) {
		// TODO Auto-generated method stub
		return dao.viewMember(dto);
	}

	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		session.removeAttribute("logOk");
		session.removeAttribute("id");
		session.removeAttribute("memberName");
		session.invalidate();
	}

	@Override
	public boolean loginCheck(memberDTO dto, HttpSession session) {
		boolean result = dao.loginCheck(dto);
		if(result) {
			memberDTO pdto = viewMember(dto);
			
			session.setAttribute("memberId", pdto.getMemberId());
			session.setAttribute("memberPw", pdto.getMemberPw());
		}
		return result;
	}
	
	@Override
	public memberDTO infoByIdProcess(memberDTO dto) {
		return dao.infoByIdMethod(dto);
	}
	
	@Override
	public boolean cancelCheckProcess(memberDTO dto) {
		return (dao.cancelCheckMethod(dto).getDelFlag() == '\0') ? false:true;
	}
	
	@Override
	public boolean flagCheckProcess(memberDTO dto) {
		return (dao.flagCheckMethod(dto) == 0) ? false:true;
	}
	
	// 김소정 end ////////////////////////////////////////
	
	
	
	
	// 오용준 start //////////////////////////////////////////
	@Override
	public itemDTO itemviewProcess(int itemId) {
		return dao.itemcontent(itemId);
	}
	
	@Override
	public itemCategoryDTO itemCatProcess(int itemId) {
		return dao.itemCatContent(itemId);
	}
	@Override
	public memberDTO itemMemberProcess(int itemId) {
		return dao.itemMemberContent(itemId);
	}
	@Override
	public memberStatusDTO itemMemberStatProcess(int itemId) {
		return dao.itemMemberStatContent(itemId);
	}
	
	//삭제
	@Override
	public void deleteItemProcess(int itemId) {
		dao.deleteItem(itemId);
	}	
	// 상품 수정
	@Override
	public void updateItemProcess(itemDTO dto) {
		dao.updateItemMethod(dto);
	}
	@Override
	public void updateItemCatProcess(itemDTO dto) {
		dao.updateItemCatMethod(dto);
	}
	
	@Override
	public List<itemDTO> itemCurrvalProcess(memberDTO dto) {
		return dao.itemCurrvalMethod(dto);
	}

	@Override
	public void itemflaginsertProcess(itemFlagDTO dto) {
		dao.itemflaginsert(dto);
		
	}
	
	// 찜하기 체크
	@Override
	public int checkWantItemProcess(memberDTO dto) {
		return dao.checkWantItemMethod(dto);
	}
	// 찜 클릭
	@Override
	public void clickWantProcess(memberDTO dto) {
		dao.clickWantMethod(dto);
	}
	// 찜 언클릭
	@Override
	public void unclickWantProcess(memberDTO dto) {
		dao.unclickWantMethod(dto);
	}
	@Override
	public void itemViewCntProcess(int itemId) {
		dao.updateViewCnt(itemId);
	}
	// 오용준 end //////////////////////////////////////////
	
	
	
	
	// 마정협 start //////////////////////////////////////////
	public void itemUploadProcess(itemDTO dto) {
		dao.itemUploadMethod(dto);
	}

	public itemDTO uploadViewProcess(){
		return dao.uploadViewMethod();
	}
	
	public List<memberDTO> memberLookupProcess() {
		return dao.memberLookupMethod();
	}
	
	public List<memberDTO> memberIdOrderProcess() {
		return dao.memberIdOrderMethod();
	}
	
	public List<memberDTO> memberDateOrderProcess() {
		return dao.memberDateOrderMethod();
	}
	
	public List<memberDTO> memberRankOrderProcess() {
		return dao.memberRankOrderMethod();
	}
	public List<memberFlagDTO> memberFlagProcess() {
		return dao.memberFlagMethod();
	}
	public void memberFlagUpdateProcess(int memberFlagNo) {
		 dao.adminMemberFlagMethod(memberFlagNo);
	}
	public void itemFlagUpdateProcess(int itemFlagNo) {
		 dao.adminItemFlagMethod(itemFlagNo);
	}
	public void MemberDeleteProcess(String memberId) {
		dao.adminMemberDeleteMethod(memberId);
	}
	public List<itemFlagDTO> itemFlagProcess() {
		return dao.itemFlagMethod();
	}
	public List<itemCategoryDTO> countCategoeyProcess() {
		return dao.countCategoryMethod();
	}
	public List<questionDTO> questionMessageProcess(){
		return dao.questionMessageMethod();
	}
	@Override
	public void memberFlagHoldProcess(int memberFlagNo) {
		dao.adminMemberHoldMethod(memberFlagNo);
	}
	@Override
	public void itemFlagHoldProcess(int itemFlagNo) {
		dao.adminItemFlagHoldMethod(itemFlagNo);
	}
	@Override
	public int itemFlagCheckProcess(memberDTO dto) {
		return dao.adminItemFlagCheckMethod(dto);
	}
	
	// 마정협 end //////////////////////////////////////////
	
	
	
	// 오정우 start //////////////////////////////////////////
	
	@Override
	public void crawlingProcess(itemDTO dto) {
		dao.crawlingMethod(dto);
	}
	@Override
	public List<itemDTO> selectProcess() {
		return dao.selectMethod();
	}
	
	@Override
	public List<itemDTO> searchProcess(itemDTO dto) {
		return dao.searchMethod(dto);
	}

	@Override
	public List<itemDTO> itemCategoryProcess(itemDTO dto) {
		// TODO Auto-generated method stub
		return dao.itemCategoryMethod(dto);
	}
	
	@Override
	public List<itemDTO> searchCategoryProcess(itemDTO dto) {
		return dao.searchCategoryMethod(dto);
	}

	// 오정우 end //////////////////////////////////////////
	
	
	// 표다몬 start //////////////////////////////////////////
	@Override
	public List<chatviewDTO> friendProcess(String id) {
		// TODO Auto-generated method stub
		return dao.friendList(id);
	}

	@Override
	public List<chatMsgDTO> msgProcess(int num) {
		// TODO Auto-generated method stub
		return dao.msglog(num);
	}

	@Override
	public void msgSaveProcess(chatMsgDTO dto) {
		dao.msgSave(dto);
	}

	@Override
	public void enterTimeProcess(chatviewDTO dto) {
		dao.enterTime(dto);
	}

	@Override
	public void exitTimeProcess(chatviewDTO dto) {
		dao.exitTime(dto);
	}

	@Override
	public List<chatviewDTO> LogProcess(String id) {
		// TODO Auto-generated method stub
		return dao.chatLog(id);
	}

	@Override
	public chatviewDTO fenterTimeProcess(chatviewDTO dto) {
		// TODO Auto-generated method stub
		return dao.fenterTime(dto);
	}

	@Override
	public void RoomAddProcess(chatRoomDTO dto) {
		// TODO Auto-generated method stub
		dao.addRoom(dto);
	}

	@Override
	public String itemMemNameProcess(int itemId) {
		// TODO Auto-generated method stub
		return dao.findItemMember(itemId);
	}
	
	// 표다몬 end //////////////////////////////////////////
	
} // end class