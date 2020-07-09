package com.ncs.controller;

import com.ncs.service.MemberService;
import com.ncs.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value = "/member")
@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

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
    public ModelAndView info(ModelAndView mv,MemberVO memberVO){
        memberService.get()

        return mv;
    }
}
