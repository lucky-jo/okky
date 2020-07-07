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

import com.ncs.service.LikeCountService;
import com.ncs.service.MemberService;
import com.ncs.service.QnaReplyService;
import com.ncs.service.QnaService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.MergeDTO;
import com.ncs.vo.QnaVO;
import com.ncs.vo.ReplyLikeDTO;
import com.ncs.vo.ReplyVO;

@RequestMapping(value = "/qna/")
@Controller
public class QnaController {

        @Autowired
        QnaService service;
        
        @Autowired
        QnaReplyService rservice;

        @Autowired
        LikeCountService likeCountService;
        
        @Autowired
        MemberService memberService;

        @RequestMapping(value = "/list")
        public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
            cri.setSnoEno();
            List<QnaVO> list = service.searchList(cri);
            List<MergeDTO<QnaVO,MemberVO>> mergelist = new ArrayList<>();
            for (QnaVO qnaVO : list) {
            	MemberVO membervo = memberService.get(qnaVO.getId());
            	if( membervo != null ) {
            		System.out.println(membervo.toString());
    				mergelist.add(new MergeDTO<QnaVO,MemberVO>(qnaVO, membervo));
            	}	
			}
            if( mergelist != null ) {
            	mv.addObject("board",mergelist);
            }
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);
            pageMaker.setTotalRow(service.searchRowCount(cri));

            mv.addObject("pageMaker",pageMaker);
            mv.setViewName("qna/list");
            System.out.println(pageMaker.toString());
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/register", method = RequestMethod.POST )
        public ModelAndView postInsert(ModelAndView mv, QnaVO vo) {
            if(service.insert(vo)>0) {
                mv.setViewName("redirect:/qna/get?seq="+vo.getSeq());
            }else {
                mv.addObject("fCode","BI");
                mv.setViewName("qna/fail");
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/register", method = RequestMethod.GET )
        public void getInsert() {

        }

//        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/get")
        public ModelAndView get(ModelAndView mv, QnaVO vo, LikeDTO dto, ReplyLikeDTO rdto, HttpServletRequest request) {
        	List<ReplyVO> list = rservice.selectlist(vo.getSeq());
        	for (ReplyVO replyVO : list) {
        	    rdto.setBoard(replyVO.getBoard());
        	    rdto.setLikerid(request.getRemoteUser());
        	    rdto.setRseq(replyVO.getRseq());
				replyVO.setLiketype(likeCountService.replyLikeExist(rdto));
				System.out.println(replyVO.getLiketype());
				System.out.println(replyVO.toString());
			}
        	vo.setId(request.getRemoteUser());
        	vo = service.selectOne(vo);
        	if( vo != null ) {
        	    dto.setSeq(vo.getSeq());
        		dto.setBoard("qna");
        		dto.setLikeid(request.getRemoteUser());
        		int cnt = likeCountService.likeExist(dto);
        		System.out.println(request.getRemoteUser());
            	System.out.println(cnt);
            	mv.addObject("liketype", cnt);
        	}
        	System.out.println(vo.toString());
        	mv.addObject("replylist", list);
            mv.addObject("get",vo);
            mv.setViewName("qna/get");
            return mv;
        }


        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/update", method = RequestMethod.POST )
        public ModelAndView update(ModelAndView mv,QnaVO vo) {
            System.out.println("업데이트 요청 = " + vo);
            if(service.update(vo) > 0) {
                mv.setViewName("redirect:/qna/get?seq="+vo.getSeq());
            }else {
                mv.setViewName("redirect:/qna/list");
            }
            return mv;
        }

        @PreAuthorize("principal.username == #request.getRemoteUser()")
        @RequestMapping(value = "/update", method = RequestMethod.GET )
        public ModelAndView getUpdate(ModelAndView mv, QnaVO vo) {
            System.out.println("업데이트폼 요청 = " + vo);
            return mv.addObject("get",service.selectOne(vo));
        }

        @PreAuthorize("principal.username == #request.getRemoteUser()")
        @RequestMapping(value = "/delete")
        public ModelAndView delete(ModelAndView mv, QnaVO vo,HttpServletRequest request) {
            System.out.println("삭제요청 = " + vo);
            if(service.delete(vo) > 0) {
                mv.setViewName("redirect:/qna/list");
            }else {
                mv.setViewName("redirect:/qna/get?seq="+vo.getSeq());
            }
            return mv;
        }

    }

