package com.ncs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ComunityService;
import com.ncs.service.ReplyService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;
import com.ncs.vo.ReplyVO;

@RequestMapping(value = "/comunity/")
@Controller
public class ComunityController {

	@Autowired
	ComunityService service;
	@Autowired
	ReplyService rservice;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
		cri.setSnoEno();
		mv.addObject("board",service.searchList(cri));
		
		PageMaker maker = new PageMaker();
		maker.setCri(cri);
		maker.setTotalRow(service.searchRowCount(cri));
		
		mv.addObject("maker",maker);
		mv.setViewName("comunity/list");
		return mv;
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView postInsert(ModelAndView mv, ComunityVO vo) {
		if(service.insert(vo)>0) {
//			mv.addObject("detail",service.selectOne(vo));
//			mv.setViewName("comunity/cdetail");
			mv.setViewName("redirect:/comunity/get?seq="+vo.getSeq());
		}else {
			mv.addObject("fCode","BI");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	@RequestMapping(value = "/register")
	public void getInsert() {
	
	}
	
	@RequestMapping(value = "/rinsert")
	public ModelAndView rinsert(ModelAndView mv, ComunityVO vo, ReplyVO rvo) {
		if(rservice.rinsert(rvo)>0) {
			mv.setViewName("redirect:/comunity/detail?seq="+vo.getSeq());
		}else {
			mv.addObject("fCode","BI");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	@RequestMapping(value = "/get")
	public ModelAndView get(ModelAndView mv, ComunityVO vo, ReplyVO rvo) {
		
		
		//service.countUp(vo); 굳이 서비스에 추가하지 않고 selectOne에 기능만 추가해서 사용
		//update에서 중복 사용 되도 조건을 주면 상관 없음
		vo = service.selectOne(vo);
		List<ReplyVO> list = rservice.selectList(rvo);
		
			mv.addObject("reply",list);
			mv.addObject("get",vo);
			mv.setViewName("comunity/get");
			return mv;
	}
	
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView postUpdate(ModelAndView mv, ComunityVO vo) {
		if(service.update(vo) > 0) {
			mv.setViewName("redirect:/comunity/get?seq="+vo.getSeq());
		}else {
			mv.addObject("fCode","BU");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView getUpdate(ModelAndView mv, ComunityVO vo) {
	
		vo = service.selectOne(vo);
			mv.addObject("get", vo);
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
