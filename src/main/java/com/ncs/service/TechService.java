package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.TechVO;

public interface TechService {

	List<TechVO> selectList();
	int insert(TechVO vo);
	TechVO selectOne(TechVO vo);
	int update(TechVO vo);
	int delete(TechVO vo);
	int totalRowCount();
	List<TechVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
}
