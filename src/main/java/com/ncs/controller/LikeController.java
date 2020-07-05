package com.ncs.controller;

import com.ncs.service.LikeCountService;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.QnaVO;
import com.ncs.vo.ReplyLikeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping(value = "/like")
@Controller
public class LikeController {

    @Autowired
    LikeCountService likeCountService;

    @RequestMapping(value = "/like")
    public String like(QnaVO vo, LikeDTO dto) {
        likeCountService.likeRegister(dto);
        return "redirect:/"+dto.getBoard()+"/get?seq="+vo.getSeq();
    }

    @RequestMapping(value = "/replylike")
    public String replylike(ReplyLikeDTO dto) {
        likeCountService.replyLikeRegister(dto);
        return "redirect:/" + dto.getParentBoard() + "/get?seq=" + dto.getParentSeq();
    }

    @RequestMapping(value = "/replydelete")
    public String replydelete(ReplyLikeDTO dto){
        likeCountService.replyLikeDelete(dto);
        return "redirect:/" + dto.getParentBoard() + "/get?seq=" + dto.getParentSeq();
    }
    @RequestMapping(value = "/delete")
    public String delete(LikeDTO dto) {
        likeCountService.likeDelete(dto);
        return "redirect:/qna/get?seq="+dto.getSeq();
    }
}
