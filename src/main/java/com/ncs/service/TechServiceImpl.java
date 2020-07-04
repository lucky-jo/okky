package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.TechMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.TechVO;

@Service
public class TechServiceImpl implements TechService{

	@Autowired
	TechMapper mapper;
	
	@Override
	public List<TechVO> selectList(){
		return mapper.selectList();
	}
	@Override
	public int insert(TechVO vo) {
		return mapper.insert(vo);
	}
	@Override
	public TechVO selectOne(TechVO vo) {
		return mapper.selectOne(vo);
	}
	@Override
	public int update(TechVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(TechVO vo) {
		return mapper.delete(vo);
	}
	@Override
	public int totalRowCount() {
		return mapper.totalRowCount();
	}
	@Override
	public List<TechVO> searchList(SearchCriteria cri){
		return mapper.searchList(cri);
	}
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return mapper.searchRowCount(cri);
	}
}
