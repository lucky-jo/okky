package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.QnaVO;

public interface QnaService {

	List<QnaVO> selectList();
	int insert(QnaVO vo);
	QnaVO selectOne(QnaVO vo);
	int update(QnaVO vo);
	int delete(QnaVO vo);
	int totalRowCount();
	List<QnaVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
	int like(LikeDTO dto);
}
