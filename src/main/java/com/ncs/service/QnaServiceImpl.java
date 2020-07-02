package com.ncs.service;

import com.ncs.mapper.QnaMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaMapper mapper;
	
	@Override
	public List<QnaVO> selectList(){
		return mapper.selectList();
	}
	@Override
	public int insert(QnaVO vo) {
		return mapper.insert(vo);
	}
	@Override
	public QnaVO selectOne(QnaVO vo) {
		return mapper.selectOne(vo);
	}
	@Override
	public int update(QnaVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(QnaVO vo) {
		return mapper.delete(vo);
	}
	@Override
	public int totalRowCount() {
		return mapper.totalRowCount();
	}
	@Override
	public List<QnaVO> searchList(SearchCriteria cri){
		return mapper.searchList(cri);
	}
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return mapper.searchRowCount(cri);
	}
}
