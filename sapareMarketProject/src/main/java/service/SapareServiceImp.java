package service;

import java.util.List;

import dao.SapareDAO;
import dto.boardDTO;
import dto.itemDTO;
import dto.memberDTO;
import dto.memberStatusDTO;
import dto.orderDTO;

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
	
	@Override
	public void changePasswordProcess(memberDTO dto) {
		dao.changePasswordMethod(dto);
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