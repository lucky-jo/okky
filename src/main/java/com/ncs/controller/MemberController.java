package com.ncs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class MemberController {

	
	@RequestMapping("/home")
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("home");
		return mv;
	}

}