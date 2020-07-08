package com.ncs.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ComReplyService;
import com.ncs.service.ComunityService;
import com.ncs.service.LikeCountService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;
import com.ncs.vo.LikeDTO;
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
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
		cri.setSnoEno();
		mv.addObject("board",service.searchList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalRow(service.searchRowCount(cri));
		
		mv.addObject("pageMaker",pageMaker);
		mv.setViewName("comunity/list");
		System.out.println(pageMaker.toString());
		return mv;
	}
	
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
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void getInsert() {
	
	}
	
	
	@RequestMapping(value = "/get")
	public ModelAndView get(ModelAndView mv, ComunityVO vo, LikeDTO dto, ReplyLikeDTO rdto, HttpServletRequest request) {
		
		List<ReplyVO> list = rservice.selectList(vo.getSeq());
	   	for (ReplyVO replyVO : list) {
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
			mv.addObject("replylist",list);
			mv.addObject("get",vo);
			mv.setViewName("comunity/get");
		return mv;
	}
	
	
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
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView getUpdate(ModelAndView mv, ComunityVO vo) {
	
		 return mv.addObject("get",service.selectOne(vo));
	}
	
	
	@RequestMapping(value = "/delete")
	public String delete( ComunityVO vo) {
		System.out.println(vo);
		service.delete(vo) ;
		System.out.println(vo);
		return "redirect:/comunity/list?seq="+vo.getSeq();
	}
	
}
