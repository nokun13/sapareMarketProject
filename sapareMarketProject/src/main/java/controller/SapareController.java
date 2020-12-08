package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.boardDTO;
import dto.chatMsgDTO;
import dto.chatRoomDTO;
import dto.chatviewDTO;
import dto.itemCategoryDTO;
import dto.itemDTO;
import dto.itemFlagDTO;
import dto.memberDTO;
import dto.memberFlagDTO;
import dto.orderDTO;
import dto.questionDTO;
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

	// 이미지 파일 경로 !!! 변경
/*	private String uploadPath = "C:\\Users\\user\\Desktop\\workspace-spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\sapareMarketProject\\image"; */

	public String filePath(HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("/");//저장할 루트의 경로
		String saveDirectory = root + "img" +File.separator;
		/*String saveDirectory = "C://img/";*/
		return saveDirectory;
	}
	
	// 프로필 페이지 판매 메뉴
	@RequestMapping("/profileSell.do")
	public ModelAndView profileSellPageProcess(ModelAndView mav, memberDTO dto, String memberName, HttpSession session) {

		if(memberName != null) {
			dto.setMemberName(memberName);
		}
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("iList", service.sellInfoProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileSellPage");
		return mav;
	}

	// 판매 상품 검색
	@RequestMapping("/sellSearch.do")
	public ModelAndView sellSearchProcess(ModelAndView mav, String searchWord, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		dto.setSearchWord(searchWord);

		mav.addObject("iList", service.sellSearchProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileSellPage");
		return mav;
	}

	// 구매 상품 검색
	@RequestMapping("/buySearch.do")
	public ModelAndView buySearchProcess(ModelAndView mav, String searchWord, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		dto.setSearchWord(searchWord);

		mav.addObject("bList", service.buySearchProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileBuyPage");
		return mav;
	}

	// 프로필 페이지 구매 메뉴
	@RequestMapping("/profileBuy.do")
	public ModelAndView profileBuyPageProcess(ModelAndView mav, memberDTO dto, String memberName, HttpSession session) {

		if (memberName != null) {
			dto.setMemberName(memberName);
		}
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		System.out.println(dto.getMemberName() + "profilebuy");
		mav.addObject("bList", service.buyInfoProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileBuyPage");
		return mav;

	}

	// 후기 올리기
	@RequestMapping("/reviewSubmit.do")
	public ModelAndView reviewSubmitProcess(ModelAndView mav, reviewDTO rdto, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		service.submitReviewProcess(rdto);
		mav.setViewName("redirect:/profileBuy.do?memberName=" + dto.getMemberName());
		return mav;

	}

	// 판매중인 상품만 가져오기 ajax
	@RequestMapping("/sellingOnlyProcess.do")
	public List<itemDTO> sellingOnlyProcess(memberDTO dto, HttpServletRequest request) {
		return service.sellingOnlyProcess(dto);
	}

	// 판매완료인 상품만 가져오기 ajax
	@RequestMapping("/soldOnlyProcess.do")
	public List<itemDTO> soldOnlyProcess(memberDTO dto, HttpServletRequest request) {
		return service.soldOnlyProcess(dto);
	}

	// 지난주 판매 가져오기
	@RequestMapping("/getWeekSellProcess.do")
	public ModelAndView getWeekSellProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("iList", service.sellWeekProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileSellPage");
		return mav;
	}

	// 지난달 판매 가져오기
	@RequestMapping("/getMonthSellProcess.do")
	public ModelAndView getMonthSellProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("iList", service.sellMonthProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileSellPage");
		return mav;
	}

	// 지난 6개월 판매 가져오기
	@RequestMapping("/getSixMonthsProcess.do")
	public ModelAndView getSixMonthsProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("iList", service.sellSixMonthsProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileSellPage");
		return mav;
	}

	// 지난주 구매 가져오기
	@RequestMapping("/getWeekBuyProcess.do")
	public ModelAndView getWeekBuyProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("bList", service.buyWeekProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileBuyPage");
		return mav;
	}

	// 지난달 구매 가져오기
	@RequestMapping("/getMonthBuyProcess.do")
	public ModelAndView getMonthBuyProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("bList", service.buyMonthProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileBuyPage");
		return mav;
	}

	// 지난 6개월 구매 가져오기
	@RequestMapping("/getSixMonthsBuyProcess.do")
	public ModelAndView getSixMonthsBuyProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("bList", service.buySixMonthsProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileBuyPage");
		return mav;
	}

	// 프로필 페이지 찜 메뉴
	@RequestMapping("/profileWant.do")
	public ModelAndView profileWantPageProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("wantList", service.wantItemProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileWantPage");
		return mav;

	}

	// 새 상품 찜 순서 ajax & 검색 기능
	@RequestMapping("/newWantProcess.do")
	public List<itemDTO> newWantProcess(memberDTO dto, HttpServletRequest request) {
		return service.wantItemProcess(dto);
	}

	// 찜 많은 순서 ajax
	@RequestMapping("/wantNumProcess.do")
	public List<itemDTO> wantNumProcess(memberDTO dto, HttpServletRequest request) {
		return service.wantNumProcess(dto);
	}

	// 저가순 찜 순서 ajax
	@RequestMapping("/wantPriceProcess.do")
	public List<itemDTO> wantPriceProcess(memberDTO dto, HttpServletRequest request) {
		return service.wantPriceProcess(dto);
	}

	// 찜 목록에서 제거 ajax
	@RequestMapping("/removeWantProcess.do")
	public List<itemDTO> removeWantProcess(memberDTO dto, HttpServletRequest request) {
		service.removeWantProcess(dto);
		service.subtWantCntProcess(dto);
		return service.wantItemProcess(dto);
	}

	// 프로필 페이지 후기 메뉴 (처음에는 받은 후기 보여준다)
	@RequestMapping("/profileReview.do")
	public ModelAndView profileReviewPageProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("reviewBoxList", service.receivedReviewProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileReviewPage");
		return mav;

	}

	// 작성한 후기 가져오기
	@RequestMapping("/sentReviewProcess.do")
	public ModelAndView sentReviewProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("reviewBoxList", service.sentReviewProcess(dto));
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
		mav.setViewName("profileReviewPage");
		return mav;
	}

	// 프로필 페이지 프로필설정 메뉴
	@RequestMapping("/profileSetting.do")
	public ModelAndView profileSettingPageProcess(ModelAndView mav, memberDTO dto, HttpSession session) {
		if(session.getAttribute("id") == null) {
			mav.addObject("loginFirst", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		mav.addObject("member", service.memberInfoProcess(dto));
		mav.addObject("status", service.memberStatInfoProcess(dto));
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
			String saveDirectory = filePath(request);
			File fe = new File(saveDirectory);
			if (!fe.exists()) {
				fe.mkdir();
			}

			File ff = new File(saveDirectory, random + "_" + fileName);
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

	// 전화번호 중복 체크 ajax
	@RequestMapping("/checkPhoneNum.do")
	public int checkPhoneNumProcess(memberDTO dto, HttpServletRequest request) {
		return service.checkPhoneNumProcess(dto);
	}

	// 전화번호 변경 ajax
	@RequestMapping("/changePhoneNum.do")
	public memberDTO changePhoneNumProcess(memberDTO dto, HttpServletRequest request) {
		service.changePhoneNumProcess(dto);
		return service.memberInfoProcess(dto);
	}

	// 회원탈퇴
	@RequestMapping("/cancelMember.do")
	public String cancelMemberProcess(memberDTO dto, HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (dto.getMemberPw().equals(service.checkPasswordProcess(dto).getMemberPw())) {
			service.cancelMemberProcess(dto);
			session.invalidate();
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 회원 신고
	@RequestMapping(value = "/memberflag.do", method = RequestMethod.POST)
	public ModelAndView memberflagMethod(memberFlagDTO dto, ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");
		memberDTO mdto = new memberDTO();
		mdto.setMemberId(id);
		memberDTO pdto = service.infoByIdProcess(mdto);
		dto.setMemberFlaggerName(pdto.getMemberName());
		service.memberFlagInsertProcess(dto);
		service.plusMemberFlagProcess(dto);
		mav.setViewName("redirect:/profileSell.do?flag=d&memberName=" + dto.getMemberName());
		return mav;
	}//
	@RequestMapping(value = "/memberflag2.do", method = RequestMethod.POST)
	public ModelAndView memberflagMethod2(memberFlagDTO dto, ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");
		memberDTO mdto = new memberDTO();
		mdto.setMemberId(id);
		memberDTO pdto = service.infoByIdProcess(mdto);
		dto.setMemberFlaggerName(pdto.getMemberName());
		service.memberFlagInsertProcess(dto);
		service.plusMemberFlagProcess(dto);
		mav.setViewName("redirect:/profileSell.do?flag=d&memberName=" + dto.getMemberName());
		return mav;
	}//
	@RequestMapping(value = "/memberflag3.do", method = RequestMethod.POST)
	public ModelAndView memberflagMethod3(memberFlagDTO dto, ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");
		memberDTO mdto = new memberDTO();
		mdto.setMemberId(id);
		memberDTO pdto = service.infoByIdProcess(mdto);
		dto.setMemberFlaggerName(pdto.getMemberName());
		service.memberFlagInsertProcess(dto);
		service.plusMemberFlagProcess(dto);
		mav.setViewName("redirect:/profileSell.do?flag=d&memberName=" + dto.getMemberName());
		return mav;
	}//
	@RequestMapping(value = "/memberflag4.do", method = RequestMethod.POST)
	public ModelAndView memberflagMethod4(memberFlagDTO dto, ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");
		memberDTO mdto = new memberDTO();
		mdto.setMemberId(id);
		memberDTO pdto = service.infoByIdProcess(mdto);
		dto.setMemberFlaggerName(pdto.getMemberName());
		service.memberFlagInsertProcess(dto);
		service.plusMemberFlagProcess(dto);
		mav.setViewName("redirect:/profileSell.do?flag=d&memberName=" + dto.getMemberName());
		return mav;
	}//
	@RequestMapping(value = "/memberflag5.do", method = RequestMethod.POST)
	public ModelAndView memberflagMethod5(memberFlagDTO dto, ModelAndView mav, HttpSession session) {
		String id = (String) session.getAttribute("id");
		memberDTO mdto = new memberDTO();
		mdto.setMemberId(id);
		memberDTO pdto = service.infoByIdProcess(mdto);
		dto.setMemberFlaggerName(pdto.getMemberName());
		service.memberFlagInsertProcess(dto);
		service.plusMemberFlagProcess(dto);
		mav.setViewName("redirect:/profileSell.do?flag=d&memberName=" + dto.getMemberName());
		return mav;
	}
	
	@RequestMapping("/getBuyerNameProcess.do")
	public List<chatRoomDTO> getBuyerNameProcess(int itemId) {
		return service.getBuyerNameProcess(itemId);
	}
	
	@RequestMapping("/buyerConfirm.do")
	public ModelAndView buyerConfirmProcess(ModelAndView mav, String nickname, int itemId, int orderPrice, String memberName) {
		// 아래가 구매자 정보
		memberDTO dto = service.getInfoByNickProcess(nickname);
		// 아래가 판매자 정보 (pdto)
		memberDTO mdto = new memberDTO();
		mdto.setMemberName(memberName);
		memberDTO pdto = service.memberInfoProcess(mdto);
		
		orderDTO odto = new orderDTO();
		odto.setMemberName(dto.getMemberName());
		odto.setItemId(itemId);
		odto.setOrderPrice(orderPrice);
		odto.setSellerName(pdto.getMemberName());
		
		service.submitOrderProcess(odto);
		service.itemSoldProcess(itemId);
		service.plusBuyCountProcess(dto);
		service.plusSellCountProcess(pdto);
		System.out.println("transaction done");
		mav.setViewName("redirect:/itemViewPage.do?itemId=" + itemId);
		return mav;
	}

	// 김녹훈 end //////////////////////////////////////////

	
	
	
	
	// 김소정 start ////////////////////////////////

	@RequestMapping("/header.do")
	public ModelAndView headerPage(ModelAndView mav) {
		mav.setViewName("header");
		return mav;
	}

	// 로그인 하면

	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public ModelAndView loginCheckMethod(memberDTO dto, HttpSession session, ModelAndView mav) {
		int login = service.idCheckProcess(dto);
		System.out.println(login);
		if(login == 0) {
			System.out.println("login is null");
			mav.addObject("noId", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		memberDTO mdto = service.infoByIdProcess(dto);
		boolean cancel = service.cancelCheckProcess(mdto);
		boolean flag = service.flagCheckProcess(mdto);
		int itemFlag = service.itemFlagCheckProcess(mdto);
		if(cancel || flag) {
			if(cancel) {
				mav.addObject("cancelMember", "1");
			} else if(flag) {
				mav.addObject("flagMember", "1");
			}
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		} else if(itemFlag >= 5) {
			mav.addObject("itemFlag", 1);
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
		boolean result = service.loginCheck(dto, session);
		mav.addObject("memberList", result);
		System.out.println(session.getId());
		System.out.println("logindo");
		if (result == true) {
			session.setAttribute("logOk", "ok");
			session.setAttribute("id", dto.getMemberId());// 세션에 아이디저장
			session.setAttribute("memberName", mdto.getMemberName());
			mav.addObject("msg", "success");
			mav.addObject("itemList", service.selectProcess());
			mav.setViewName("redirect:/mainPage.do");
		} else {
			mav.addObject("msg", "failure");
			mav.setViewName("redirect:/mainPage.do");
		}

		return mav;


	}//

	@RequestMapping("/logout.do")
	public ModelAndView logout(ModelAndView mav, HttpSession session) {
		// service.logout(session);
		session.removeAttribute("logOk");
		session.removeAttribute("id");
		session.removeAttribute("memberName");
		session.invalidate();
		mav.addObject("msg", "logout");
		mav.addObject("itemList", service.selectProcess());
		mav.setViewName("mainPage");
		return mav;
	}

	// 회원가입
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public ModelAndView signupProcess(ModelAndView mav, memberDTO dto, HttpServletRequest req) {
		
		if(service.idCheckProcess(dto) != 0) {
			mav.addObject("existId", 1);
			mav.setViewName("redirect:/signupPage.do");
			return mav;
		}
		
		UUID random = UUID.randomUUID();
		String name = random.toString().substring(0, 8);
		dto.setMemberName(name);
		dto.setNickname(name);
		dto.setProfileImg("log.png");
		service.signupProcess(dto);
		System.out.println(dto.getMemberName());
		service.signupStatusProcess(dto);
		mav.addObject("msg", "success");
		
		HttpSession session = req.getSession();
		session.setAttribute("logOk", "ok");
		session.setAttribute("id", dto.getMemberId());// 세션에 아이디저장
		session.setAttribute("memberName", dto.getMemberName());
		
		mav.addObject("itemList", service.selectProcess());
		mav.setViewName("redirect:/mainPage.do");
		return mav;
	}

	@RequestMapping("/signupPage.do")
	public ModelAndView signupListPage(ModelAndView mav) {

		mav.setViewName("signupPage");
		return mav;

	} // end signupListPage()

	/*
	 * @RequestMapping(value="/signup.do",method=RequestMethod.POST) public
	 * ModelAndView signupPage(ModelAndView mav, memberDTO dto) {
	 * service.signupProcess(dto); mav.setViewName("redirect:/mainPage.do"); return
	 * mav;
	 * 
	 * 
	 * } // end signupPage()
	 */
	/* 회원가입 약관 페이지 */
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
		mav.addObject("boardList", service.listProcess());
		mav.setViewName("helpPage");
		return mav;

	} // end helpListPage()

	@RequestMapping(value = "/helpNoticeWrite.do", method = RequestMethod.GET)
	public ModelAndView helpListWritedo(ModelAndView mav, boardDTO dto) {
		mav.addObject("boardDTO", dto);
		mav.addObject("boardList", service.listProcess());
		mav.setViewName("helpNoticeWrite");
		return mav;
	}

	@RequestMapping(value = "/helpNoticeWrite.do", method = RequestMethod.POST)
	public ModelAndView writeProMethod(boardDTO dto, HttpServletRequest request, ModelAndView mav) {
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

	@RequestMapping(value = "/helpNoticeUpdate.do", method = RequestMethod.GET)
	public ModelAndView helpListNoticeUpdate(int num, ModelAndView mav) {
		mav.addObject("boardList", service.contentProcess(num));

		mav.setViewName("helpNoticeUpdate");

		return mav;

	}

	@RequestMapping(value = "/helpNoticeUpdate.do", method = RequestMethod.POST) // update.jsp post이기때문
	public ModelAndView updateProMethod(boardDTO dto, HttpServletRequest request, ModelAndView mav) {

		service.updateProcess(dto);

		mav.setViewName("redirect:/helpPage.do");
		return mav;
	}// updateProMethod

	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteMethod(int num, HttpServletRequest request, ModelAndView mav) {

		service.deleteProcess(num);

		mav.setViewName("redirect:/helpPage.do");
		return mav;

	}

	@RequestMapping(value = "/helpPage.do", method = RequestMethod.POST) // update.jsp post이기때문
	public ModelAndView questionProMethod(questionDTO dto, HttpServletRequest request, ModelAndView mav) {

		service.questioninsertProcess(dto);

		mav.setViewName("redirect:/helpPage.do");
		return mav;
	}// updateProMethod

	// 김소정 end ////////////////////////////////

	// 마정협 start /////////////////////////////////

	//사진파일 업로드를 위한
	@RequestMapping("/itemUpload.do")
	public ModelAndView itemUploadPage(ModelAndView mav,itemDTO dto,itemCategoryDTO dtos, HttpSession session, HttpServletRequest request) {
		 
		MultipartFile file = dto.getFilepath();
		if (file != null) {
			String fileName = file.getOriginalFilename();
			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			String saveDirectory = filePath(request);
			File fe = new File(saveDirectory);
			if (!fe.exists()) {
				fe.mkdir();
			}
			
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			dto.setItemImagePath(random + "_" + fileName);
		}
		memberDTO mdto = new memberDTO();
		mdto.setMemberId(session.getAttribute("id").toString());
		memberDTO pdto = service.infoByIdProcess(mdto);
		
		dto.setMemberName(pdto.getMemberName());
		service.itemUploadProcess(dto);
		
		/*mav.addObject("user", service.memberInfoProcess(pdto));
		mav.addObject("want", service.checkWantItemProcess(pdto));*/
		if (service.itemCurrvalProcess(pdto).size() != 0) {
			mav.addObject("currval", service.itemCurrvalProcess(pdto).get(0).getItemId());
		}
		int id = service.itemCurrvalProcess(pdto).get(0).getItemId();
		
		/*mav.addObject("item", service.itemviewProcess(id));
		mav.addObject("itemCat", service.itemCatProcess(id));
		mav.addObject("member", service.itemMemberProcess(id));*/
		service.itemViewCntProcess(id);
		/*mav.addObject("memberStat", service.itemMemberStatProcess(id));
		mav.addObject("uploadview",service.uploadViewProcess());*/
		
		mav.addObject("itemId", id);
		mav.setViewName("redirect:/itemViewPage.do");
		return mav;
	}
	
	//페이지이동
	@RequestMapping("/itemUploadPage.do")
	public ModelAndView itemUploadProcess(ModelAndView mav, HttpSession session, itemDTO idto) {
		memberDTO dto = new memberDTO();
		dto.setMemberId(session.getAttribute("id").toString());
		mav.addObject("member", service.infoByIdProcess(dto));
		mav.addObject("item", idto);
		mav.setViewName("itemUploadPage");
		return mav;
	}
	// http://localhost:8090/sapare/adminPage.do
	// 관리자 페이지
	@RequestMapping("/adminPage.do")
	public ModelAndView adminPageProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			System.out.println("admin success");
			List<itemCategoryDTO> counts = service.countCategoeyProcess();
			mav.addObject("count", counts);
			mav.setViewName("adminPage");
			return mav;
		} else {
			System.out.println("admin failed");
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 관리자 회원정보 페이지
	// 회원정보 불러오기
	// http://localhost:8090/sapare/adminMember.do
	@RequestMapping("/adminMember.do")
	public ModelAndView adminMemberProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			mav.addObject("adminok", 1);
			mav.addObject("memberJo", service.memberLookupProcess());
			mav.setViewName("adminMember");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 회원 탈퇴 시키기
	@RequestMapping("/adminMemberDelete.do")
	public ModelAndView adminMemberDeleteProcess(ModelAndView mav, String memberId, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			service.MemberDeleteProcess(memberId);
			mav.addObject("memberJo", service.memberLookupProcess());
			mav.setViewName("adminMember");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 회원정보 이름순으로 불러오기
	@RequestMapping("/adminMemberorder.do")
	public ModelAndView adminMemberOrderProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			mav.addObject("memberJo", service.memberIdOrderProcess());
			mav.setViewName("adminMember");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}
	// 회원정보 가입일순으로 불러오기
	@RequestMapping("/adminDateOrder.do")
		public ModelAndView adminDateOrderProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			mav.addObject("memberJo", service.memberDateOrderProcess());
			mav.setViewName("adminMember");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}
	
	// 회원정보 등급순으로 불러오기
	@RequestMapping("/adminRankOrder.do")
		public ModelAndView adminRankOrderProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			mav.addObject("memberJo", service.memberRankOrderProcess());
			mav.setViewName("adminMember");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 관리자 회원신고내역 페이지
	// http://localhost:8090/sapare/adminMemberFlag.do
	@RequestMapping("/adminMemberFlag.do")
	public ModelAndView adminMemberFlagProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			mav.addObject("memberFlag", service.memberFlagProcess());
			mav.setViewName("adminMemberFlag");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 회원신고 처리 메소드
	@RequestMapping("/memberFlagUpdate.do")
	public ModelAndView memberFlagUpdateProcess(ModelAndView mav, int memberFlagNo, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			service.memberFlagUpdateProcess(memberFlagNo);
			mav.addObject("memberFlag", service.memberFlagProcess());
			mav.setViewName("adminMemberFlag");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}
	
	// 회원신고 보류
	@RequestMapping("/memberFlagHold.do")
	public ModelAndView memberFlagHoldProcess(ModelAndView mav, int memberFlagNo, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			service.memberFlagHoldProcess(memberFlagNo);
			mav.addObject("memberFlag", service.memberFlagProcess());
			mav.setViewName("adminMemberFlag");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 관리자 게시글신고내역 페이지
	// http://localhost:8090/sapare/adminItemFlag.do
	@RequestMapping("/adminItemFlag.do")
	public ModelAndView adminItemFlagProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			mav.addObject("itemFlag", service.itemFlagProcess());
			mav.setViewName("adminItemFlag");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}
	
	// 게시글신고 처리 메소드
	@RequestMapping("/itemFlagUpdate.do")
	public ModelAndView itemFlagUpdateProcess(ModelAndView mav, int itemFlagNo, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			service.itemFlagUpdateProcess(itemFlagNo);
			mav.addObject("itemFlag", service.itemFlagProcess());
			mav.setViewName("adminItemFlag");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}
	
	// 게시글신고 보류
	@RequestMapping("/itemFlagHold.do")
	public ModelAndView itemFlagHoldProcess(ModelAndView mav, int itemFlagNo, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			service.itemFlagHoldProcess(itemFlagNo);
			mav.addObject("itemFlag", service.itemFlagProcess());
			mav.setViewName("adminItemFlag");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 관리자 메세지 페이지
	@RequestMapping("/adminMessage.do")
	public ModelAndView adminMessageProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName").equals("admin")){
			mav.addObject("Messages",service.questionMessageProcess());
			mav.setViewName("adminMessage");
			return mav;
		} else {
			mav.setViewName("redirect:/mainPage.do");
			return mav;
		}
	}

	// 마정협 end /////////////////////////////////

	// 오용준 start /////////////////////////////////

	@RequestMapping("/itemViewPage.do")
	public ModelAndView itemViewPage(ModelAndView mav, int itemId, HttpSession session) {

		memberDTO dto = new memberDTO();
		if(session.getAttribute("id") != null) {
			dto.setMemberId(session.getAttribute("id").toString());
			memberDTO mdto = service.infoByIdProcess(dto);
			mdto.setItemId(itemId);
			mav.addObject("user", service.memberInfoProcess(mdto));
			mav.addObject("want", service.checkWantItemProcess(mdto));
		}
		
		mav.addObject("item", service.itemviewProcess(itemId));
		mav.addObject("itemCat", service.itemCatProcess(itemId));
		mav.addObject("member", service.itemMemberProcess(itemId));
		mav.addObject("itemList", service.selectProcess());
		service.itemViewCntProcess(itemId);
		mav.addObject("memberStat", service.itemMemberStatProcess(itemId));
		/*if (service.itemCurrvalProcess(dto).size() != 0) {
			mav.addObject("currval", service.itemCurrvalProcess(dto).get(1).getItemId());
		}*/
		mav.setViewName("itemViewPage");
		return mav;

	}

	// 신고하기 광고
	@RequestMapping(value = "/itemflag.do", method = RequestMethod.POST)
	public ModelAndView itemflagMethod(itemFlagDTO dto, ModelAndView mav, HttpSession session) {
		// Session 값의 로그인 되어 있는 회원의 memberName을 가지고 와서 아래의 dto에 넣어준다
		String id = (String) session.getAttribute("id");
		dto.setItemFlaggerName(id);
		service.itemflaginsertProcess(dto);
		service.plusItemFlagProcess(dto);
		mav.setViewName("redirect:/itemViewPage.do?flag=d&itemId=" + dto.getItemId());
		return mav;
	}//
		// 신고하기 물품정보부정확

	@RequestMapping(value = "/itemflag2.do", method = RequestMethod.POST)
	public ModelAndView itemflagMethod2(itemFlagDTO dto, ModelAndView mav, HttpSession session) {

		// Session 값의 로그인 되어 있는 회원의 memberName을 가지고 와서 아래의 dto에 넣어준다

		String id = (String) session.getAttribute("id");
		dto.setItemFlaggerName(id);
		service.itemflaginsertProcess(dto);
		service.plusItemFlagProcess(dto);
		mav.setViewName("redirect:/itemViewPage.do?flag=d&itemId=" + dto.getItemId());
		return mav;
	}//

	// 신고하기 거래금지
	@RequestMapping(value = "/itemflag3.do", method = RequestMethod.POST)
	public ModelAndView itemflagMethod3(itemFlagDTO dto, ModelAndView mav, HttpSession session) {

		// Session 값의 로그인 되어 있는 회원의 memberName을 가지고 와서 아래의 dto에 넣어준다
		String id = (String) session.getAttribute("id");
		dto.setItemFlaggerName(id);
		service.itemflaginsertProcess(dto);
		service.plusItemFlagProcess(dto);
		mav.setViewName("redirect:/itemViewPage.do?flag=d&itemId=" + dto.getItemId());
		return mav;
	}//

	// 신고하기 언어폭력
	@RequestMapping(value = "/itemflag4.do", method = RequestMethod.POST)
	public ModelAndView itemflagMethod4(itemFlagDTO dto, ModelAndView mav, HttpSession session) {

		// Session 값의 로그인 되어 있는 회원의 memberName을 가지고 와서 아래의 dto에 넣어준다
		String id = (String) session.getAttribute("id");
		dto.setItemFlaggerName(id);
		service.itemflaginsertProcess(dto);
		service.plusItemFlagProcess(dto);
		mav.setViewName("redirect:/itemViewPage.do?flag=d&itemId=" + dto.getItemId());
		return mav;
	}//

	// 신고하기 기타
	@RequestMapping(value = "/itemflag5.do", method = RequestMethod.POST)
	public ModelAndView itemflagMethod5(itemFlagDTO dto, ModelAndView mav, HttpSession session) {

		// Session 값의 로그인 되어 있는 회원의 memberName을 가지고 와서 아래의 dto에 넣어준다
		String id = (String) session.getAttribute("id");
		dto.setItemFlaggerName(id);
		service.itemflaginsertProcess(dto);
		service.plusItemFlagProcess(dto);
		mav.setViewName("redirect:/itemViewPage.do?flag=d&itemId=" + dto.getItemId());
		return mav;
	}
	
	@RequestMapping("/deleteItem.do")
	public ModelAndView deleteItem(int itemId, HttpServletRequest request, ModelAndView mav) {

		service.deleteItemProcess(itemId);
		mav.setViewName("redirect:/mainPage.do");
		return mav;

	}
	
	@RequestMapping("/updateItem.do")
	public ModelAndView updateItem(itemDTO dto, HttpServletRequest request, ModelAndView mav) {
		
		// 이미지 담을 서버 폴더 **바꾸어야 한다**
		/*String uploadPath2 = "C:\\study\\workspace_spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\sapareMarketProject\\image";*/
		
		MultipartFile file = dto.getFilepath();
		if (file != null) {
			String fileName = file.getOriginalFilename();
			// 중복파일명을 처리하기 위해 난수 발생
			UUID random = UUID.randomUUID();
			String saveDirectory = filePath(request);
			System.out.println(saveDirectory);
			File fe = new File(saveDirectory);
			if (!fe.exists()) {
				fe.mkdir();
			}
			
			File ff = new File(saveDirectory, random + "_" + fileName);
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(ff));
			} catch (IOException e) {
				e.printStackTrace();
			}
			dto.setItemImagePath(random + "_" + fileName);
		}
		System.out.println(dto.getItemImagePath());
		service.updateItemProcess(dto);
		service.updateItemCatProcess(dto);
		mav.addObject("itemId", dto.getItemId());
		mav.setViewName("redirect:/itemViewPage.do");
		return mav;

	}

	@RequestMapping("/itemViewPage2.do")
	public ModelAndView itemViewPage2(ModelAndView mav) {

		mav.setViewName("itemViewPage2");
		return mav;

	}
	
	// 상품 찜 클릭 기능 ajax
	@RequestMapping("/clickWantProcess.do")
	public itemDTO clickWantProcess(memberDTO dto, HttpServletRequest request) {
		service.clickWantProcess(dto);
		service.addWantCntProcess(dto);
		return service.itemviewProcess(dto.getItemId());
	}
	// 상품 찜 다시 클릭(찜 목록에서 뺀다) 기능 ajax
	@RequestMapping("/unclickWantProcess.do")
	public itemDTO unclickWantProcess(memberDTO dto, HttpServletRequest request) {
		service.unclickWantProcess(dto);
		service.subtWantCntProcess(dto);
		return service.itemviewProcess(dto.getItemId());
	}
	
	// 오용준 end ///////////////////////////////////

	// 오정우 start /////////////////////////////////

	@RequestMapping("/mainPage.do")
	public ModelAndView mainPageProcess(ModelAndView mav, HttpSession session) {
		if(session.getAttribute("memberName") != null) {
			memberDTO dto = new memberDTO();
			dto.setMemberName(session.getAttribute("memberName").toString());
			mav.addObject("wantList", service.wantItemMiniProcess(dto));
		}
		mav.addObject("itemList", service.selectProcess());
		mav.setViewName("mainPage");
		return mav;

	} // end

	@RequestMapping("/search.do")
	public ModelAndView searchProcess(ModelAndView mav, itemDTO dto, HttpSession session) {
		if(session.getAttribute("id") != null) {
			memberDTO mdto = new memberDTO();
			mdto.setMemberName(session.getAttribute("memberName").toString());
			mav.addObject("wantList", service.wantItemMiniProcess(mdto));
		}
		mav.addObject("searchWord", dto.getSearchWord());
		mav.addObject("searchList", service.searchProcess(dto));
		mav.setViewName("searchPage");
		return mav;

	} // end

	//카테고리 검색페이지
	@RequestMapping("/searchcategory.do")
	public ModelAndView searchcategoryProcess(ModelAndView mav, itemDTO dto, HttpSession session) {
		if(session.getAttribute("id") != null) {
			memberDTO mdto = new memberDTO();
			mdto.setMemberName(session.getAttribute("memberName").toString());
			mav.addObject("wantList", service.wantItemMiniProcess(mdto));
		}
		mav.addObject("searchWord", dto.getSearchWord());
		mav.addObject("searchList", service.searchCategoryProcess(dto));
		mav.setViewName("searchPage");
		return mav;
	}

	// 오정우 end /////////////////////////////////

	// 표다몬 start /////////////////////////////////

	@RequestMapping("/start.do")
	@ResponseBody
	public List<chatviewDTO> process( String memberName) throws IOException {
		List<chatviewDTO> aa = service.friendProcess(memberName);
		List<chatviewDTO> bb = service.LogProcess(memberName);
		System.out.println("aa size: "+aa.size());
		System.out.println("bb size: "+bb.size());
		for (int i = 0; i < aa.size(); i++) {
			for (int j = 0; j < bb.size(); j++)
				if (aa.get(i).getChatRoomId() == bb.get(j).getChatRoomId()) {
					int b = bb.get(j).getIsreadcount();
					aa.get(i).setIsreadcount(b);
					System.out.println(bb.get(j).getIsreadcount());
					System.out.println(aa.get(i).getIsreadcount()+"aa "+ aa.get(i).getMemberName());
					break;
				}
		}
		return aa;
	}
	@RequestMapping("/addstart.do")
	@ResponseBody
	public List<chatviewDTO> addprocess(String itemId,String memberName) throws IOException {
		chatRoomDTO dto = new chatRoomDTO();
		System.out.println("실행");
		System.out.println(memberName);
		String a = service.itemMemNameProcess(Integer.parseInt(itemId));
		System.out.println(a);
		dto.setItemMemberName(a);
		dto.setItemId(Integer.parseInt(itemId));
		dto.setMemberName(memberName);
		service.RoomAddProcess(dto);
		List<chatviewDTO> aa = service.friendProcess(dto.getMemberName());
		List<chatviewDTO> bb = service.LogProcess(dto.getMemberName());
		System.out.println("aa size: "+aa.size());
		System.out.println("bb size: "+bb.size());
		for (int i = 0; i < aa.size(); i++) {
			for (int j = 0; j < bb.size(); j++)
				if (aa.get(i).getChatRoomId() == bb.get(j).getChatRoomId()) {
					aa.get(i).setIsreadcount(bb.get(j).getIsreadcount());
					System.out.println(bb.get(j).getIsreadcount());
					break;
				}
		}
		return aa;
	}
	
	@ResponseBody
	@RequestMapping(value = "/chatOpen.do")
	public List<chatMsgDTO> chatOpenPage(String roomNum) {
		return service.msgProcess(Integer.parseInt(roomNum));

	}

	@ResponseBody
	@RequestMapping(value = "/chatFrameOpen.do")
	public chatviewDTO chatFrameOpen(String roomNum, String memberid, String status, String fid) {
		chatviewDTO dto = new chatviewDTO();
		chatviewDTO fdto = new chatviewDTO();
		dto.setChatRoomId(Integer.parseInt(roomNum));
		dto.setMemberName(memberid);
		fdto.setChatRoomId(dto.getChatRoomId());
		fdto.setMemberName(fid);
		System.out.println(fid);
		System.out.println(fdto.getChatRoomId());

		System.out
				.println(status + " 접속" + " roomNum : " + dto.getChatRoomId() + " memberName : " + dto.getMemberName());
		if (status.equals("on")) {
			service.enterTimeProcess(dto);
System.out.println("입장시간 반환");
			return service.fenterTimeProcess(fdto);
		} else if (status.equals("off")) {
			service.exitTimeProcess(dto);
			return null;
		} else
			return null;
	}
	
	
	// 표다몬 end /////////////////////////////////

} // end class