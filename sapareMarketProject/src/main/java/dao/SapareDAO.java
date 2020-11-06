package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

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

public interface SapareDAO {
	
	// 김녹훈 start //////////////////////////////////////////
	
		// 회원정보 리턴
	public memberDTO memberInfoMethod(memberDTO dto);
	public memberStatusDTO memberStatInfoMethod(memberDTO dto);
	
		// 회원이 구매한 상품 리턴
	public List<orderDTO> buyInfoMethod(memberDTO dto);
		// 회원이 판매한 상품 리턴
	public List<itemDTO> sellInfoMethod(memberDTO dto);
	
		// 닉네임 중복체크
	public int checkNicknameMethod(memberDTO dto);
		// 닉네임 변경
	public void changeNicknameMethod(memberDTO dto);
	
		// 소개글 변경
	public void changeAboutMethod(memberDTO dto);
	
		// 프로필 사진 변경
	public void changeProfileImgMethod(memberDTO dto);
	
		// 비밀번호 변경
	public void changePasswordMethod(memberDTO dto);
	
		// 찜 목록 가져오기
	public List<itemDTO> wantItemMethod(memberDTO dto);
	
		// 받은 후기 가져오기
	public List<itemDTO> receivedReviewMethod(memberDTO dto);
		// 작성한 후기 가져오기
	public List<itemDTO> sentReviewMethod(memberDTO dto);
	
		// 판매중인 상품만 가져오기
	public List<itemDTO> sellingOnlyMethod(memberDTO dto);
		// 판매완료인 상품만 가져오기
	public List<itemDTO> soldOnlyMethod(memberDTO dto);
	
		// 찜 많은 상품순
	public List<itemDTO> wantNumMethod(memberDTO dto);
		// 찜 저가순
	public List<itemDTO> wantPriceMethod(memberDTO dto);
	
		// 판매 지난 주까지
	public List<itemDTO> sellWeekMethod(memberDTO dto);
		// 판매 지난 달까지
	public List<itemDTO> sellMonthMethod(memberDTO dto);
		// 판매 지난 6개월까지
	public List<itemDTO> sellSixMonthsMethod(memberDTO dto);
	
		// 구매 지난 주까지
	public List<itemDTO> buyWeekMethod(memberDTO dto);
		// 구매 지난 달까지
	public List<itemDTO> buyMonthMethod(memberDTO dto);
		// 구매 지난 6개월까지
	public List<itemDTO> buySixMonthsMethod(memberDTO dto);
	
		// 후기 작성 후
	public void submitReviewMethod(reviewDTO dto);
	
		// 판매상품 검색
	public List<itemDTO> sellSearchMethod(memberDTO dto);
		// 구매상품 검색
	public List<orderDTO> buySearchMethod(memberDTO dto);
	
		// 찜 목록에서 제거
	public void removeWantMethod(memberDTO dto);
		// 찜 갯수 뺴기
	public void subtWantCntMethod(memberDTO dto);
		// 찜 갯수 더하기
	public void addWantCntMethod(memberDTO dto);
	
		// 전화번호 중복 체크
	public int checkPhoneNumMethod(memberDTO dto);
		// 전화번호 변경
	public void changePhoneNumMethod(memberDTO dto);
	
		// 비밀번호 체크
	public memberDTO checkPasswordMethod(memberDTO dto);
		// 회원 탈퇴
	public void cancelMemberMethod(memberDTO dto);
		// 회원 중복 아이디 체크
	public int idCheckMethod(memberDTO dto);
		// 회원가입 회원정보
	public void signupStatusMethod(memberDTO dto);
	
		// 신고 카운트 +1
	public void plusItemFlagMethod(itemFlagDTO dto);
	
		// 회원 신고
	public void memberFlagInsertMethod(memberFlagDTO dto);
		// 회원 신고 카운트 +1
	public void plusMemberFlagMethod(memberFlagDTO dto);
	
	// 김녹훈 end //////////////////////////////////////////
	
	
	
