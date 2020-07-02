package com.ncs.controller;

import com.ncs.service.QnaService;
import com.ncs.util.PageMaker;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value = "/qna/")
@Controller
public class QnaController {

        @Autowired
        QnaService service;

        @RequestMapping(value = "/list")
        public ModelAndView list(ModelAndView mv, SearchCriteria cri) {
            cri.setSnoEno();
            mv.addObject("board",service.searchList(cri));

            PageMaker maker = new PageMaker();
            maker.setCri(cri);
            maker.setTotalRow(service.searchRowCount(cri));

            mv.addObject("maker",maker);
            mv.setViewName("qna/list");
            return mv;
        }

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

        @RequestMapping(value = "/register", method = RequestMethod.GET )
        public void getInsert() {

        }

        @RequestMapping(value = "/get")
        public ModelAndView get(ModelAndView mv, QnaVO vo) {
            vo = service.selectOne(vo);

            mv.addObject("get",vo);
            mv.setViewName("qna/get");
            return mv;
        }

        @RequestMapping(value = "/update", method = RequestMethod.POST )
        public ModelAndView update(ModelAndView mv,QnaVO vo) {
            System.out.println("업데이트 요청 = " + vo);
            if(service.update(vo) > 0) {
                mv.setViewName("redirect:/qna/get?seq="+vo.getSeq());
            }else {
                mv.addObject("fCode","BU");
                mv.setViewName("redirect:/qna/list");
            }
            return mv;
        }

        @RequestMapping(value = "/update", method = RequestMethod.GET )
        public ModelAndView getUpdate(ModelAndView mv, QnaVO vo) {
            System.out.println("업데이트폼 요청 = " + vo);
            return mv.addObject("get",service.selectOne(vo));
        }

        @RequestMapping(value = "/delete")
        public ModelAndView delete(ModelAndView mv, QnaVO vo) {
            System.out.println("삭제요청 = " + vo);
            if(service.delete(vo) > 0) {
                mv.setViewName("redirect:/qna/list");
            }else {
                mv.addObject("fCode", "BD");
                mv.setViewName("qna/fail");
            }
            return mv;
        }

    }

