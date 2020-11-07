package service;

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

public interface SapareService {

	// 김녹훈 start //////////////////////////////////////////
	
		// 회원정보 리턴
	public memberDTO memberInfoProcess(memberDTO dto);
	public memberStatusDTO memberStatInfoProcess(memberDTO dto);
	
		// 회원이 구매한 상품 리턴
	public List<orderDTO> buyInfoProcess(memberDTO dto);
		// 회원이 판매한 상품 리턴
	public List<itemDTO> sellInfoProcess(memberDTO dto);
	
		// 닉네임 중복 체크
	public int checkNicknameProcess(memberDTO dto);
		// 닉네임 변경
	public void changeNicknameProcess(memberDTO dto);
	
		// 소개글 변경
	public void changeAboutProcess(memberDTO dto);
	
		// 프로필 사진 변경
	public void changeProfileImgProcess(memberDTO dto);
	
		// 비밀번호 변경
	public void changePasswordProcess(memberDTO dto);
	
		// 찜 목록 가져오기
	public List<itemDTO> wantItemProcess(memberDTO dto);
		
		// 받은 후기 가져오기
	public List<itemDTO> receivedReviewProcess(memberDTO dto);
		// 작성한 후기 가져오기
	public List<itemDTO> sentReviewProcess(memberDTO dto);
	
		// 판매중인 상품만 가져오기
	public List<itemDTO> sellingOnlyProcess(memberDTO dto);
		// 판매완료인 상품만 가져오기
	public List<itemDTO> soldOnlyProcess(memberDTO dto);
		
		// 찜 많은 상품순
	public List<itemDTO> wantNumProcess(memberDTO dto);
		// 찜 저가순
	public List<itemDTO> wantPriceProcess(memberDTO dto);
	
		// 판매 지난 주까지
	public List<itemDTO> sellWeekProcess(memberDTO dto);
		// 판매 지난 달까지
	public List<itemDTO> sellMonthProcess(memberDTO dto);
		// 판매 지난 6개월까지
	public List<itemDTO> sellSixMonthsProcess(memberDTO dto);
	
		// 구매 지난 주까지
	public List<itemDTO> buyWeekProcess(memberDTO dto);
		// 구매 지난 달까지
	public List<itemDTO> buyMonthProcess(memberDTO dto);
		// 구매 지난 6개월까지
	public List<itemDTO> buySixMonthsProcess(memberDTO dto);
		
		// 후기 작성 후
	public void submitReviewProcess(reviewDTO dto);
	
		// 판매 상품 검색
	public List<itemDTO> sellSearchProcess(memberDTO dto);
		// 구매 상품 검색
	public List<orderDTO> buySearchProcess(memberDTO dto);
	
		// 찜 목록에서 제거
	public void removeWantProcess(memberDTO dto);
		// 찜 갯수 더하기
	public void addWantCntProcess(memberDTO dto);
		// 찜 갯수 빼기
	public void subtWantCntProcess(memberDTO dto);
	
		// 전화번호 중복 체크
	public int checkPhoneNumProcess(memberDTO dto);
		// 전화번호 변경
	public void changePhoneNumProcess(memberDTO dto);
	
		// 비밀번호 체크
	public memberDTO checkPasswordProcess(memberDTO dto);
		// 회원 탈퇴
	public void cancelMemberProcess(memberDTO dto);
	
		// 회원 중복 아이디 체크
	public int idCheckProcess(memberDTO dto);
	
		// 회원가입 회원 정보
	public void signupStatusProcess(memberDTO dto);
	
		// 신고 카운트 +1
	public void plusItemFlagProcess(itemFlagDTO dto);
	
		// 회원 신고
	public void memberFlagInsertProcess(memberFlagDTO dto);
		// 회원 신고 카운트 +1
	public void plusMemberFlagProcess(memberFlagDTO dto);
	
	// 김녹훈 end //////////////////////////////////////////
	
	
	
	
	// 김소정 start ////////////////////////////////////////
	public List<boardDTO> listProcess();

