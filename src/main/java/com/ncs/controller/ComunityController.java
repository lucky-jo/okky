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
	
	@RequestMapping(value = "/insert")
	public ModelAndView insert(ModelAndView mv, ComunityVO vo) {
		if(service.insert(vo)>0) {
//			mv.addObject("detail",service.selectOne(vo));
//			mv.setViewName("comunity/cdetail");
			mv.setViewName("redirect:/comunity/detail?seq="+vo.getSeq());
		}else {
			mv.addObject("fCode","BI");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	@RequestMapping(value = "/cinsert")
	public void insertf() {
	
	}
	
	@RequestMapping(value = "/detail")
	public ModelAndView detail(ModelAndView mv, ComunityVO vo) {
		vo = service.selectOne(vo);
		
			mv.addObject("detail",vo);
			mv.setViewName("comunity/cdetail");
			return mv;
	}
	
	
	
	@RequestMapping(value = "/update")
	public ModelAndView update(ModelAndView mv, ComunityVO vo) {
		if(service.update(vo) > 0) {
			mv.setViewName("redirect:/comunity/detail?seq="+vo.getSeq());
		}else {
			mv.addObject("fCode","BU");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	@RequestMapping(value = "/updatef")
	public ModelAndView updatef(ModelAndView mv, ComunityVO vo) {
	
		vo = service.selectOne(vo);
		if(vo != null) {
			mv.addObject("detail", vo);
			mv.setViewName("comunity/cupdate");
		}else {
			mv.addObject("fCode","BN");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	
	@RequestMapping(value = "/delete")
	public ModelAndView delete(ModelAndView mv, ComunityVO vo) {
		System.out.println(vo);
		if(service.delete(vo) > 0) {
			mv.setViewName("redirect:/comunity/list");
		}else {
			mv.addObject("fCode", "BD");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
}
