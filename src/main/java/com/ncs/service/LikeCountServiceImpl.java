package com.ncs.service;

import com.ncs.mapper.LikeCountMapper;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.ReplyLikeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LikeCountServiceImpl implements LikeCountService {

    @Autowired
    LikeCountMapper likeCountMapper;

    @Transactional
    @Override
    public int likeRegister(LikeDTO dto) {
        if(dto.getLiketype() == 1 ) {
            likeCountMapper.likecountUp(dto);
        } else if(dto.getLiketype() == -1 ) {
            likeCountMapper.likecountDown(dto);
        }
        return likeCountMapper.likeRegister(dto);
    }

    @Transactional
    @Override
    public int likeDelete(LikeDTO dto) {
        if(dto.getLiketype() == 1) {
            likeCountMapper.likecountDown(dto);
        } else if(dto.getLiketype() == -1 ) {
            likeCountMapper.likecountUp(dto);
        }
        return likeCountMapper.likeDelete(dto);
    }

    @Override
    public int replyLikeRegister(ReplyLikeDTO dto) {
        if(dto.getLiketype() == 1 ) {
            likeCountMapper.replyLikecountUp(dto);
        } else if(dto.getLiketype() == -1 ) {
            likeCountMapper.replyLikecountDown(dto);
        }
        return likeCountMapper.replyLikeRegister(dto);
    }

    @Override
    public int replyLikeDelete(ReplyLikeDTO dto) {
        if(dto.getLiketype() == 1) {
            likeCountMapper.replyLikecountDown(dto);
        } else if(dto.getLiketype() == -1 ) {
            likeCountMapper.replyLikecountUp(dto);
        }
        return likeCountMapper.replyLikeDelete(dto);
    }

    @Override
    public int likeExist(LikeDTO dto) {
        return likeCountMapper.likeExist(dto);
    }

    @Override
    public int replyLikeExist(ReplyLikeDTO dto) {
        return likeCountMapper.replyLikeExist(dto);
    }

}
