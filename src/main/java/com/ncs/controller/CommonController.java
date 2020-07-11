package com.ncs.controller;

import com.ncs.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value = "/common")
public class CommonController {

    @Autowired
    CommonService commonService;

    @RequestMapping(value = "/dobe")
    public ModelAndView dobe(ModelAndView mv, @RequestParam("userid") String userid) {

        return mv;
    }

}
