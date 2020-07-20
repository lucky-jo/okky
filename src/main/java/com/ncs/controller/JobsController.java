package com.ncs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.JobsReplyService;
import com.ncs.service.JobsService;
import com.ncs.service.LikeCountService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.ReplyLikeDTO;
import com.ncs.vo.ReplyVO;

@RequestMapping("/jobs/")
@Controller
public class JobsController {
	
	@Autowired
	JobsService service;
	
	@Autowired
	JobsReplyService jservice;
	
	@Autowired
	LikeCountService likeCountService;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mv,SearchCriteria cri) {
		cri.setSnoEno();
		mv.addObject("melon",service.searchList(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		
		mv.setViewName("jobs/list");
		System.out.println(pageMaker.toString());
		return mv;
	}//list
	
	
	  @RequestMapping("/register") 
	  public ModelAndView insert(ModelAndView mv,JobsVO vo) { 
		  if(service.insert(vo)>0) {
			  mv.addObject("message","새 글이 등록 되었습니다");
	          mv.setViewName("redirect:/jobs/get?seq="+vo.getSeq()); 
	    }
		  return mv;
	    }//insert:새글 등록창
	  
	  @RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getInsert() {
		
		}
	 
	  @RequestMapping(value = "/get")
		public ModelAndView get( ModelAndView mv, JobsVO vo,JobsReplyVO rvo, LikeDTO dto, ReplyLikeDTO rdto,HttpServletRequest request) {
		    List<JobsReplyVO> rlist = jservice.selectlist(rvo.getSeq());
		    for (JobsReplyVO jobsreplyVO : rlist) {
	    	    rdto.setBoard(jobsreplyVO.getBoard());
	    	    rdto.setLikerid(request.getRemoteUser());
	    	    rdto.setRseq(jobsreplyVO.getRseq());
				jobsreplyVO.setLiketype(likeCountService.replyLikeExist(rdto));
				System.out.println(jobsreplyVO.getLiketype());
				System.out.println(jobsreplyVO.toString());
			}
		    
		    vo = service.selectOne(vo);
		    if( vo != null ) {
	    	    dto.setSeq(vo.getSeq());
	    		dto.setBoard("jobs");
	    		dto.setLikeid(request.getRemoteUser());
	    		int cnt = likeCountService.likeExist(dto);
	        	System.out.println(cnt);
	        	mv.addObject("liketype", cnt);
	    	}	  
		    mv.addObject("get", vo);
			mv.setViewName("jobs/get");

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
				mv.setViewName("redirect:/jobs/get?seq="+vo.getSeq());
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
				mv.setViewName("redirect:/jobs/get?seq="+vo.getSeq());
			}	
			else { // 실패 => doFinish.jsp
				mv.addObject("fCode","BD");
				mv.setViewName("jobs/fail");
			}	
			return mv ;	
		} //delete
		
		 
		
}//class
