package com.ncs.mapper;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;

public interface ColumnMapper {
	
	int searchRowcount(SearchCriteria cri);
	List<ColumnVO> searchList(SearchCriteria cri);
	
	int totalRowCount();
	int countUp(ColumnVO vo);
	
	List<ColumnVO> columnList();
	
	public int insert(ColumnVO vo);
	public int update(ColumnVO vo);
	public int delete(ColumnVO vo);

}