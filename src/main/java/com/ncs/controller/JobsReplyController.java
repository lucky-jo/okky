package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.JobsReplyService;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.ReplyVO;

@RequestMapping("/jobs")
@Controller
public class JobsReplyController {

	@Autowired
	JobsReplyService jservice;
	
	@RequestMapping(value = "/rinsert", method = RequestMethod.POST)
	public ModelAndView rinsert(ModelAndView mv,JobsReplyVO rvo) {
		if(jservice.rinsert(rvo)>0);
		mv.addObject("message", "댓글달기완료");  
		mv.setViewName("redirect:/jobs/detailForm?seq="+rvo.getSeq());
		return mv;
	}
	
	@RequestMapping(value = "/jdelete")
	public ModelAndView jdelete(ModelAndView mv,JobsReplyVO rvo) {
		jservice.jdelete(rvo);
		mv.addObject("message", "댓글삭제완료");
		mv.setViewName("redirect:/jobs/detailForm?seq="+rvo.getSeq());
		return mv;
	}
}
