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
	
	
	  @RequestMapping("/insert") 
	  public ModelAndView newinsert(ModelAndView mv,JobsVO vo) { 
		  if(service.insert(vo)>0) {
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
		public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, JobsVO vo) {
			
		    vo = service.selectOne(vo);
			mv.addObject("Detail", vo);

			// 4) 결과 ( Detail or Update 인지 )
			// => request.getParameter("code") 가 U 인지 확인
			mv.setViewName("jobs/jdetail");
			if ("U".equals(request.getParameter("code"))) {
				// 내정보 수정화면으로
				mv.setViewName("jobs/jupdate");
			} else if ("E".equals(request.getParameter("code"))) { // 내정보 수정에서 오류 상황
				mv.addObject("message", "~~ 내정보 수정 오류  !!! 다시 하세요 ~~");
			}
			return mv;
		}// bdetail 
	  
	  @RequestMapping(value = "/update")
		public ModelAndView update(ModelAndView mv, JobsVO vo) {
			// 1) selectOne
			int cnt = service.update(vo);
			
			if (cnt>0) {
				mv.addObject("message", "성공");
				mv.setViewName("redirect:/jobs/jdetail?seq="+vo.getSeq());
			}else {
				mv.addObject("fCode","BN");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}// update
		
		@RequestMapping(value="/jupdate")
		public ModelAndView jupdate(ModelAndView mv, JobsVO vo) {
			mv.addObject("Detail",service.selectOne(vo));	
			mv.setViewName("jobs/jupdate");
			return mv ;	
		} //bupdate
		
		@RequestMapping(value="/delete")
		public ModelAndView bdelete(ModelAndView mv, JobsVO vo) {
			
			if (service.delete(vo)>0) {//성공 => 글목록 출력 (blist)
				mv.addObject("message", "삭제되었습니다");	
				mv.addObject("melon",service.selectlist());
				mv.setViewName("jobs/jlist");
			}	
			else { // 실패 => doFinish.jsp
				mv.addObject("fCode","BD");
				mv.setViewName("jobs/fail");
			}	
			return mv ;	
		} //delete
		
	
		
}//class
