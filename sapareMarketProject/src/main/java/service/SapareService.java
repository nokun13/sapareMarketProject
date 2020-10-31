package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
import dto.memberStatusDTO;
import dto.orderDTO;
import dto.questionDTO;
import dto.reviewDTO;

public interface SapareService {

	// 김녹훈 start //////////////////////////////////////////
	
		// 회원정보 리턴
	public memberDTO memberInfoProcess(memberDTO dto);
	public memberStatusDTO memberStatInfoProcess(memberStatusDTO dto);
	
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
	
	// 김소정 end ////////////////////////////////////////
	
	
	
	
	// 오용준 start //////////////////////////////////////////
	

	
	// 오용준 end //////////////////////////////////////////
	
	
	
	
	// 마정협 start //////////////////////////////////////////
	
	
	// 마정협 end //////////////////////////////////////////
	
	
	
	// 오정우 start //////////////////////////////////////////
	
	public void crawlingProcess(itemDTO dto);
	public List<itemDTO> selectProcess();
	
	// 오정우 end //////////////////////////////////////////
	
	
	// 표다몬 start //////////////////////////////////////////
	
	
	// 표다몬 end //////////////////////////////////////////
	
} // end interface
