package com.ncs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ComunityService;
import com.ncs.vo.ComunityVO;

@RequestMapping(value = "/comunity/")
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
	
	@RequestMapping(value = "/insert" , method = RequestMethod.POST)
	public ModelAndView insert(ModelAndView mv, ComunityVO vo) {
		if(service.insert(vo)>0) {
			mv.addObject("새 글이 등록 되었습니다");
			mv.setViewName("comunity/cdetail");
		}else {
			mv.addObject("제목을 입력해주세요");
			mv.setViewName("comunity/cinsert");
		}
		return mv;
	}
	
	@RequestMapping(value = "/cinsert" , method = RequestMethod.GET)
	public void insertf() {
	
	}
	
	@RequestMapping(value = "/detail")
	public ModelAndView detail(ModelAndView mv, ComunityVO vo) {
		vo = service.selectOne(vo);
		
			mv.addObject("detail",vo);
			mv.setViewName("comunity/cdetail");
			return mv;
	}
}
