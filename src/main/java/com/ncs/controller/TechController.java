package com.ncs.controller;

import com.ncs.service.LikeCountService;
import com.ncs.service.MemberService;
import com.ncs.service.TechReplyService;
import com.ncs.service.TechService;
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

@RequestMapping(value = "/tech/")
@Controller
public class TechController {

        @Autowired
        TechService techService;
        
        @Autowired
        TechReplyService techReplyService;

        @Autowired
        LikeCountService likeCountService;
        
        @Autowired
        MemberService memberService;

        @Autowired
        MemberVO memberVO;

        @RequestMapping(value = "/list")
        public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
            cri.setSnoEno();
            List<TechVO> list = techService.searchList(cri);
            List<MergeDTO<TechVO,MemberVO>> mergelist = new ArrayList<>();
            for (TechVO techVO : list) {
            	MemberVO membervo = memberService.get(techVO.getId());
            	if( membervo != null ) {
            		System.out.println(membervo.toString());
    				mergelist.add(new MergeDTO<>(techVO, membervo));
            	}	
			}
            if( mergelist != null ) {
            	mv.addObject("mergelist",mergelist);
            }
            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);
            pageMaker.setTotalRow(techService.searchRowCount(cri));

            mv.addObject("pageMaker",pageMaker);
            mv.setViewName("tech/list");
            System.out.println(pageMaker.toString());
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/register", method = RequestMethod.POST )
        public ModelAndView postInsert(ModelAndView mv, TechVO vo ) {
            if(techService.insert(vo)>0) {
                mv.setViewName("redirect:/tech/get?seq="+vo.getSeq());
            }else {
                mv.addObject("fCode","BI");
                mv.setViewName("tech/fail");
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/register", method = RequestMethod.GET )
        public void getInsert() {

        }

//        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/get")
        public ModelAndView get(ModelAndView mv, TechVO techVO, LikeDTO dto, ReplyLikeDTO rdto, HttpServletRequest request) {
        	List<ReplyVO> list = techReplyService.selectlist(techVO.getSeq());
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
            techVO.setId(request.getRemoteUser());
            techVO = techService.selectOne(techVO);
        	if( techVO != null ) {
        	    dto.setSeq(techVO.getSeq());
        		dto.setBoard("tech");
        		dto.setLikeid(request.getRemoteUser());
        		int cnt = likeCountService.likeExist(dto);
        		System.out.println(request.getRemoteUser());
            	System.out.println(cnt);
            	mv.addObject("liketype", cnt);
        	}
            assert techVO != null;
            System.out.println(techVO.toString());
        	mv.addObject("mergeReplylist", mergelist);
            mv.addObject("get",techVO);
            mv.addObject("writer",memberService.get(techVO.getId()));
            mv.setViewName("tech/get");
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/update", method = RequestMethod.POST )
        public ModelAndView update(ModelAndView mv,TechVO vo) {
            System.out.println("업데이트 요청 = " + vo);
            if(techService.update(vo) > 0) {
                mv.setViewName("redirect:/tech/get?seq="+vo.getSeq());
            }else {
                mv.setViewName("redirect:/tech/list");
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/update", method = RequestMethod.GET )
        public ModelAndView getUpdate(ModelAndView mv, TechVO vo) {
            System.out.println("업데이트폼 요청 = " + vo);
            return mv.addObject("get",techService.selectOne(vo));
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/delete")
        public ModelAndView delete(ModelAndView mv, TechVO vo) {
            System.out.println("삭제요청 = " + vo);
            if(techService.delete(vo) > 0) {
                mv.setViewName("redirect:/tech/list");
            }else {
                mv.setViewName("redirect:/tech/get?seq="+vo.getSeq());
            }
            return mv;
        }
    }

