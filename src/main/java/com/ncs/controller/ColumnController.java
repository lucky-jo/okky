package com.ncs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ColumnService;
import com.ncs.vo.ColumnVO;

@RequestMapping("/column/*")
@Controller
public class ColumnController {
	
	@Autowired
	ColumnService service;
	
	
	
	
	
	@RequestMapping(value = "/insert")
	public ModelAndView list(ModelAndView mv, ColumnVO vo) {
		if (service.insert(vo)>0) {
			mv.setViewName("");
		}else {
			mv.addObject("");
			mv.setViewName("");
		}
		return mv;
	}

}
