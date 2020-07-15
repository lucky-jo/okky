package com.ncs.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.ncs.security.CustomUserDetailsService;
import com.ncs.service.MemberService;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.AuthKeyDTO;
import com.ncs.vo.AuthVO;
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

    @RequestMapping(value = "/customLogin",method = RequestMethod.GET)
    public void getLogin() {
    }

//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public String postLogin(MemberVO vo) {
//        memberService.read(vo.getUserid());
//
//
//        return "redirect:/index";
//    }

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
    		mv.addObject("message","fail");
    }else {
    	mv.addObject("massage","200");
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
    
}
