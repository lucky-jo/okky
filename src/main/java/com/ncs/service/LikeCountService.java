package com.ncs.service;

import com.ncs.vo.LikeDTO;
import com.ncs.vo.ReplyLikeDTO;

public interface LikeCountService {

    int likeRegister(LikeDTO likeDTO);
    int likeDelete(LikeDTO likeDTO);
    int replyLikeRegister(ReplyLikeDTO replyLikeDTO);
    int replyLikeDelete(ReplyLikeDTO replyLikeDTO);
    int likeExist(LikeDTO likeDTO);
    int replyLikeExist(ReplyLikeDTO replyLikeDTO);
}
