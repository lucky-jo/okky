package com.ncs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ComunityService;
import com.ncs.vo.ComunityVO;

@RequestMapping(value = "/comunity/*")
@Controller
public class ComunityController {

	@Autowired
	ComunityService service;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mv) {
		List<ComunityVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana",list);
		}else {
			mv.addObject("message","등록 된 글이 없습니다");
		}
		mv.setViewName("comunity/clist");
		return mv;
	}
}
