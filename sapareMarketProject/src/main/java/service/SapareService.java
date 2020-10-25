package service;

import java.util.List;

import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
import dto.memberStatusDTO;
import dto.orderDTO;

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
