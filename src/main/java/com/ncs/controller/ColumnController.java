package com.ncs.controller;

import com.ncs.service.ColReplyService;
import com.ncs.service.ColumnService;
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

@RequestMapping(value = "/column/")
@Controller
public class ColumnController {

        @Autowired
        ColumnService columnService;
        
        @Autowired
        ColReplyService colReplyService;

        @Autowired
        LikeCountService likeCountService;
        
        @Autowired
        MemberService memberService;

        @Autowired
        MemberVO memberVO;

        @RequestMapping(value = "/list")
        public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
            cri.setSnoEno();
            List<ColumnVO> list = columnService.searchList(cri);
            List<MergeDTO<ColumnVO,MemberVO>> mergelist = new ArrayList<>();
            for (ColumnVO columnVO : list) {
            	MemberVO membervo = memberService.get(columnVO.getId());
            	if( membervo != null ) {
            		System.out.println(membervo.toString());
    				mergelist.add(new MergeDTO<>(columnVO, membervo));
            	}	
			}

            mv.addObject("mergelist",mergelist);

            PageMaker pageMaker = new PageMaker();
            pageMaker.setCri(cri);
            pageMaker.setTotalRow(columnService.searchRowCount(cri));

            mv.addObject("pageMaker",pageMaker);
            mv.setViewName("column/list");
            System.out.println(pageMaker.toString());
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/register", method = RequestMethod.POST )
        public ModelAndView postInsert(ModelAndView mv, ColumnVO vo ) {
            if(columnService.insert(vo)>0) {
                mv.setViewName("redirect:/column/get?seq="+vo.getSeq());
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/register", method = RequestMethod.GET )
        public void getInsert() {

        }

//        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/get")
        public ModelAndView get(ModelAndView mv, ColumnVO columnVO, LikeDTO dto, ReplyLikeDTO rdto, HttpServletRequest request) {
        	List<ReplyVO> list = colReplyService.selectlist(columnVO.getSeq());
            List<MergeDTO<ReplyVO,MemberVO>> mergelist = new ArrayList<>();
        	for (ReplyVO replyVO : list) {
//        	    memberVO = memberService.get(qnaVO.getId());
//        	    System.out.println(memberVO);
        	    mergelist.add(new MergeDTO<>(replyVO,memberService.get(columnVO.getId())));
        	    rdto.setBoard(replyVO.getBoard());
        	    rdto.setLikerid(request.getRemoteUser());
        	    rdto.setRseq(replyVO.getRseq());
				replyVO.setLiketype(likeCountService.replyLikeExist(rdto));
				System.out.println(replyVO.getLiketype());
				System.out.println(replyVO.toString());
			}
            columnVO.setId(request.getRemoteUser());
            columnVO = columnService.selectOne(columnVO);
        	if( columnVO != null ) {
        	    dto.setSeq(columnVO.getSeq());
        		dto.setBoard("column");
        		dto.setLikeid(request.getRemoteUser());
        		int cnt = likeCountService.likeExist(dto);
        		System.out.println(request.getRemoteUser());
            	System.out.println(cnt);
            	mv.addObject("liketype", cnt);
        	}
            assert columnVO != null;
            System.out.println(columnVO.toString());
        	mv.addObject("mergeReplylist", mergelist);
            mv.addObject("get",columnVO);
            mv.addObject("writer",memberService.get(columnVO.getId()));
            mv.setViewName("column/get");
            return mv;
        }

        @PreAuthorize("principal.username == #vo.id")
        @RequestMapping(value = "/update", method = RequestMethod.POST )
        public ModelAndView update(ModelAndView mv,ColumnVO vo) {
            System.out.println("업데이트 요청 = " + vo);
            if(columnService.update(vo) > 0) {
                mv.setViewName("redirect:/column/get?seq="+vo.getSeq());
            }else {
                mv.setViewName("redirect:/column/list");
            }
            return mv;
        }

        @PreAuthorize("isAuthenticated()")
        @RequestMapping(value = "/update", method = RequestMethod.GET )
        public ModelAndView getUpdate(ModelAndView mv, ColumnVO vo,HttpServletRequest request) {
            System.out.println("업데이트폼 요청 = " + vo);
            return mv.addObject("get",columnService.selectOne(vo));
        }

        @PreAuthorize("principal.username == #request.getRemoteUser()")
        @RequestMapping(value = "/delete")
        public ModelAndView delete(ModelAndView mv, ColumnVO vo,HttpServletRequest request) {
            System.out.println("삭제요청 = " + vo);
            if(columnService.delete(vo) > 0) {
                mv.setViewName("redirect:/column/list");
            }else {
                mv.setViewName("redirect:/column/get?seq="+vo.getSeq());
            }
            return mv;
        }
    }

