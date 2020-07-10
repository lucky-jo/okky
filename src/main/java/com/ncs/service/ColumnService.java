package com.ncs.service;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;

import java.util.List;

public interface ColumnService {

	List<ColumnVO> selectList();
	int insert(ColumnVO columnVO);
	ColumnVO selectOne(ColumnVO columnVO);
	int update(ColumnVO columnVO);
	int delete(ColumnVO columnVO);
	int totalRowCount();
	List<ColumnVO> searchList(SearchCriteria searchCriteria);
	int searchRowCount(SearchCriteria searchCriteria);
}
