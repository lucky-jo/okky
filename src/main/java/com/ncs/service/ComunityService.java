package com.ncs.service;

import java.util.List;

import com.ncs.vo.ComunityVO;

public interface ComunityService {

	List<ComunityVO> selectList();
	int insert(ComunityVO vo);
	ComunityVO selectOne(ComunityVO vo);
	int update(ComunityVO vo);
	int delete(ComunityVO vo);
}
