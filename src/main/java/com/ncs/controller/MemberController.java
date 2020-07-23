package com.ncs.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.ncs.security.CustomUserDetailsService;
import com.ncs.service.MemberService;
import com.ncs.snslog.NaverLoginBO;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.AuthKeyDTO;
import com.ncs.vo.MemberVO;

@RequestMapping(value = "/member")
@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    CustomUserDetailsService customUserDetailsService;
    
    // NaverLoginBO
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
    }
    
    
	/*
	 * @RequestMapping(value = "/customLogin",method = RequestMethod.GET) public
	 * void getLogin() { }
	 */

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String postLogin(MemberVO vo) {
        memberService.read(vo.getUserid());


        return "redirect:/index";
    }
    
    // 로그인 첫화면 요청 메소드
    @RequestMapping(value = "/customLogin", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView naverLogin(ModelAndView mv, HttpSession session) {
    	// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출
    	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
    	System.out.println("네이버:"+naverAuthUrl);
    	mv.setViewName("member/customLogin");
    	mv.addObject("url", naverAuthUrl);
    	
    	return mv;
    }
    
    // 로그인 성공시 callback 호출 메소드
    @RequestMapping(value = "/callback", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView callback(ModelAndView mv, @RequestParam String code, @RequestParam String state,HttpSession session)
    		throws IOException, ParseException {
    	System.out.println("callback");
    	OAuth2AccessToken oauthToken;
    	oauthToken = naverLoginBO.getAccessToken(session, code, state);
    	// 1. 로그인 사용자 정보 읽어오기
    	apiResult = naverLoginBO.getUserProfile(oauthToken); //String 형식의 json 데이터
    	// 2. String 형식인 apiResult를 json 형태로 바꿈
    	JSONParser parser = new JSONParser();
    	Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		// 3. 데이터 파싱
		//Top레벨 단계 _response 파싱
				JSONObject response_obj = (JSONObject) jsonObj.get("response");
		//response의 nickname값 파싱
				String nickname = (String) response_obj.get("nickname");
				System.out.println(nickname);
		//4.파싱 닉네임 세션으로 저장
				session.setAttribute("sessionId", nickname); // 세션 생성
				mv.addObject("result", apiResult);
				mv.setViewName("member/customLogin");
		
		return mv;
    }
    
    //로그아웃
  	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
  	public String logout(HttpSession session) throws IOException {
  		System.out.println("여기는 logout");
  		session.invalidate();
  		return "redirect:index.jsp";
  	}
  	
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public void getRegister(){
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String postRegister(MemberVO vo, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
        String[] image = {"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg"};
        vo.setImage(image[(int)(Math.random()*9)]);
        System.out.println(vo.getImage());
        vo.setUserpw(bCryptPasswordEncoder.encode(vo.getUserpw()));
        memberService.register(vo);
        return "redirect:/index";
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/info")
    public ModelAndView info( ModelAndView mv, MemberVO memberVO, SearchCriteria cri){
    	memberVO = memberService.get(memberVO.getUserid());
        mv.addObject("member", memberVO);
        System.out.println(memberVO);
        
//        List<QnaVO> historyBoardList = memberService.historyBoardList(cri);
//        for (QnaVO qnaVO : historyBoardList) {
//			System.out.println(qnaVO);
//		}
//        mv.addObject("historyBoardList",historyBoardList);
//        int sum = 0;
//        List<Integer> historyRowCount = memberService.historyRowCount(cri);
//        for (Integer integer : historyRowCount) {
//			sum += integer;
//		}
//        PageMaker pageMaker = new PageMaker();
//        pageMaker.setCri(cri);
//        pageMaker.setTotalRow(sum);
//
//        mv.addObject("pageMaker",pageMaker);
        
        return mv;
    }

//    @PreAuthorize("principal.username == #memberVO.userid")
    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public ModelAndView postEdit(MemberVO memberVO, ModelAndView mv){
        memberService.edit(memberVO);
        mv.setViewName("member/edit");
        return mv;
    }
    
//    @PreAuthorize("principal.username == #memberVO.userid")
    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(ModelAndView mv, MemberVO memberVO ) {
    	return mv;
    }

    @RequestMapping(value = "/passwordChage", method = RequestMethod.POST )
    public String postPasswordChange(@RequestParam("password") String password, @RequestParam("passwordConfirm") String passwordConfirm , MemberVO memberVO) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        if (bCryptPasswordEncoder.matches(memberVO.getUserpw(),memberService.get(request.getRemoteUser()).getUserpw()) && password.equals(passwordConfirm) ) {
            memberVO.setUserid(request.getRemoteUser());
            memberVO.setUserpw(bCryptPasswordEncoder.encode(password));
            memberService.passwordChange(memberVO);
        }
        return "redirect:/index";
    }
    
//    @PreAuthorize("principal.username == #memberVO.userid")
    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/passwordChange" ,method = RequestMethod.GET )
    public void getPasswordChange(ModelAndView mv, MemberVO memberVO ) {
    }

    @RequestMapping(value = "/customLogout", method = RequestMethod.GET )
    public void getCustomLogout() {
    }

    @RequestMapping(value = "/useridDuplicate")
    public ModelAndView useridDuplicate(ModelAndView mv, MemberVO memberVO){
        if (memberService.useridDuplicate(memberVO) > 0 ) {
            mv.addObject("message","fail");
        } else {
            mv.addObject("message","200");
        }
        mv.setViewName("jsonView");
        return mv;

    }

    @RequestMapping(value = "/authKey", method = RequestMethod.GET )
    public ModelAndView authkey(ModelAndView mv, AuthKeyDTO authKeyDTO){
        if (memberService.getAuth(authKeyDTO) == 1 ) {
            mv.addObject("message","환영합니다.");
            mv.setViewName("member/wellcome");
        }
        return mv;

    }

    @RequestMapping(value = "/nicknameDuplicate")
    public ModelAndView nicknameDuplicate(ModelAndView mv, MemberVO memberVO){
        if (memberService.nicknameDuplicate(memberVO) > 0 ) {
            mv.addObject("message","fail");
        } else {
            mv.addObject("message","200");
        }
        mv.setViewName("jsonView");
        return mv;

    }
    
    @RequestMapping(value = "/emailDuplicate")
    public ModelAndView emailDuplicate(ModelAndView mv, MemberVO memberVO){
        if (memberService.emailDuplicate(memberVO) > 0 ) {
            mv.addObject("message","fail");
        } else {
            mv.addObject("message","200");
        }
        mv.setViewName("jsonView");
        return mv;

    }

    @RequestMapping(value = "/sendauthkey")
    public ModelAndView sendAuthkey(ModelAndView mv, AuthKeyDTO authdto) {
    	if(memberService.sendAuthkey(authdto) > 0) {
    		mv.addObject("message","200");
    		System.out.println("성공");
    }else {
    	mv.addObject("massage","fail");
    }
    	mv.setViewName("jsonView");
    	return mv;
    }
    
    @RequestMapping(value = "/authkeycheck")
    public ModelAndView authKeycheck(ModelAndView mv, AuthKeyDTO authdto) {
    	System.out.println(authdto.toString());
    	if(memberService.authKeyCheck(authdto) > 0) {
    		mv.addObject("message", "200");
    		System.out.println("성공");
    	}else {
    		mv.addObject("message", "fail");
    		System.out.println("실패");
    	}
    	mv.setViewName("jsonView");
    	return mv;
    }
    
    @RequestMapping(value = "/find")
    public ModelAndView find(ModelAndView mv, MemberVO vo) {
    	if(memberService.sendFindId(vo) > 0) {
    		mv.addObject("email",vo.getEmail());
    		mv.addObject("message", "200");
    	}else {
    		mv.addObject("massage","fail");
    	}
    	mv.setViewName("jsonView");
    	return mv;
    }
    
    @RequestMapping(value = "/findForm")
    public ModelAndView findForm(ModelAndView mv) {
    	mv.setViewName("member/find");
    	return mv;
    }
    
    @RequestMapping(value = "/pwfind")
    public ModelAndView pwfind(ModelAndView mv, MemberVO vo) {
    	System.out.println("ddd"+vo);
    	if(memberService.sendFindPassword(vo)>0) {
     		mv.addObject("message", "200");
     		System.out.println("200");
     		System.out.println(vo);
    	}else {
    		mv.addObject("massage","fail");
    		System.out.println("fail");
    	}
    	mv.setViewName("jsonView");
    	System.out.println("return mv");
    	return mv;
    }
    
    @RequestMapping(value = "/pwFindForm")
    public ModelAndView pwfindForm(ModelAndView mv) {
    	mv.setViewName("member/pwFind");
    	return mv;
    }
}
