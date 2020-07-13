package com.ncs.service;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;

import java.util.List;

public interface MemberService {

    MemberVO read(String userid);

    int register(MemberVO vo);
    
    MemberVO get(String userid);

    int edit(MemberVO memberVO);

    int passwordChange(MemberVO memberVO);
    
    List<QnaVO> historyBoardList(SearchCriteria cri);
    
    List<Integer> historyRowCount(SearchCriteria cri);

    int useridDuplicate(MemberVO memberVO);
}
