package service;

import java.util.List;

import javax.servlet.http.HttpSession;

import dao.SapareDAO;
import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
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
	public memberStatusDTO memberStatInfoProcess(memberStatusDTO dto) {
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
	
	// 김소정 end ////////////////////////////////////////
	
	
	
	
	// 오용준 start //////////////////////////////////////////
	

	
	// 오용준 end //////////////////////////////////////////
	
	
	
	
	// 마정협 start //////////////////////////////////////////
	
	
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

	// 오정우 end //////////////////////////////////////////
	
	
	// 표다몬 start //////////////////////////////////////////
	
	
	// 표다몬 end //////////////////////////////////////////
	
} // end class