package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.JobsReplyService;
import com.ncs.vo.JobsReplyVO;
;

@RequestMapping("/jobsreply")
@Controller
public class JobsReplyController {

	@Autowired
	JobsReplyService jservice;
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)//댓글 입력
	public ModelAndView register(ModelAndView mv,JobsReplyVO rvo) {
		if(jservice.register(rvo)>0);
		mv.addObject("get", "댓글달기완료");  
		mv.setViewName("redirect:/jobs/get?seq="+rvo.getSeq());
		return mv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)//댓글 입력
	public ModelAndView update(ModelAndView mv,JobsReplyVO rvo) {
		if(jservice.update(rvo)>0);
		mv.addObject("get", "댓글달기완료");  
		mv.setViewName("redirect:/jobs/get?seq="+rvo.getSeq());
		return mv;
	}
	
	@RequestMapping(value = "/delete")//댓글 삭제
	public ModelAndView delete(ModelAndView mv,JobsReplyVO rvo) {
		jservice.delete(rvo);
		mv.addObject("get", "댓글삭제완료");
		mv.setViewName("redirect:/jobs/get?seq="+rvo.getSeq());
		return mv;
	}
}
