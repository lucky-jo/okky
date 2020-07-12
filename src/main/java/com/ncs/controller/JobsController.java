package com.ncs.controller;

import com.ncs.service.JobsReplyService;
import com.ncs.service.JobsService;
import com.ncs.service.LikeCountService;
import com.ncs.service.MemberService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RequestMapping(value = "/jobs/")
@Controller
public class JobsController {

        @Autowired
        JobsService jobsService;
        
        @Autowired
        JobsReplyService jobsReplyService;

        @Autowired
        LikeCountService likeCountService;
        
        @Autowired
        MemberService memberService;

        @Autowired
        MemberVO memberVO;

        @RequestMapping(value = "/list")
        public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
            cri.setSnoEno();
            List<JobsVO> list = jobsService.searchList(cri);
            List<MergeDTO<JobsVO,MemberVO>> mergelist = new ArrayList<>();
            for (JobsVO jobsVO : list) {
            	MemberVO membervo = memberService.get(jobsVO.getId());
            	if( membervo != null ) {
            		System.out.println(membervo.toString());
    				mergelist.add(new MergeDTO<>(jobsVO, membervo));
            	}	
			}
            if( mergelist != null ) {
            	mv.addObject("mergelist",mergelist);
            }
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);
            pageMaker.setTotalRow(jobsService.searchRowCount(cri));

            mv.addObject("pageMaker",pageMaker);
            mv.setViewName("jobs/list");
            System.out.println(pageMaker.toString());
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/register", method = RequestMethod.POST )
        public ModelAndView postInsert(ModelAndView mv, JobsVO vo ) {
            if(jobsService.insert(vo)>0) {
                mv.setViewName("redirect:/jobs/get?seq="+vo.getSeq());
            }else {
                mv.addObject("fCode","BI");
                mv.setViewName("jobs/fail");
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/register", method = RequestMethod.GET )
        public void getInsert() {

        }

//        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/get")
        public ModelAndView get(ModelAndView mv, JobsVO jobsVO, LikeDTO dto, ReplyLikeDTO rdto, HttpServletRequest request) {
        	List<ReplyVO> list = jobsReplyService.selectlist(jobsVO.getSeq());
            List<MergeDTO<ReplyVO,MemberVO>> mergelist = new ArrayList<>();
        	for (ReplyVO replyVO : list) {
//        	    memberVO = memberService.get(qnaVO.getId());
//        	    System.out.println(memberVO);
        	    mergelist.add(new MergeDTO<>(replyVO,memberService.get(replyVO.getRid())));
        	    rdto.setBoard(replyVO.getBoard());
        	    rdto.setLikerid(request.getRemoteUser());
        	    rdto.setRseq(replyVO.getRseq());
				replyVO.setLiketype(likeCountService.replyLikeExist(rdto));
				System.out.println(replyVO.getLiketype());
				System.out.println(replyVO.toString());
			}
            jobsVO.setId(request.getRemoteUser());
            jobsVO = jobsService.selectOne(jobsVO);
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
            mv.setViewName("jobs/get");
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/update", method = RequestMethod.POST )
        public ModelAndView update(ModelAndView mv,JobsVO vo) {
            System.out.println("업데이트 요청 = " + vo);
            if(jobsService.update(vo) > 0) {
                mv.setViewName("redirect:/jobs/get?seq="+vo.getSeq());
            }else {
                mv.setViewName("redirect:/jobs/list");
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/update", method = RequestMethod.GET )
        public ModelAndView getUpdate(ModelAndView mv, JobsVO vo) {
            System.out.println("업데이트폼 요청 = " + vo);
            return mv.addObject("get",jobsService.selectOne(vo));
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/delete")
        public ModelAndView delete(ModelAndView mv, JobsVO vo) {
            System.out.println("삭제요청 = " + vo);
            if(jobsService.delete(vo) > 0) {
                mv.setViewName("redirect:/jobs/list");
            }else {
                mv.setViewName("redirect:/jobs/get?seq="+vo.getSeq());
            }
            return mv;
        }
    }

