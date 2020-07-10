package com.ncs.mapper;

import org.springframework.stereotype.Repository;

import com.ncs.vo.MemberVO;

@Repository
public interface MemberMapper {
    MemberVO read(String userid);

    int auth(String userid);

    int register(MemberVO vo);
    
    MemberVO get(String userid);
    
    int pointUp(MemberVO vo);
    
    int pointDown(MemberVO vo);

    int edit(MemberVO memberVO);

    int passwordChange(MemberVO memberVO);

}
