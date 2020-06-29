package com.ncs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.mapper.JobsMapper;
import com.ncs.vo.JobsVO;

@RequestMapping("/jobs/*")
@Controller
public class JobsController {
	@Autowired
	JobsMapper mapper;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mv) {
		List<JobsVO> list = mapper.selectlist(null);
		if (list!=null) {
			mv.addObject("melon",list);
		}else {
			mv.addObject("message","~~검색된 자료가 없습니다.");
		}
		mv.setViewName("jobs/jobsList");
		return mv;
	}//list
	
	@RequestMapping("/newinsert")
	public ModelAndView newinsert(ModelAndView mv,JobsVO vo) {
		if(mapper.insert(vo)>0) {
			mv.setViewName("redirect:newinsertForm");
		}else {
			mv.addObject("FCode","Bl");
			mv.setViewName("redirect:detail");
		}
		
		return mv;
	}//newinsert:새글 등록창
	
	@RequestMapping("/replyinsert")
	public ModelAndView replyinsert(ModelAndView mv) {
		mv.setViewName("jobs/replyinsertForm");
		return mv;
	}//newinsert:댓글 등록창
	
	
	
	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request,ModelAndView mv,
			JobsVO vo){
		if (mapper.update(vo)>0) {
			mv.setViewName("redirect:/jobs/list");
		}else {
			mv.addObject("fCode","BU");
			mv.setViewName("redirect:detail");//이부분이 아리 까리
		}
		return mv;
	}//update
	
	
	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest request,ModelAndView mv,JobsVO vo) {
		String id="";
		HttpSession session = request.getSession(false);
		if (session!=null && session.getAttribute("logID")!=null) {
			id = (String)session.getAttribute("logID");
			if( id == vo.getId() ) {		
				mapper.delete(vo);
			}
		}else {
			mv.addObject("message","~~로그인후에 하세요~~");
			mv.setViewName("login/loginForm");
			return mv;
		}
		vo.setId(id);
		mv.setViewName("redirect:/jobs/list");
		mv.addObject("deleteID", id);
		return mv;
	}//delete
	
}//class
