package com.ncs.service;

import com.ncs.vo.LikeDTO;
import com.ncs.vo.ReplyLikeDTO;

public interface LikeCountService {

    int likeRegister(LikeDTO dto);
    int likeDelete(LikeDTO dto);
    int replyLikeRegister(ReplyLikeDTO dto);
    int replyLikeDelete(ReplyLikeDTO dto);
    int likeExist(LikeDTO dto);
    int replyLikeExist(ReplyLikeDTO dto);
}