	// 김소정 start ///////////////////////////////////////////////
	
	public void readCount(int num);
	public boardDTO content(int num);
	public void save(boardDTO dto);
	public boardDTO updateNum(int num);
	public void update(boardDTO dto);
	public void delete(int num);
	public List<boardDTO> list();
	public boardDTO category(boardDTO dto);
	public List<boardDTO> faqlist();
	public List<itemDTO> itemlist();
	public List<questionDTO> questionlist();
	public void postq(questionDTO dto);
	public List<memberDTO> memberlist();
	public void signup (memberDTO dto);
	public boolean loginCheck(memberDTO dto);
	public memberDTO viewMember(memberDTO dto);
	public void logout(HttpSession session);
	public memberDTO infoByIdMethod(memberDTO dto);
	public memberStatusDTO cancelCheckMethod(memberDTO dto);
	public int flagCheckMethod(memberDTO dto);
	
	// 김소정 end ///////////////////////////////////////////////
	
	
	
	
	// 오용준 start //////////////////////////////////////////
	
	//상품아이템(상품가격 소개 조회수 상품명 상품이미지 상품등록날짜 상품타입)
	public itemDTO itemcontent(int itemId);
	//상품 아이템의 카테고리 (상품분류 및 상품위치분류)
	public itemCategoryDTO itemCatContent(int itemId);
	//회원 닉네임 회원프로필사진
	public memberDTO itemMemberContent(int itemId);
	//회원 등급
	public memberStatusDTO itemMemberStatContent(int itemId);
	
	//상품삭제
	public void deleteItem(int itemId);

	// 상품 수정
	public void updateItemMethod(itemDTO dto);
	public void updateItemCatMethod(itemDTO dto);
	
	public List<itemDTO> itemCurrvalMethod(memberDTO dto);
	public void itemflaginsert(itemFlagDTO dto);
	
	// 찜하기 체크
	public int checkWantItemMethod(memberDTO dto);
	// 찜하기 클릭
	public void clickWantMethod(memberDTO dto);
	// 찜하기 언클릭
	public void unclickWantMethod(memberDTO dto);
	
	public void updateViewCnt(int itemId);
	// 오용준 end //////////////////////////////////////////
	
	
	
	
	// 마정협 start //////////////////////////////////////////
	public void itemUploadMethod(itemDTO dto);
	public itemDTO uploadViewMethod();
	public List<memberDTO> memberLookupMethod();
	public List<memberDTO> memberIdOrderMethod();
	public List<memberDTO> memberDateOrderMethod();
	public List<memberDTO> memberRankOrderMethod();
	public List<memberFlagDTO> memberFlagMethod();
	public List<itemFlagDTO> itemFlagMethod();
	public void adminMemberFlagMethod(int memberFlagNo);
	public void adminItemFlagMethod(int itemFlagNo);
	public void adminMemberDeleteMethod(String memberId);
	public List<itemCategoryDTO> countCategoryMethod();
	public List<questionDTO> questionMessageMethod();
	// 마정협 end //////////////////////////////////////////
	
	
	
	
	// 오정우 start //////////////////////////////////////////
	
	public void crawlingMethod(itemDTO dto);
	public List<itemDTO> selectMethod();
	public List<itemDTO> searchMethod(itemDTO dto);
	public List<itemDTO> itemCategoryMethod(itemDTO dto);
	
	// 오정우 end //////////////////////////////////////////
	
	
	
	
	
	// 표다몬 start //////////////////////////////////////////
	public List<chatviewDTO> friendList(String id);
	public List<chatMsgDTO> msglog(int num);
	public List<chatviewDTO> chatLog(String id);
	public void msgSave(chatMsgDTO dto);
	public void enterTime(chatviewDTO dto);
	public void exitTime(chatviewDTO dto);
	public void addRoom(chatRoomDTO dto);
	public chatviewDTO fenterTime(chatviewDTO dto);
	public String findItemMember(int itemId);

	// 표다몬 end //////////////////////////////////////////
	
} // end interface