package com.ncs.service;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.QnaVO;

import java.util.List;

public interface QnaService {

	List<QnaVO> selectList();
	int insert(QnaVO qnaVO);
	QnaVO selectOne(QnaVO qnaVO);
	int update(QnaVO qnaVO);
	int delete(QnaVO qnaVO);
	int totalRowCount();
	List<QnaVO> searchList(SearchCriteria searchCriteria);
	int searchRowCount(SearchCriteria searchCriteria);
}
