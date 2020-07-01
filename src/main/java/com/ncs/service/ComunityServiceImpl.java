package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.ComunityMapper;
import com.ncs.util.Criteria;
import com.ncs.util.SearchCriteria;
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
	@Override
	public ComunityVO selectOne(ComunityVO vo) {
		return mapper.selectOne(vo);
	}
	@Override
	public int update(ComunityVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(ComunityVO vo) {
		return mapper.delete(vo);
	}
	@Override
	public int totalRowCount() {
		return mapper.totalRowCount();
	}
	@Override
	public List<ComunityVO> criList(Criteria cri){
		return mapper.criList(cri);
	}
	@Override
	public List<ComunityVO> searchList(SearchCriteria cri){
		return mapper.searchList(cri);
	}
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return mapper.searchRowCount(cri);
	}
}
