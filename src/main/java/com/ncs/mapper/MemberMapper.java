package com.ncs.mapper;

import com.ncs.vo.MemberVO;

public interface MemberMapper {
    MemberVO read(String userid);

    int auth(String userid);

    int register(MemberVO vo);

}
