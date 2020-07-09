package com.ncs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.MemberMapper;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.ReplyLikeDTO;

@Service
public class LikeCountServiceImpl implements LikeCountService {

    @Autowired
    LikeCountMapper likeCountMapper;
    
    @Autowired
    MemberMapper memberMapper;
    
    @Autowired
    MemberVO memberVO;

    @Transactional
    @Override
    public int likeRegister(LikeDTO dto) {
        if(dto.getLiketype() == 1 ) {
            likeCountMapper.likecountUp(dto);
        } else if(dto.getLiketype() == -1 ) {
            likeCountMapper.likecountDown(dto);
        }
        memberVO.setUserid(dto.getLikeid());
		memberVO.setApoint(2);
		memberMapper.pointUp(memberVO);
		memberVO.setUserid(dto.getWriter());
		memberVO.setApoint(15);
		memberMapper.pointUp(memberVO);
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
        memberVO.setUserid(dto.getLikeid());
 		memberVO.setApoint(2);
 		memberMapper.pointDown(memberVO);
 		memberVO.setUserid(dto.getWriter());
 		memberVO.setApoint(15);
 		memberMapper.pointDown(memberVO);
        return likeCountMapper.likeDelete(dto);
    }

    @Transactional
    @Override
    public int replyLikeRegister(ReplyLikeDTO dto) {
        if(dto.getLiketype() == 1 ) {
            likeCountMapper.replyLikecountUp(dto);
        } else if(dto.getLiketype() == -1 ) {
            likeCountMapper.replyLikecountDown(dto);
        }
        memberVO.setUserid(dto.getLikerid());
 		memberVO.setApoint(2);
 		memberMapper.pointUp(memberVO);
 		memberVO.setUserid(dto.getWriter());
 		memberVO.setApoint(15);
 		memberMapper.pointUp(memberVO);
        return likeCountMapper.replyLikeRegister(dto);
    }

    @Transactional
    @Override
    public int replyLikeDelete(ReplyLikeDTO dto) {
        if(dto.getLiketype() == 1) {
            likeCountMapper.replyLikecountDown(dto);
        } else if(dto.getLiketype() == -1 ) {
            likeCountMapper.replyLikecountUp(dto);
        }
        memberVO.setUserid(dto.getLikerid());
 		memberVO.setApoint(2);
 		memberMapper.pointDown(memberVO);
 		memberVO.setUserid(dto.getWriter());
 		memberVO.setApoint(15);
 		memberMapper.pointDown(memberVO);
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
