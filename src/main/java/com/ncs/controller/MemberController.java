package com.ncs.controller;

import com.ncs.security.CustomUserDetailsService;
import com.ncs.service.MemberService;
import com.ncs.vo.MemberVO;
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

import javax.servlet.http.HttpServletRequest;

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
    public String postRegister(MemberVO vo){
        String[] image = {"1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg"};
        vo.setImage(image[(int)(Math.random()*9)]);
        System.out.println(vo.getImage());
        vo.setUserpw(bCryptPasswordEncoder.encode(vo.getUserpw()));
        memberService.register(vo);
        return "redirect:/index";
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/info")
    public ModelAndView info( ModelAndView mv, MemberVO memberVO ){
    	memberVO = memberService.get(memberVO.getUserid());
        mv.addObject("member", memberVO);
        System.out.println(memberVO);
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

}
