package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import dto.boardDTO;
import dto.itemDTO;
import org.springframework.web.bind.annotation.RequestMethod;

import service.SapareService;

// http://localhost:8090/sapare/mainPage.do
// http://localhost:8090/sapare/profileSell.do

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

	@RequestMapping("/profileSell.do")
	public ModelAndView profileSellPageProcess(ModelAndView mav) {
		
		mav.setViewName("profileSellPage");
		return mav;
		
	} // end boardListPage()
	
	@RequestMapping("/profileBuy.do")
	public ModelAndView profileBuyPageProcess(ModelAndView mav) {
		
		mav.setViewName("profileBuyPage");
		return mav;
		
	} // end boardListPage()
	
	@RequestMapping("/profileWant.do")
	public ModelAndView profileWantPageProcess(ModelAndView mav) {
		
		mav.setViewName("profileWantPage");
		return mav;
		
	} // end boardListPage()
	
	@RequestMapping("/profileReview.do")
	public ModelAndView profileReviewPageProcess(ModelAndView mav) {
		
		mav.setViewName("profileReviewPage");
		return mav;
		
	} // end boardListPage()
	
	@RequestMapping("/profileSetting.do")
	public ModelAndView profileSettingPageProcess(ModelAndView mav) {
		
		mav.setViewName("profileSettingPage");
		return mav;
		
	} // end boardListPage()
	
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