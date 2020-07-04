package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ncs.service.TechReplyService;
import com.ncs.vo.ReplyVO;

@RequestMapping("/techreply")
@Controller
public class TechReplyController {
	
	@Autowired
	TechReplyService rservice;
	
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String register(ReplyVO rvo) {
		rservice.register(rvo);
		return ("redirect:/tech/get?seq=" + rvo.getSeq());
	}
	
	@RequestMapping(value = "/delete")
	public String delete(ReplyVO rvo) {
		rservice.delete(rvo);
		return "redirect:/tech/get?seq=" + rvo.getSeq();
	}
}
