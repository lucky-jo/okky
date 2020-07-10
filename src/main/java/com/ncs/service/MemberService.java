package com.ncs.service;

import com.ncs.vo.MemberVO;

public interface MemberService {

    MemberVO read(String userid);

    int register(MemberVO vo);
    
    MemberVO get(String userid);

    int edit(MemberVO memberVO);

    int passwordChange(MemberVO memberVO);
}
