package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ColumnService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;

@RequestMapping(value = "/column")
@Controller
public class ColumnController {
	
	@Autowired
	ColumnService service;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
		cri.setSnoEno();
		mv.addObject("Banana", service.searchList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalRow(service.searchRowCount(cri));
		
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("column/columnList");
		return mv;
	}
	
	@RequestMapping(value = "/insert")
	public ModelAndView insert(ModelAndView mv, ColumnVO vo) {
		
		if (service.insert(vo)>0) {
//			mv.setViewName("redirect:/column/list");
			mv.setViewName("redirect:/column/detail?seq=" + vo.getSeq());
		}else {
			mv.addObject("fCode","BI");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}// insert
	
	@RequestMapping(value = "/insertf")
	public ModelAndView insertf(ModelAndView mv) {
		mv.setViewName("column/columnInsert");
		return mv;
	}
	
	@RequestMapping(value = "/detail")
	public ModelAndView detail(ModelAndView mv, ColumnVO vo) {
		
//		vo = service.selectOne(vo);
		
		if (vo!=null) {
			mv.addObject("Detail", vo);
			mv.setViewName("column/columnDetail");
		}else {
			mv.addObject("fCode","BN");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}// detail
	
	@RequestMapping(value = "/updatef")
	public ModelAndView updatef(ModelAndView mv, ColumnVO vo) {
		vo = service.selectOne(vo);
		
		if (vo!=null) {
			mv.addObject("Detail", vo);
			mv.setViewName("column/columnUpdate");
		}else {
			mv.addObject("fCode","BN");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}// updatef
	
	@RequestMapping(value="/update")
	public ModelAndView bupdate(ModelAndView mv, ColumnVO vo) {
		
		if (service.update(vo)>0)
			mv.setViewName("redirect:/column/detail?seq=" + vo.getSeq());
		else { // 실패 => doFinish.jsp
			mv.addObject("fCode","BU");
			mv.setViewName("member/doFinish");
		}
		return mv ;
	} //update
	
	@RequestMapping(value="/delete")
	public ModelAndView delete(ModelAndView mv, ColumnVO vo) {
		
		if (service.delete(vo)>0)
			mv.setViewName("redirect:/column/list");
		else {
			mv.addObject("fCode","BD");
			mv.setViewName("member/doFinish");
		}	
		return mv ;	
	} //delete
}