package com.ncs.controller;

import com.ncs.service.LikeCountService;
import com.ncs.service.MemberService;
import com.ncs.service.QnaReplyService;
import com.ncs.service.QnaService;
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

@RequestMapping(value = "/qna/")
@Controller
public class QnaController {

        @Autowired
        QnaService qnaService;
        
        @Autowired
        QnaReplyService qnaReplyService;

        @Autowired
        LikeCountService likeCountService;
        
        @Autowired
        MemberService memberService;

        @Autowired
        MemberVO memberVO;

        @RequestMapping(value = "/list")
        public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
            cri.setSnoEno();
            List<QnaVO> list = qnaService.searchList(cri);
            List<MergeDTO<QnaVO,MemberVO>> mergelist = new ArrayList<>();
            for (QnaVO qnaVO : list) {
            	MemberVO membervo = memberService.get(qnaVO.getId());
            	if( membervo != null ) {
            		System.out.println(membervo.toString());
    				mergelist.add(new MergeDTO<>(qnaVO, membervo));
            	}	
			}
            if( mergelist != null ) {
            	mv.addObject("mergelist",mergelist);
            }
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);
            pageMaker.setTotalRow(qnaService.searchRowCount(cri));

            mv.addObject("pageMaker",pageMaker);
            mv.setViewName("qna/list");
            System.out.println(pageMaker.toString());
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/register", method = RequestMethod.POST )
        public ModelAndView postInsert(ModelAndView mv, QnaVO vo ) {
            if(qnaService.insert(vo)>0) {
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
        public ModelAndView get(ModelAndView mv, QnaVO qnaVO, LikeDTO dto, ReplyLikeDTO rdto, HttpServletRequest request) {
        	List<ReplyVO> list = qnaReplyService.selectlist(qnaVO.getSeq());
            List<MergeDTO<ReplyVO,MemberVO>> mergelist = new ArrayList<>();
        	for (ReplyVO replyVO : list) {
//        	    memberVO = memberService.get(replyVO.getRid());
//        	    System.out.println(memberVO);
        	    mergelist.add(new MergeDTO<>(replyVO,memberService.get(replyVO.getRid())));
        	    rdto.setBoard(replyVO.getBoard());
        	    rdto.setLikerid(request.getRemoteUser());
        	    rdto.setRseq(replyVO.getRseq());
				replyVO.setLiketype(likeCountService.replyLikeExist(rdto));
				System.out.println(replyVO.getLiketype());
				System.out.println(replyVO.toString());
			}
            qnaVO.setId(request.getRemoteUser());
            qnaVO = qnaService.selectOne(qnaVO);
        	if( qnaVO != null ) {
        	    dto.setSeq(qnaVO.getSeq());
        		dto.setBoard("qna");
        		dto.setLikeid(request.getRemoteUser());
        		int cnt = likeCountService.likeExist(dto);
        		System.out.println(request.getRemoteUser());
            	System.out.println(cnt);
            	mv.addObject("liketype", cnt);
        	}
            assert qnaVO != null;
            System.out.println(qnaVO.toString());
        	mv.addObject("mergeReplylist", mergelist);
            mv.addObject("get",qnaVO);
            mv.addObject("writer",memberService.get(qnaVO.getId()));
            mv.setViewName("qna/get");
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/update", method = RequestMethod.POST )
        public ModelAndView update(ModelAndView mv,QnaVO vo) {
            System.out.println("업데이트 요청 = " + vo);
            if(qnaService.update(vo) > 0) {
                mv.setViewName("redirect:/qna/get?seq="+vo.getSeq());
            }else {
                mv.setViewName("redirect:/qna/list");
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/update", method = RequestMethod.GET )
        public ModelAndView getUpdate(ModelAndView mv, QnaVO vo) {
            System.out.println("업데이트폼 요청 = " + vo);
            return mv.addObject("get",qnaService.selectOne(vo));
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/delete")
        public ModelAndView delete(ModelAndView mv, QnaVO vo) {
            System.out.println("삭제요청 = " + vo);
            if(qnaService.delete(vo) > 0) {
                mv.setViewName("redirect:/qna/list");
            }else {
                mv.setViewName("redirect:/qna/get?seq="+vo.getSeq());
            }
            return mv;
        }
    }

