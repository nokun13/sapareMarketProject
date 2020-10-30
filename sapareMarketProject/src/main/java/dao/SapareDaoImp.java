package dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
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
	public memberStatusDTO memberStatInfoMethod(memberStatusDTO dto) {
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
		// TODO Auto-generated method stub
	/*	String name = sqlSession.selectOne("member.loginCheck", dto);*/
		
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
	
	// 김소정 end ///////////////////////////////////////////
	
	
	
	
	// 오용준 start //////////////////////////////////////////
	

	
	// 오용준 end //////////////////////////////////////////
	
	
	
	
	// 마정협 start //////////////////////////////////////////
	
	
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


	// 오정우 end //////////////////////////////////////////
	
	
	// 표다몬 start //////////////////////////////////////////
	
	
	// 표다몬 end //////////////////////////////////////////

} // end class