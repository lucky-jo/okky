package com.ncs.controller;

import com.ncs.service.LikeCountService;
import com.ncs.service.QnaReplyService;
import com.ncs.service.QnaService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.QnaVO;
import com.ncs.vo.ReplyLikeDTO;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping(value = "/qna/")
@Controller
public class QnaController {

        @Autowired
        QnaService service;
        
        @Autowired
        QnaReplyService rservice;

        @Autowired
        LikeCountService likeCountService;

        @RequestMapping(value = "/list")
        public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
            cri.setSnoEno();
            mv.addObject("board",service.searchList(cri));

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

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/get")
        public ModelAndView get(ModelAndView mv, QnaVO vo, LikeDTO dto, ReplyLikeDTO rdto) {
        	List<ReplyVO> list = rservice.selectlist(vo.getSeq());
        	for (ReplyVO replyVO : list) {
        	    rdto.setBoard(replyVO.getBoard());
        	    rdto.setLikerid("ildang100");
        	    rdto.setRseq(replyVO.getRseq());
				replyVO.setLiketype(likeCountService.replyLikeExist(rdto));
				System.out.println(replyVO.getLiketype());
				System.out.println(replyVO.toString());
			}
        	vo = service.selectOne(vo);
        	if( vo != null ) {
        	    dto.setSeq(vo.getSeq());
        		dto.setBoard("qna");
        		dto.setLikeid("ildang100");
        		int cnt = likeCountService.likeExist(dto);
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

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/update", method = RequestMethod.GET )
        public ModelAndView getUpdate(ModelAndView mv, QnaVO vo) {
            System.out.println("업데이트폼 요청 = " + vo);
            return mv.addObject("get",service.selectOne(vo));
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/delete")
        public ModelAndView delete(ModelAndView mv, QnaVO vo) {
            System.out.println("삭제요청 = " + vo);
            if(service.delete(vo) > 0) {
                mv.setViewName("redirect:/qna/list");
            }else {
                mv.setViewName("redirect:/qna/get?seq="+vo.getSeq());
            }
            return mv;
        }

    }

