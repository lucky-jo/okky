package com.ncs.service;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.QnaVO;

import java.util.List;

public interface QnaService {

	List<QnaVO> selectList();
	int insert(QnaVO vo);
	QnaVO selectOne(QnaVO vo);
	int update(QnaVO vo);
	int delete(QnaVO vo);
	int totalRowCount();
	List<QnaVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
}
