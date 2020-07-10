package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ncs.service.ColReplyService;
import com.ncs.vo.ColumnVO;
import com.ncs.vo.ReplyVO;

@RequestMapping("/colreply")
@Controller
public class ColReplyController {
	
	@Autowired
	ColReplyService rservice;

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String register(ReplyVO rvo) {
		rservice.register(rvo);
		return ("redirect:/column/get?seq=" + rvo.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.GET )
	public String getRegister(ColumnVO columnVO) {
		return ("redirect:/column/get?seq=" + columnVO.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/delete")
	public String delete(ReplyVO rvo) {
		rservice.delete(rvo);
		return "redirect:/column/get?seq=" + rvo.getSeq();
	}


}
