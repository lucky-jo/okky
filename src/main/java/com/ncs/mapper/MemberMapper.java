package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.AuthKeyDTO;
import com.ncs.vo.AuthVO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;

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

	int nicknameDuplicate(MemberVO memberVO);

	int emailDuplicate(MemberVO memberVO);

	int sendAuthkey(AuthKeyDTO authdto);

	int authKeyCheck(AuthKeyDTO authdto);

}
