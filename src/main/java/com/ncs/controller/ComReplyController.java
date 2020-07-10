package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ncs.service.ComReplyService;
import com.ncs.vo.ReplyVO;

@RequestMapping("/comreply")
@Controller
public class ComReplyController {

	@Autowired
	ComReplyService comReplyService;
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(ReplyVO rvo) {
		comReplyService.register(rvo);
		return ("redirect:/comunity/get?seq="+rvo.getSeq());
	}
	
	@RequestMapping(value = "/delete")
	public String delete(ReplyVO rvo) {
		comReplyService.delete(rvo);
		return "redirect:/comunity/get?seq="+rvo.getSeq();
	}
}
