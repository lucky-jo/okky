package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ncs.service.JobsReplyService;
import com.ncs.vo.JobsVO;
import com.ncs.vo.ReplyVO;

@RequestMapping("/jobsreply")
@Controller
public class JobsReplyController {
	
	@Autowired
	JobsReplyService jobsReplyService;

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.POST )
	public String register(ReplyVO rvo) {
		jobsReplyService.register(rvo);
		return ("redirect:/jobs/get?seq=" + rvo.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.GET )
	public String getRegister(JobsVO jobsVO) {
		return ("redirect:/jobs/get?seq=" + jobsVO.getSeq());
	}

	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/delete")
	public String delete(ReplyVO rvo) {
		jobsReplyService.delete(rvo);
		return "redirect:/jobs/get?seq=" + rvo.getSeq();
	}


}
