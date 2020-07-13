package com.ncs.service;

import com.ncs.mapper.MemberMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

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
    public int register(MemberVO memberVO) {
        memberMapper.register(memberVO);
        return memberMapper.auth(memberVO.getUserid());
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

	@Override
	public List<QnaVO> historyBoardList(SearchCriteria cri) {
		return memberMapper.historyBoardList(cri);
	}

	@Override
	public List<Integer> historyRowCount(SearchCriteria cri) {
		return memberMapper.historyRowCount(cri);
	}

    @Override
    public int useridDuplicate(MemberVO memberVO) {
        return memberMapper.useridDuplicate(memberVO);
    }

}