package com.ncs.service;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.TechVO;

import java.util.List;

public interface TechService {

	List<TechVO> selectList();
	int insert(TechVO techVO);
	TechVO selectOne(TechVO techVO);
	int update(TechVO techVO);
	int delete(TechVO techVO);
	int totalRowCount();
	List<TechVO> searchList(SearchCriteria searchCriteria);
	int searchRowCount(SearchCriteria searchCriteria);
}
