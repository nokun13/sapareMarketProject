package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
import dto.memberStatusDTO;
import dto.orderDTO;
import dto.questionDTO;
import dto.reviewDTO;

public interface SapareDAO {
	
	// 김녹훈 start //////////////////////////////////////////
	
		// 회원정보 리턴
	public memberDTO memberInfoMethod(memberDTO dto);
	public memberStatusDTO memberStatInfoMethod(memberStatusDTO dto);
	
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
	
	// 김소정 end ///////////////////////////////////////////////
	
	
	
	
	// 오용준 start //////////////////////////////////////////
	

	
	// 오용준 end //////////////////////////////////////////
	
	
	
	
	// 마정협 start //////////////////////////////////////////
	
	
	// 마정협 end //////////////////////////////////////////
	
	
	
	// 오정우 start //////////////////////////////////////////
	
	public void crawlingMethod(itemDTO dto);
	public List<itemDTO> selectMethod();
	
	// 오정우 end //////////////////////////////////////////
	
	
	// 표다몬 start //////////////////////////////////////////
	
	
	// 표다몬 end //////////////////////////////////////////
	
} // end interface