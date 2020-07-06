package com.ncs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.JobsService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;

@RequestMapping("/jobs12/")
@Controller
public class JobsController_Jo {
	
	@Autowired
	JobsService service;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mv,SearchCriteria cri) {
		cri.setSnoEno();
		mv.addObject("board",service.searchList(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		
		mv.setViewName("jobs/list");
		return mv;
	}//list
	
	
	  @RequestMapping(value = "/register", method = RequestMethod.POST ) 
	  public ModelAndView newinsert(ModelAndView mv,JobsVO vo) { 
		  if(service.insert(vo)>0) {
			  //mv.addObject("새 글이 등록 되었습니다");
	          mv.setViewName("redirect:/jobs/jdetail?seq="+vo.getSeq()); 
		  }else {
		   mv.addObject("작성을 해주세요");
	       mv.setViewName("jobs/jinsert"); 
		  }
	 
		  return mv;
	   }
	  
	  @RequestMapping(value = "/register", method = RequestMethod.GET )
	  public ModelAndView jinsert(ModelAndView mv) {
		  mv.setViewName("jobs/register");
		  return mv;
	  }
	  
	/*
	 * @RequestMapping("/rinsert") public ModelAndView rinsert(ModelAndView mv,
	 * JobsReplyVO rvo) { if(service.rinsert(rvo)>0) mv.setViewName("jobs/jdetail");
	 * return mv; }//rinsert
	 */
	  @RequestMapping(value = "/get")
		public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, JobsVO vo) {
			
		    vo = service.selectOne(vo);
			mv.addObject("get", vo);

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
	  
	  @RequestMapping(value = "/update", method = RequestMethod.POST)
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
		
		@RequestMapping(value="/update", method = RequestMethod.GET )
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
