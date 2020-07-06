package com.ncs.controller;

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

    @PreAuthorize("principal.username == #dto.likeid")
    @RequestMapping(value = "/like")
    public String like(LikeDTO dto) {
        likeCountService.likeRegister(dto);
        return "redirect:/"+dto.getBoard()+"/get?seq="+dto.getSeq();
    }

    @PreAuthorize("principal.username == #dto.likerid")
    @RequestMapping(value = "/replylike")
    public String replylike(ReplyLikeDTO dto) {
        likeCountService.replyLikeRegister(dto);
        return "redirect:/" + dto.getParentBoard() + "/get?seq=" + dto.getParentSeq();
    }

    @PreAuthorize("principal.username == #dto.likerid")
    @RequestMapping(value = "/replydelete")
    public String replydelete(ReplyLikeDTO dto){
        likeCountService.replyLikeDelete(dto);
        return "redirect:/" + dto.getParentBoard() + "/get?seq=" + dto.getParentSeq();
    }
    
    @PreAuthorize("principal.username == #dto.likeid")
    @RequestMapping(value = "/delete")
    public String delete(LikeDTO dto) {
        likeCountService.likeDelete(dto);
        return "redirect:/"+dto.getBoard()+"/get?seq="+dto.getSeq();
    }
}
