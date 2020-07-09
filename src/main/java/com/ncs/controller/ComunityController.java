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

import com.ncs.service.ComReplyService;
import com.ncs.service.ComunityService;
import com.ncs.service.LikeCountService;
import com.ncs.service.MemberService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.MergeDTO;
import com.ncs.vo.QnaVO;
import com.ncs.vo.ReplyLikeDTO;
import com.ncs.vo.ReplyVO;

@RequestMapping(value = "/comunity/")
@Controller
public class ComunityController {

	@Autowired
	ComunityService service;
	@Autowired
	ComReplyService rservice;
	@Autowired
	LikeCountService likeCountService;
	@Autowired
	MemberService memberService;
	@Autowired
	MemberVO memberVO;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
		cri.setSnoEno();
		List<ComunityVO> list = service.searchList(cri);
		List<MergeDTO<ComunityVO,MemberVO>> mergelist = new ArrayList<>();
		for(ComunityVO comunityVO : list) {
			MemberVO membervo = memberService.get(comunityVO.getId());
			if(membervo != null) {
				System.out.println(membervo.toString());
				mergelist.add(new MergeDTO<>(comunityVO,membervo));
			}
		}
		if(mergelist != null) {
		mv.addObject("mergelist",mergelist);
		}
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(service.searchRowCount(cri));
		
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("comunity/list");
		System.out.println(pageMaker.toString());
		return mv;
	}
	
	@PreAuthorize("principal.username == #vo.id")
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ModelAndView postInsert(ModelAndView mv, ComunityVO vo) {
		if(service.insert(vo)>0) {
//			mv.addObject("detail",service.selectOne(vo));
//			mv.setViewName("comunity/cdetail");
			mv.setViewName("redirect:/comunity/get?seq="+vo.getSeq());
		}else {
			mv.addObject("fCode","BI");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getInsert() {
	
	}
	
	
	@RequestMapping(value = "/get")
	public ModelAndView get(ModelAndView mv, ComunityVO vo, LikeDTO dto, ReplyLikeDTO rdto, HttpServletRequest request) {
		
		List<ReplyVO> list = rservice.selectList(vo.getSeq()); // comunity에서 seq 가져와서 댓글에 들어갈 데이터 리스트 정의
		List<MergeDTO<ReplyVO,MemberVO>> mergelist = new ArrayList<>(); // MergeDTO(제네릭T,E)를 리스트로 정의
	   	for (ReplyVO replyVO : list) { // 댓글에 들어갈 데이터가 list(List<ReplyVO>)가 될때까지 
	   		mergelist.add(new MergeDTO<>(replyVO,memberService.get(vo.getId()))); //mergelist에 replyVO와 memberservice에서 받은 id를 추가한다
    	    rdto.setBoard(replyVO.getBoard());
    	    rdto.setLikerid(request.getRemoteUser());
    	    rdto.setRseq(replyVO.getRseq());
			replyVO.setLiketype(likeCountService.replyLikeExist(rdto));
			System.out.println(replyVO.getLiketype());
			System.out.println(replyVO.toString());
		}
		//service.countUp(vo); 굳이 서비스에 추가하지 않고 selectOne에 기능만 추가해서 사용
		//update에서 중복 사용 되도 조건을 주면 상관 없음
		vo = service.selectOne(vo);
		if( vo != null ) {
    	    dto.setSeq(vo.getSeq());
    		dto.setBoard("comunity");
    		dto.setLikeid(request.getRemoteUser());
    		int cnt = likeCountService.likeExist(dto);
        	System.out.println(cnt);
        	mv.addObject("liketype", cnt);
    	}
		assert vo != null;
			mv.addObject("mergeReplylist",mergelist);
			mv.addObject("get",vo);
			mv.addObject("writer",memberService.get(vo.getId()));
			mv.setViewName("comunity/get");
		return mv;
	}
	
	@PreAuthorize("principal.username == #vo.id")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView postUpdate(ModelAndView mv, ComunityVO vo) {
		if(service.update(vo) > 0) {
			mv.setViewName("redirect:/comunity/get?seq="+vo.getSeq());
		}else {
			mv.addObject("fCode","BU");
			mv.setViewName("comunity/fail");
		}
		return mv;
	}
	
	@PreAuthorize("principal.username == #vo.id")
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView getUpdate(ModelAndView mv, ComunityVO vo) {
	
		 return mv.addObject("get",service.selectOne(vo));
	}
	
    @PreAuthorize("principal.username == #request.getRemoteUser()")
    @RequestMapping(value = "/delete")
    public ModelAndView delete(ModelAndView mv, ComunityVO vo,HttpServletRequest request) {
        System.out.println("삭제요청 = " + vo);
        if(service.delete(vo) > 0) {
            mv.setViewName("redirect:/comunity/list");
        }else {
            mv.setViewName("redirect:/comunity/get?seq="+vo.getSeq());
        }
        return mv;
    }
	
}
