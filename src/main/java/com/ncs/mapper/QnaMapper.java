package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.JoinDTO;
import com.ncs.vo.QnaVO;

@Repository
public interface QnaMapper {
	
	List<QnaVO> selectList();
	int insert(QnaVO vo);
	QnaVO selectOne(QnaVO vo);
	int update(QnaVO vo);
	int delete(QnaVO vo);
	int totalRowCount();
	List<JoinDTO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
	int countUp(int seq);
	int replycountUp(int seq);
	int getcount(GetCountDTO dto);
	int registercount(GetCountDTO dto);
}
