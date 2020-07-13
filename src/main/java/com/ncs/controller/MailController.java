package com.ncs.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ncs.service.MailService;

@RequestMapping(value = "/mail")
@EnableAsync
@Controller
public class MailController {
    @Autowired
    private MailService mailService;
 
    @RequestMapping(value = "/sendMail", method = RequestMethod.GET)
    public String sendSimpleMail(HttpServletRequest request, HttpServletResponse response) 
                                                          throws Exception{
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
//        mailService.sendMail("last259@naver.com","last259@naver.com","환영");

        return "redirect:/index";
    }
}


