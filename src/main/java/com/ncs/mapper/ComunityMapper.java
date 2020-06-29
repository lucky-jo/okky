package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.vo.ComunityVO;

@Repository
public interface ComunityMapper {
	
	public List<ComunityVO> selectList();
	
}
