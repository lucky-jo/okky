package com.ncs.service;

import java.util.List;

import com.ncs.util.Criteria;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;

public interface ComunityService {

	List<ComunityVO> selectList();
	int insert(ComunityVO vo);
	ComunityVO selectOne(ComunityVO vo);
	int update(ComunityVO vo);
	int delete(ComunityVO vo);
	int totalRowCount();
	List<ComunityVO> criList(Criteria cri); 
	List<ComunityVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
	int countUp(ComunityVO vo);
}
