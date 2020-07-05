package com.ncs.mapper;

import com.ncs.vo.LikeDTO;
import com.ncs.vo.ReplyLikeDTO;

public interface LikeCountMapper {

    int likeExist(LikeDTO dto);
    int replyLikeExist(ReplyLikeDTO dto);
    int likeRegister(LikeDTO dto);
    int likecountUp(LikeDTO dto);
    int likecountDown(LikeDTO dto);
    int likeDelete(LikeDTO dto);
    int replyLikeRegister(ReplyLikeDTO dto);
    int replyLikeDelete(ReplyLikeDTO dto);
    int replyLikecountUp(ReplyLikeDTO dto);
    int replyLikecountDown(ReplyLikeDTO dto);

}
