package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.boardDTO;
import dto.memberDTO;
import dto.memberStatusDTO;
import dto.reviewDTO;
import service.SapareService;

// http://localhost:8090/sapare/mainPage.do
// http://localhost:8090/sapare/profileSetting.do

//https://ovenapp.io/view/i9zrGaOgD6eTlPpNLBIkr7vUX1mfTb7v
//http://localhost:8090/sapare/signupPage.do
//http://localhost:8090/sapare/helpPage.do

@RestController
public class SapareController {

	private SapareService service;
	
	public SapareController() {
	} // end sapareController()
	
	public void setService(SapareService service) {
		this.service = service;
	}
	
	
	// 김녹훈 start //////////////////////////////////////////

		// 이미지 파일 경로 !!!
	private String uploadPath = "C:\\Users\\user\\Desktop\\workspace-spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\sapareMarketProject\\image";
	
		// 프로필 페이지 판매 메뉴
	@RequestMapping("/profileSell.do")
	public ModelAndView profileSellPageProcess(ModelAndView mav) {
		
		memberDTO dto = new memberDTO();
		dto.setMemberName("test");
		
		memberStatusDTO sdto = new memberStatusDTO();
		sdto.setMemberName("test");

		System.out.println(service.sellInfoProcess(dto).get(0).getItemAbout());
		System.out.println(service.sellInfoProcess(dto).get(1).getItemAbout());
		System.out.println(service.sellInfoProcess(dto).get(2).getItemAbout());
		mav.addObject("iList", service.sellInfoProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(sdto));
		mav.setViewName("profileSellPage");
		return mav;
		
	}
	
		// 프로필 페이지 구매 메뉴
	@RequestMapping("/profileBuy.do")
	public ModelAndView profileBuyPageProcess(ModelAndView mav) {
		
		memberDTO dto = new memberDTO();
		dto.setMemberName("test");
		
		memberStatusDTO sdto = new memberStatusDTO();
		sdto.setMemberName("test");
		
		mav.addObject("oList", service.buyInfoProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(sdto));
		mav.setViewName("profileBuyPage");
		return mav;
		
	}
	
