package com.ncs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.JobsService;
import com.ncs.vo.JobsVO;






@RequestMapping("/jobs/")
@Controller
public class JobsController {
	
	@Autowired
	JobsService service;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mv) {
		List<JobsVO> list = service.selectlist();
		if (list!=null) {
			mv.addObject("melon",list);
		}else {
			mv.addObject("message","~~검색된 자료가 없습니다.");
		}
		mv.setViewName("jobs/jlist");
		return mv;
	}//list
	
	
	  @RequestMapping("/newinsert") 
	  public ModelAndView newinsert(ModelAndView mv,JobsVO vo) { 
		  if(service.newinsert(vo)>0) {
			  //mv.addObject("새 글이 등록 되었습니다");
	          mv.setViewName("jobs/jlist"); 
	   }else {
		   mv.addObject("작성을 해주세요");
	       mv.setViewName("jobs/jinsert"); 
	   }
	 
	   return mv; }//newinsert:새글 등록창
	  
	  @RequestMapping("/jinsert")
	  public ModelAndView jinsert(ModelAndView mv) {
		  mv.setViewName("jobs/jinsert");
		  return mv;
	  }
	  @RequestMapping(value = "/jdetail")
		public ModelAndView bdetail(ModelAndView mv, JobsVO vo) {
			
			vo = service.selectOne(vo);
			
			if (vo!=null) {
				
				mv.addObject("Detail", vo);
				mv.setViewName("jobs/jdetail");
			}else {
				mv.addObject("fCode","BN");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}// bdetail 
	  
	  @RequestMapping(value = "/update")
		public ModelAndView bupdatef(ModelAndView mv, JobsVO vo) {
			// 1) selectOne
			vo = service.selectOne(vo);
			
			if (vo!=null) {
				mv.addObject("Detail", vo);
				mv.setViewName("jobs/jupdate");
			}else {
				mv.addObject("fCode","BN");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}// update
		
		@RequestMapping(value="/jupdate")
		public ModelAndView bupdate(ModelAndView mv, JobsVO vo) {
			
			if (service.update(vo)>0) //성공 => 글목록 출력 (blist)
				mv.setViewName("redirect:jlist");
			else { // 실패 => doFinish.jsp
				mv.addObject("fCode","BU");
				mv.setViewName("member/doFinish");
			}	
			return mv ;	
		} //bupdate
	
		
}//class
