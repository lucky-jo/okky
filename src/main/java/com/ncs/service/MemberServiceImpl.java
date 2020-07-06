package com.ncs.service;

import com.ncs.mapper.MemberMapper;
import com.ncs.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper memberMapper;

    @Override
    public MemberVO read(String userid) {
        return null;
    }

    @Transactional
    @Override
    public int register(MemberVO vo) {
        memberMapper.register(vo);
        return memberMapper.auth(vo.getUserid());
    }

}