		// 프로필 페이지 찜 메뉴
	@RequestMapping("/profileWant.do")
	public ModelAndView profileWantPageProcess(ModelAndView mav) {
		
		memberDTO dto = new memberDTO();
		dto.setMemberName("test");
		
		memberStatusDTO sdto = new memberStatusDTO();
		sdto.setMemberName("test");
		
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(sdto));
		mav.setViewName("profileWantPage");
		return mav;
		
	}
	
		// 프로필 페이지 후기 메뉴
	@RequestMapping("/profileReview.do")
	public ModelAndView profileReviewPageProcess(ModelAndView mav) {
		
		memberDTO dto = new memberDTO();
		dto.setMemberName("test");
		
		memberStatusDTO sdto = new memberStatusDTO();
		sdto.setMemberName("test");
		
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(sdto));
		mav.setViewName("profileReviewPage");
		return mav;
		
	}
	
		// 프로필 페이지 프로필설정 메뉴
	@RequestMapping("/profileSetting.do")
	public ModelAndView profileSettingPageProcess(ModelAndView mav) {
		
		memberDTO dto = new memberDTO();
		dto.setMemberName("test");
		
		memberStatusDTO sdto = new memberStatusDTO();
		sdto.setMemberName("test");
		
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(sdto));
		mav.setViewName("profileSettingPage");
		return mav;
		
	}
	
		// 닉네임 중복 체크 ajax
	@RequestMapping("/checkNickname.do")
	public int checkNicknameProcess(memberDTO dto, HttpServletRequest request) {
		
		return service.checkNicknameProcess(dto);
	}
	
		// 닉네임 변경 ajax
	@RequestMapping("/changeNickname.do")
	public memberDTO changeNicknameProcess(memberDTO dto, HttpServletRequest request) {
		
		service.changeNicknameProcess(dto);
		return service.memberInfoProcess(dto);
	}
	
		// member 정보 리턴 ajax
	@RequestMapping("/memberInfoGet.do")
	public memberDTO memberInfoProcess(memberDTO dto, HttpServletRequest request) {
		
		return service.memberInfoProcess(dto);
	}
	
		// 회원 소개글 변경/저장 후 소개글 리턴 ajax
	@RequestMapping("/changeMemberAbout.do")
	public memberDTO changeAboutProcess(memberDTO dto, HttpServletRequest request) {
		service.changeAboutProcess(dto);
		return service.memberInfoProcess(dto);
	}
	
		// 프로필 사진 변경 후 새 프로필 사진 리턴 ajax
	@RequestMapping("/profileImgChange.do")
	public memberDTO changeProfileImgProcess(memberDTO dto, HttpServletRequest request) {
		
		MultipartFile file = dto.getProfileFile();
		if (file != null) {
			String fileName = file.getOriginalFilename();
			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			File fe = new File(uploadPath);
			if (!fe.exists()) {
				fe.mkdir();
			}
			
			File ff = new File(uploadPath, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			dto.setProfileImg(random + "_" + fileName);
		}
		service.changeProfileImgProcess(dto);
		return service.memberInfoProcess(dto);
	}
	
		// 회원 비밀번호 변경 후 소개글 리턴 ajax
	@RequestMapping("/memberPwChange.do")
	public void changePasswordProcess(memberDTO dto, HttpServletRequest request) {
		service.changePasswordProcess(dto);
	}
	
	// 김녹훈 end //////////////////////////////////////////
	
	
	
	
	
	// 김소정 start ////////////////////////////////
	
	@RequestMapping("/signupPage.do")
	public ModelAndView signupListPage(ModelAndView mav) {
				
		mav.setViewName("signupPage");
		return mav;
				
	} // end signupListPage()
	
	@RequestMapping("/information1.do")
	public ModelAndView information1(ModelAndView mav) {
		
		mav.setViewName("information1");
		return mav;
	}
		
	@RequestMapping("/information2.do")
	public ModelAndView information2(ModelAndView mav) {
		
		mav.setViewName("information2");
		return mav;
	}
	
	@RequestMapping("/information3.do")
	public ModelAndView information3(ModelAndView mav) {
		
		mav.setViewName("information3");
		return mav;
	}
	
	@RequestMapping("/helpPage.do")
	public ModelAndView helpListPage(ModelAndView mav) {
		/*System.out.println(service.listProcess().get(0).getBoardNo());
		System.out.println(service.listProcess().get(1).getBoardNo());*/
		mav.addObject("boardList", service.listProcess());	
		mav.setViewName("helpPage");
		return mav;
				
	} // end helpListPage()
	
	@RequestMapping(value="/helpNoticeWrite.do",method=RequestMethod.GET)
	public ModelAndView helpListWritedo(ModelAndView mav, boardDTO dto) {
		
		mav.addObject("boardDTO",dto);
		mav.addObject("boardList", service.listProcess());
		mav.setViewName("helpNoticeWrite");
		return mav;
	}
	@RequestMapping(value="/helpNoticeWrite.do",method=RequestMethod.POST)
	public ModelAndView writeProMethod( boardDTO dto, HttpServletRequest request,ModelAndView mav) {
	    
		
		service.insertProcess(dto);
		
	
		mav.setViewName("redirect:/helpPage.do"); 
		return mav;
		
	}//
	
	@RequestMapping("/helpFAQ.do")
	public ModelAndView helpListFAQ(ModelAndView mav) {
		mav.addObject("boardList", service.faqlistProcess());
		mav.setViewName("helpFAQ");
		return mav;
				
	}
	
	@RequestMapping(value="/helpNoticeUpdate.do", method=RequestMethod.GET)
	public ModelAndView helpListNoticeUpdate(int num, ModelAndView mav) {
		mav.addObject("boardList",service.contentProcess(num));
		
		mav.setViewName("helpNoticeUpdate");
		
		return mav;
	}
	
	@RequestMapping(value="/helpNoticeUpdate.do",method=RequestMethod.POST) //update.jsp post이기때문
	public ModelAndView updateProMethod(boardDTO dto, HttpServletRequest request, ModelAndView mav) {
		
		service.updateProcess(dto); 
	
		
		mav.setViewName("redirect:/helpPage.do");
		return mav;
	}//updateProMethod
	
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public ModelAndView deleteMethod(int num, HttpServletRequest request, ModelAndView mav) {
		
		service.deleteProcess(num);
	
		mav.setViewName("redirect:/helpPage.do");
		return mav;
		
	}
	
	// 김소정 end ////////////////////////////////
	
	
	
	
	
	// 마정협 start /////////////////////////////////
	
	@RequestMapping("/itemUploadPage.do")
	public ModelAndView itemUploadPage(ModelAndView mav) {
		mav.setViewName("itemUploadPage");
		return mav;
	}
	
	// 마정협 end /////////////////////////////////
	
	
	
	
	
	// 오용준 start /////////////////////////////////
	
	
	
	
	// 오용준 end ///////////////////////////////////
	
	
	
	
	
	// 오정우 start /////////////////////////////////
	
	@RequestMapping("/mainPage.do")
	public ModelAndView boardListPage(ModelAndView mav) {
		mav.addObject("itemList", service.selectProcess());
		mav.setViewName("mainPage");
		return mav;

	} // end boardListPage()

	
	// 오정우 end /////////////////////////////////
	
	
	
	
	
	// 표다몬 start /////////////////////////////////
	
	
	
	// 표다몬 end /////////////////////////////////
	
	
	
} // end class