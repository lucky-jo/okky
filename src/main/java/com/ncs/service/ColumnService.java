package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;

public interface ColumnService {

	List<ColumnVO> selectList();
	int insert(ColumnVO vo);
	ColumnVO selectOne(ColumnVO vo);
	int update(ColumnVO vo);
	int delete(ColumnVO vo);
	int totalRowCount();
	List<ColumnVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
}
