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
        return memberMapper.read(userid);
    }

    @Transactional
    @Override
    public int register(MemberVO vo) {
        memberMapper.register(vo);
        return memberMapper.auth(vo.getUserid());
    }

	@Override
	public MemberVO get(String userid) {
		return memberMapper.get(userid);
	}

    @Override
    public int edit(MemberVO memberVO) {
        return memberMapper.edit(memberVO);
    }

    @Override
    public int passwordChange(MemberVO memberVO) {
        return memberMapper.passwordChange(memberVO);
    }

}