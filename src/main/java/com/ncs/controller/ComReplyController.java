package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ComReplyService;
import com.ncs.vo.ComunityVO;
import com.ncs.vo.ReplyVO;

@RequestMapping("/comreply")
@Controller
public class ComReplyController {

	@Autowired
	ComReplyService comReplyService;
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(ReplyVO rvo) {
		comReplyService.register(rvo);
		return ("redirect:/comunity/get?seq="+rvo.getSeq());
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.GET )
	public String getRegister(ComunityVO comunityVO) {
		return ("redirect:/comunity/get?seq=" + comunityVO.getSeq());
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/delete")
	public String delete(ReplyVO rvo) {
		comReplyService.delete(rvo);
		return "redirect:/comunity/get?seq="+rvo.getSeq();
	}
	
	@PreAuthorize("principal.username == #replyVO.rid")
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(ReplyVO replyVO) {
		comReplyService.modify(replyVO);
		return "redirect:/comunity/get?seq=" + replyVO.getSeq();
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET )
	public ModelAndView getModigy(ModelAndView mv, ReplyVO replyVO) {
		mv.addObject("get",comReplyService.get(replyVO));
		mv.setViewName("jsonView");
		return mv;
	}
	
}
