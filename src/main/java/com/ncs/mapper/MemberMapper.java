package com.ncs.mapper;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.AuthKeyDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    
    List<QnaVO> historyBoardList(SearchCriteria cri);
    
    List<Integer> historyRowCount(SearchCriteria cri);

    int useridDuplicate(MemberVO memberVO);

    int addAuthKey(AuthKeyDTO authKeyDTO);

    int getAuthKey(AuthKeyDTO authKeyDTO);

}
