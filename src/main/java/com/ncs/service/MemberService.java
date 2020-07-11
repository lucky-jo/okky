package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;

public interface MemberService {

    MemberVO read(String userid);

    int register(MemberVO vo);
    
    MemberVO get(String userid);

    int edit(MemberVO memberVO);

    int passwordChange(MemberVO memberVO);
    
    List<QnaVO> historyBoardList(SearchCriteria cri);
    
    List<Integer> historyRowCount(SearchCriteria cri);
}
