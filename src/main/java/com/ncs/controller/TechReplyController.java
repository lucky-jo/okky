package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.TechReplyService;
import com.ncs.vo.ReplyVO;
import com.ncs.vo.TechVO;

@RequestMapping("/techreply")
@Controller
public class TechReplyController {
	
	@Autowired
	TechReplyService techReplyService;

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String register(ReplyVO rvo) {
		techReplyService.register(rvo);
		return ("redirect:/tech/get?seq=" + rvo.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.GET )
	public String getRegister(TechVO techVO) {
		return ("redirect:/tech/get?seq=" + techVO.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/delete")
	public String delete(ReplyVO rvo) {
		techReplyService.delete(rvo);
		return "redirect:/tech/get?seq=" + rvo.getSeq();
	}
	@PreAuthorize("principal.username == #replyVO.rid")
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(ReplyVO replyVO) {
		techReplyService.modify(replyVO);
		return "redirect:/tech/get?seq=" + replyVO.getSeq();
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET )
	public ModelAndView getModigy(ModelAndView mv, ReplyVO replyVO) {
		mv.addObject("get",techReplyService.get(replyVO));
		mv.setViewName("jsonView");
		return mv;
	}

}