	public void insertProcess(boardDTO dto);

	public boardDTO contentProcess(int num);

	public boardDTO updateSelectProcess(int num);

	public void updateProcess(boardDTO dto);

	public void deleteProcess(int num);

	public boardDTO categoryProcess(boardDTO dto);

	public List<boardDTO> faqlistProcess();

	public List<itemDTO> itemlistProcess();

	public List<questionDTO> questionlistProcess();

	public void questioninsertProcess(questionDTO dto);

	public List<memberDTO> memberlistProcess();

	public void signupProcess(memberDTO dto);

	public boolean loginCheck(memberDTO dto, HttpSession session);

	public memberDTO viewMember(memberDTO dto);

	public void logout(HttpSession session);
	
	public memberDTO infoByIdProcess(memberDTO dto);
	
	public boolean cancelCheckProcess(memberDTO dto);
	
	public boolean flagCheckProcess(memberDTO dto);

	// 김소정 end ////////////////////////////////////////

	
	
	// 오용준 start //////////////////////////////////////////
	public itemDTO itemviewProcess(int itemId);

	public itemCategoryDTO itemCatProcess(int itemId);

	public memberDTO itemMemberProcess(int itemId);

	public memberStatusDTO itemMemberStatProcess(int itemId);

	
	// 상품 삭제
	public void deleteItemProcess(int itemId);
	// 상품 수정
	public void updateItemProcess(itemDTO dto);
	public void updateItemCatProcess(itemDTO dto);

	public List<itemDTO> itemCurrvalProcess(memberDTO dto);

	public void itemflaginsertProcess(itemFlagDTO dto);
	
	// 찜하기 체크
	public int checkWantItemProcess(memberDTO dto);
	// 찜하기 클릭
	public void clickWantProcess(memberDTO dto);
	// 찜하기 언클릭
	public void unclickWantProcess(memberDTO dto);
	
	public void itemViewCntProcess(int itemId);
	// 오용준 end //////////////////////////////////////////

	
	
	
	// 마정협 start //////////////////////////////////////////
	public void itemUploadProcess(itemDTO dto);
	public itemDTO uploadViewProcess();
	public List<memberDTO> memberLookupProcess();
	public List<memberDTO> memberIdOrderProcess();
	public List<memberDTO> memberDateOrderProcess();
	public List<memberDTO> memberRankOrderProcess();
	public List<memberFlagDTO> memberFlagProcess();
	public List<itemFlagDTO> itemFlagProcess();
	public void memberFlagUpdateProcess(int memberFlagNo);
	public void itemFlagUpdateProcess(int itemFlagNo);
	public void MemberDeleteProcess(String memberId);
	public List<itemCategoryDTO> countCategoeyProcess();
	public List<questionDTO> questionMessageProcess();
	// 마정협 end //////////////////////////////////////////

	
	
	
	// 오정우 start //////////////////////////////////////////

	public void crawlingProcess(itemDTO dto);

	public List<itemDTO> selectProcess();

	public List<itemDTO> searchProcess(itemDTO dto);

	public List<itemDTO> itemCategoryProcess(itemDTO dto);
	
	public List<itemDTO> searchCategoryProcess(itemDTO dto);

	// 오정우 end //////////////////////////////////////////

	
	
	// 표다몬 start //////////////////////////////////////////
	public List<chatviewDTO> friendProcess(String id);
	public List<chatMsgDTO> msgProcess(int num); 
	public void msgSaveProcess(chatMsgDTO dto);
	public void enterTimeProcess(chatviewDTO dto);
	public void exitTimeProcess(chatviewDTO dto);
	public void RoomAddProcess(chatRoomDTO dto);
	public List<chatviewDTO> LogProcess(String id);
	public chatviewDTO fenterTimeProcess(chatviewDTO dto);
	public String itemMemNameProcess(int itemId);
	// 표다몬 end //////////////////////////////////////////
	
} // end interface
