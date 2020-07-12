package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.JoinDTO;
import com.ncs.vo.QnaVO;

public interface QnaService {

	List<QnaVO> selectList();
	int insert(QnaVO qnaVO);
	QnaVO selectOne(QnaVO qnaVO);
	int update(QnaVO qnaVO);
	int delete(QnaVO qnaVO);
	int totalRowCount();
	List<JoinDTO> searchList(SearchCriteria searchCriteria);
	int searchRowCount(SearchCriteria searchCriteria);
}
