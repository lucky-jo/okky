package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;

public interface ComunityService {

	List<ComunityVO> selectList();
	int insert(ComunityVO comunityVO);
	ComunityVO selectOne(ComunityVO comunityVO);
	int update(ComunityVO comunityVO);
	int delete(ComunityVO comunityVO);
	int totalRowCount();
	List<ComunityVO> searchList(SearchCriteria searchCriteria);
	int searchRowCount(SearchCriteria searchCriteria);
	//int countUp(ComunityVO vo);
}
