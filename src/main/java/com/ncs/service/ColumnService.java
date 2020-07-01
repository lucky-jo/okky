package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;

public interface ColumnService {
	
	int searchRowCount(SearchCriteria cri);
	List<ColumnVO> searchList(SearchCriteria cri);
	
	int totalRowCount();
	int countUp(ColumnVO vo);
	
	List<ColumnVO> selectList();
	public ColumnVO selectOne(ColumnVO vo);
	
	int insert(ColumnVO vo);
	
	int update(ColumnVO vo);
	
	int delete(ColumnVO vo);

}
