package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
import dto.memberStatusDTO;
import dto.orderDTO;

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