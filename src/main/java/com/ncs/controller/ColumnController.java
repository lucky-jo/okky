package com.ncs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.service.ColumnService;
import com.ncs.vo.ColumnVO;

@RequestMapping(value = "/column")
@Controller
public class ColumnController {
	
	@Autowired
	ColumnService service;
	
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mv) {
		List<ColumnVO> list = service.selectList();
		if (list != null) {
			mv.addObject("Banana",list);
		}else {
			mv.addObject("message","등록된 글이 없습니다.");
		}
		mv.setViewName("column/columnList");
		return mv;
	}
	
	@RequestMapping(value = "/insert")
	public ModelAndView insert(ModelAndView mv) {
		mv.setViewName("column/columnInsert");
		return mv;
	} // columnInsert
	
	@RequestMapping(value = "/detail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv, ColumnVO vo) {

		HttpSession session = request.getSession(false); 
		String logID = "";
		if (session != null && session.getAttribute("logID") != null)  {
			logID = (String)session.getAttribute("logID");
		} else System.out.println("~~ session is null 또는 login ID is null ~~");
		
		if (!logID.equals(vo.getId())) service.countUp(vo);
		
		vo = service.selectOne(vo);
		
		if (vo!=null) {
			// 4) 댓글 입력을 위한 기본값(root,step,indent) 보관
			session.setAttribute("proot",vo.getRoot());
			session.setAttribute("pstep",vo.getStep());
			session.setAttribute("pindent",vo.getIndent());
			
			mv.addObject("Detail", vo);
			mv.setViewName("board/boardDetail");
		}else {
			mv.addObject("fCode","BN");
			mv.setViewName("member/doFinish");
		}
		return mv;
	}// bdetail
}