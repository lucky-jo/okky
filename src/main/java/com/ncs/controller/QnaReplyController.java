package com.ncs.controller;

import com.ncs.service.QnaReplyService;
import com.ncs.vo.QnaVO;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/qnareply")
@Controller
public class QnaReplyController {
	
	@Autowired
	QnaReplyService rservice;

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String register(ReplyVO rvo) {
		rservice.register(rvo);
		return ("redirect:/qna/get?seq=" + rvo.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.GET )
	public String getRegister(QnaVO qnaVO) {
		return ("redirect:/qna/get?seq=" + qnaVO.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/delete")
	public String delete(ReplyVO rvo) {
		rservice.delete(rvo);
		return "redirect:/qna/get?seq=" + rvo.getSeq();
	}


}
