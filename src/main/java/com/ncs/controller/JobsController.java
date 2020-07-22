package com.ncs.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.JobsReplyService;
import com.ncs.service.JobsService;
import com.ncs.service.LikeCountService;
import com.ncs.service.MemberService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.MergeDTO;

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
	
	@Autowired
    MemberService memberService;

    @Autowired
    MemberVO memberVO;
	
	@RequestMapping("/list")
	public ModelAndView list(ModelAndView mv,SearchCriteria cri) {
		cri.setSnoEno();
		 List<JobsVO> list = service.searchList(cri);
         List<MergeDTO<JobsVO,MemberVO>> mergelist = new ArrayList<>();
		mv.addObject("melon",service.searchList(cri));
		for (JobsVO jobsvo : list) {
        	MemberVO membervo = memberService.get(jobsvo.getId());
        	if( membervo != null ) {
        		System.out.println(membervo.toString());
				mergelist.add(new MergeDTO<>(jobsvo, membervo));
        	}	
		}
        if( mergelist != null ) {
        	mv.addObject("mergelist",mergelist);
        }
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		pageMaker.setTotalRow(service.searchRowCount(cri));
		mv.addObject("pageMaker",pageMaker);
		
		mv.setViewName("jobs/list");
		System.out.println(pageMaker.toString());
		return mv;
	}//list
	
	  @PreAuthorize("principal.username == #vo.id")
	  @RequestMapping("/register") 
	  public ModelAndView insert(ModelAndView mv,JobsVO vo) { 
		  if(service.insert(vo)>0) {
			  mv.addObject("message","새 글이 등록 되었습니다");
	          mv.setViewName("redirect:/jobs/get?seq="+vo.getSeq()); 
	    }
		  return mv;
	    }//insert:새글 등록창
	  @PreAuthorize("isAuthenticated()")
	  @RequestMapping(value = "/register", method = RequestMethod.GET)
		public void getInsert() {
		
		}
	 
	  @RequestMapping(value = "/get")
		public ModelAndView get( ModelAndView mv, JobsVO jobsVO,LikeDTO dto, ReplyLikeDTO rdto,HttpServletRequest request) {
		    List<ReplyVO> list = jservice.selectlist(jobsVO.getSeq());
		    List<MergeDTO<ReplyVO,MemberVO>> mergelist = new ArrayList<>();
		    for (ReplyVO rvo : list) {
		    	mergelist.add(new MergeDTO<>(rvo,memberService.get(jobsVO.getId())));
	    	    rdto.setBoard(rvo.getBoard());
	    	    rdto.setLikerid(request.getRemoteUser());
	    	    rdto.setRseq(rvo.getRseq());
				rvo.setLiketype(likeCountService.replyLikeExist(rdto));
				System.out.println(rvo.getLiketype());
				System.out.println(rvo.toString());
			}
		    jobsVO.setId(request.getRemoteUser());
            jobsVO = service.selectOne(jobsVO);
        	if( jobsVO != null ) {
        	    dto.setSeq(jobsVO.getSeq());
        		dto.setBoard("qna");
        		dto.setLikeid(request.getRemoteUser());
        		int cnt = likeCountService.likeExist(dto);
        		System.out.println(request.getRemoteUser());
            	System.out.println(cnt);
            	mv.addObject("liketype", cnt);
        	}
            assert jobsVO != null;
            System.out.println(jobsVO.toString());
        	mv.addObject("mergeReplylist", mergelist);
            mv.addObject("get",jobsVO);
            mv.addObject("writer",memberService.get(jobsVO.getId()));
            mv.setViewName("qna/get");
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
