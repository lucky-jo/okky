package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.ComunityMapper;
import com.ncs.vo.ComunityVO;

@Service
public class ComunityServiceImpl implements ComunityService{
	
	@Autowired
	ComunityMapper mapper;
	
	@Override
	public List<ComunityVO> selectList(){
		return mapper.selectList();
	}
	@Override
	public int insert(ComunityVO vo) {
		return mapper.insert(vo);
	}

}
