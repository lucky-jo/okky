package com.ncs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ncs.mapper.ColumnMapper;
import com.ncs.mapper.ComunityMapper;
import com.ncs.mapper.JobsMapper;
import com.ncs.mapper.QnaMapper;
import com.ncs.vo.ColumnVO;
import com.ncs.vo.ComunityVO;
import com.ncs.vo.JobsVO;
import com.ncs.vo.QnaVO;

@Controller
public class TestController {
	
	@Autowired
	ColumnMapper columnMapper;
	
	@Autowired
	ComunityMapper comunityMapper;
	
	@Autowired
	JobsMapper jobsMapper;
	
	@Autowired
	QnaMapper qnaMapper;
	
	@RequestMapping("/test2")
	public ModelAndView test2(ModelAndView mv) {
		
		ColumnVO vo = new ColumnVO();
		for(int i = 0; i < 1000; i++ ) {
			for(int j = 0; j < 7 ; j++ ) {
				vo.setTitle("관리자가 작성하는 글 select key"+j);
				vo.setContent("관리자가 작성하는 내용 select key"+j);
				vo.setId("admin9"+j);
				vo.setCategory("a");
				columnMapper.insert(vo);
			}
			for(int k = 0; k < 7 ; k++ ) {
				vo.setTitle("새로 작성하는 글 select key"+k);
				vo.setContent("새로 작성하는 내용 select key"+k);
				vo.setId("user5"+k);
				vo.setCategory("b");
				columnMapper.insert(vo);
			}
		}
		mv.setViewName("redirect:/index");
		return mv;
	}

	@RequestMapping("/test1")
	public ModelAndView test1(ModelAndView mv) {
		ComunityVO vo = new ComunityVO();
		for(int i = 0; i < 1000; i++ ) {
			for(int j = 0; j < 7 ; j++ ) {
				vo.setTitle("관리자가 작성하는 글 select key"+j);
				vo.setContent("관리자가 작성하는 내용 select key"+j);
				vo.setId("admin9"+j);
				vo.setCategory("a");
				comunityMapper.insert(vo);
			}
			for(int k = 0; k < 7 ; k++ ) {
				vo.setTitle("새로 작성하는 글 select key"+k);
				vo.setContent("새로 작성하는 내용 select key"+k);
				vo.setId("user5"+k);
				vo.setCategory("b");
				comunityMapper.insert(vo);
			}
		}
		mv.setViewName("redirect:/index");
		return mv;
	}
	@RequestMapping("/test4")
	public ModelAndView test4(ModelAndView mv) {
		QnaVO vo = new QnaVO();
		for(int i = 0; i < 1000; i++ ) {
			for(int j = 0; j < 7 ; j++ ) {
				vo.setTitle("관리자가 작성하는 글 select key"+j);
				vo.setContent("관리자가 작성하는 내용 select key"+j);
				vo.setId("admin9"+j);
				vo.setCategory("Tech Q&A");
				qnaMapper.insert(vo);
			}
			for(int k = 0; k < 7 ; k++ ) {
				vo.setTitle("새로 작성하는 글 select key"+k);
				vo.setContent("새로 작성하는 내용 select key"+k);
				vo.setId("user5"+k);
				vo.setCategory("Blockchain Q&A");
				qnaMapper.insert(vo);
			}
		}
		mv.setViewName("redirect:/index");
		return mv;
	}
	
	@RequestMapping("/test3")
	public ModelAndView test3(ModelAndView mv) {
		JobsVO vo = new JobsVO();
		for(int i = 0; i < 1000; i++ ) {
			for(int j = 0; j < 7 ; j++ ) {
				vo.setTitle("관리자가 작성하는 글 select key"+j);
				vo.setContent("관리자가 작성하는 내용 select key"+j);
				vo.setId("admin9"+j);
				vo.setCategory("a");
				jobsMapper.insert(vo);
			}
			for(int k = 0; k < 7 ; k++ ) {
				vo.setTitle("새로 작성하는 글 select key"+k);
				vo.setContent("새로 작성하는 내용 select key"+k);
				vo.setId("user5"+k);
				vo.setCategory("b");
				jobsMapper.insert(vo);
			}
		}
		mv.setViewName("redirect:/index");
		return mv;
	}

}
