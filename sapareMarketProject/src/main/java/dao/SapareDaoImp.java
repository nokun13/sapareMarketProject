package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.boardDTO;
import dto.itemDTO;

public class SapareDaoImp implements SapareDAO{

	private SqlSessionTemplate sqlSession;
	
	public SapareDaoImp() {
		
	} // end sapareDAOImp()

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 김녹훈 start //////////////////////////////////////////
	
	
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