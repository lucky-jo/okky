package com.ncs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.JobsReplyService;
import com.ncs.service.JobsService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;

@RequestMapping("/jobs/")
@Controller
public class JobsController {
	
	@Autowired
	JobsService service;
	
	@Autowired
	JobsReplyService jservice;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mv,SearchCriteria cri) {
		cri.setSnoEno();
		mv.addObject("melon",service.searchList(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		
		mv.setViewName("jobs/list");
		return mv;
	}//list
	
	
	  @RequestMapping("/insert") 
	  public ModelAndView insert(ModelAndView mv,JobsVO vo) { 
		  if(service.insert(vo)>0) {
			  //mv.addObject("새 글이 등록 되었습니다");
	          mv.setViewName("redirect:/jobs/detailForm?seq="+vo.getSeq()); 
	    }
		  return mv;
	    }//insert:새글 등록창
	  
	  @RequestMapping("/insertForm")
	  public ModelAndView insertForm(ModelAndView mv) {
		  mv.setViewName("jobs/insertForm");
		  return mv;
	  }
	  @RequestMapping("/rinsert")
	  public ModelAndView rinsert(ModelAndView mv, JobsReplyVO rvo) { 
	      if(jservice.rinsert(rvo)>0) 
	      mv.addObject("message", "댓글달기완료");  
		  mv.setViewName("redirect:/jobs/detailForm?seq="+rvo.getSeq());
	      return mv; 
	   }//rinsert
	 
	  @RequestMapping(value = "/detailForm")
		public ModelAndView detailForm( ModelAndView mv, JobsVO vo,JobsReplyVO rvo) {
			
		    vo = service.selectOne(vo);
			mv.addObject("Detail", vo);
			List<JobsReplyVO> rlist = jservice.selectlist(rvo.getSeq());
			mv.addObject("Detailr",rlist);

			// 4) 결과 ( Detail or Update 인지 ) 
			// => request.getParameter("code") 가 U 인지 확인
		/*
		 * mv.setViewName("jobs/jdetail"); if ("U".equals(request.getParameter("code")))
		 * { // 내정보 수정화면으로 mv.setViewName("jobs/jupdate"); } else if
		 * ("E".equals(request.getParameter("code"))) { // 내정보 수정에서 오류 상황
		 * mv.addObject("message", "~~ 내정보 수정 오류  !!! 다시 하세요 ~~"); }
		 */
			return mv;
		}// jdetail 
	  
	  @RequestMapping(value = "/update")
		public ModelAndView update(ModelAndView mv, JobsVO vo) {
			// 1) selectOne
			int cnt = service.update(vo);
			
			if (cnt>0) {
				mv.addObject("message", "성공");
				mv.setViewName("redirect:/jobs/detailForm?seq="+vo.getSeq());
			}else {
				mv.addObject("fCode","BN");
				mv.setViewName("member/doFinish");
			}
			return mv;
		}// update
		
		@RequestMapping(value="/updateForm")
		public ModelAndView updateForm(ModelAndView mv, JobsVO vo) {
			mv.addObject("Detail",service.selectOne(vo));	
			mv.setViewName("jobs/updateForm");
			return mv ;	
		} //bupdate
		
		@RequestMapping(value="/delete")
		public ModelAndView delete(ModelAndView mv, JobsVO vo) {
			
			if (service.delete(vo)>0) {//성공 => 글목록 출력 (blist)
				mv.addObject("message", "삭제되었습니다");	
				mv.addObject("Detail",service.selectlist());
				mv.setViewName("redirect:/jobs/detailForm?seq="+vo.getSeq());
			}	
			else { // 실패 => doFinish.jsp
				mv.addObject("fCode","BD");
				mv.setViewName("jobs/fail");
			}	
			return mv ;	
		} //delete
		
	
		
}//class
