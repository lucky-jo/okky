package com.ncs.controller;

import com.ncs.service.QnaReplyService;
import com.ncs.vo.QnaVO;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/qnareply")
@Controller
public class QnaReplyController {
	
	@Autowired
	QnaReplyService qnaReplyService;

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String register(ReplyVO rvo) {
		qnaReplyService.register(rvo);
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
		qnaReplyService.delete(rvo);
		return "redirect:/qna/get?seq=" + rvo.getSeq();
	}

	@PreAuthorize("principal.username == #replyVO.rid")
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(ReplyVO replyVO) {
		qnaReplyService.modify(replyVO);
		return "redirect:/qna/get?seq=" + replyVO.getSeq();
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET )
	public ModelAndView getModigy(ModelAndView mv, ReplyVO replyVO) {
		mv.addObject("get",qnaReplyService.get(replyVO));
		mv.setViewName("jsonView");
		return mv;
	}

}
