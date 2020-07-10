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
    public int likeRegister(LikeDTO likeDTO) {
        if(likeDTO.getLiketype() == 1 ) {
            likeCountMapper.likecountUp(likeDTO);
        } else if(likeDTO.getLiketype() == -1 ) {
            likeCountMapper.likecountDown(likeDTO);
        }
        memberVO.setUserid(likeDTO.getLikeid());
		memberVO.setApoint(2);
		memberMapper.pointUp(memberVO);
		memberVO.setUserid(likeDTO.getWriter());
		memberVO.setApoint(15);
		memberMapper.pointUp(memberVO);
        return likeCountMapper.likeRegister(likeDTO);
    }

    @Transactional
    @Override
    public int likeDelete(LikeDTO likeDTO) {
        if(likeDTO.getLiketype() == 1) {
            likeCountMapper.likecountDown(likeDTO);
        } else if(likeDTO.getLiketype() == -1 ) {
            likeCountMapper.likecountUp(likeDTO);
        }
        memberVO.setUserid(likeDTO.getLikeid());
 		memberVO.setApoint(2);
 		memberMapper.pointDown(memberVO);
 		memberVO.setUserid(likeDTO.getWriter());
 		memberVO.setApoint(15);
 		memberMapper.pointDown(memberVO);
        return likeCountMapper.likeDelete(likeDTO);
    }

    @Transactional
    @Override
    public int replyLikeRegister(ReplyLikeDTO replyLikeDTO) {
        if(replyLikeDTO.getLiketype() == 1 ) {
            likeCountMapper.replyLikecountUp(replyLikeDTO);
        } else if(replyLikeDTO.getLiketype() == -1 ) {
            likeCountMapper.replyLikecountDown(replyLikeDTO);
        }
        memberVO.setUserid(replyLikeDTO.getLikerid());
 		memberVO.setApoint(2);
 		memberMapper.pointUp(memberVO);
 		memberVO.setUserid(replyLikeDTO.getWriter());
 		memberVO.setApoint(15);
 		memberMapper.pointUp(memberVO);
        return likeCountMapper.replyLikeRegister(replyLikeDTO);
    }

    @Transactional
    @Override
    public int replyLikeDelete(ReplyLikeDTO replyLikeDTO) {
        if(replyLikeDTO.getLiketype() == 1) {
            likeCountMapper.replyLikecountDown(replyLikeDTO);
        } else if(replyLikeDTO.getLiketype() == -1 ) {
            likeCountMapper.replyLikecountUp(replyLikeDTO);
        }
        memberVO.setUserid(replyLikeDTO.getLikerid());
 		memberVO.setApoint(2);
 		memberMapper.pointDown(memberVO);
 		memberVO.setUserid(replyLikeDTO.getWriter());
 		memberVO.setApoint(15);
 		memberMapper.pointDown(memberVO);
        return likeCountMapper.replyLikeDelete(replyLikeDTO);
    }

    @Override
    public int likeExist(LikeDTO likeDTO) {
        return likeCountMapper.likeExist(likeDTO);
    }

    @Override
    public int replyLikeExist(ReplyLikeDTO replyLikeDTO) {
        return likeCountMapper.replyLikeExist(replyLikeDTO);
    }

}
