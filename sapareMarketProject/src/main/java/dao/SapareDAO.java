package dao;

import java.util.List;

import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
import dto.memberStatusDTO;
import dto.orderDTO;

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