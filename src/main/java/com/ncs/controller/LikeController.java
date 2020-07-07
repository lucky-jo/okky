package com.ncs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ncs.service.LikeCountService;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.ReplyLikeDTO;

@RequestMapping(value = "/like")
@Controller
public class LikeController {

    @Autowired
    LikeCountService likeCountService;

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/like")
    public String like(LikeDTO dto, HttpServletRequest request) {
    	dto.setLikeid(request.getRemoteUser());
        likeCountService.likeRegister(dto);
        return "redirect:/"+dto.getBoard()+"/get?seq="+dto.getSeq();
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/replylike")
    public String replylike(ReplyLikeDTO dto, HttpServletRequest request) {
    	dto.setLikerid(request.getRemoteUser());
        likeCountService.replyLikeRegister(dto);
        return "redirect:/" + dto.getParentBoard() + "/get?seq=" + dto.getParentSeq();
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/replydelete")
    public String replydelete(ReplyLikeDTO dto, HttpServletRequest request){
    	dto.setLikerid(request.getRemoteUser());
        likeCountService.replyLikeDelete(dto);
        return "redirect:/" + dto.getParentBoard() + "/get?seq=" + dto.getParentSeq();
    }
    
    @PreAuthorize("isAuthenticated()")
    @RequestMapping(value = "/delete")
    public String delete(LikeDTO dto, HttpServletRequest request) {
    	dto.setLikeid(request.getRemoteUser());
        likeCountService.likeDelete(dto);
        return "redirect:/"+dto.getBoard()+"/get?seq="+dto.getSeq();
    }
}
