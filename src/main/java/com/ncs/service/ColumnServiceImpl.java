package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.ColumnMapper;
import com.ncs.util.Criteria;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;

@Service
public class ColumnServiceImpl implements ColumnService {
	@Autowired
	ColumnMapper mapper;
	
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return mapper.searchRowcount(cri);
	}

	@Override
	public List<ColumnVO> searchList(SearchCriteria cri) {
		return mapper.searchList(cri);
	}

	@Override
	public int totalRowCount() {
		return mapper.totalRowCount();
	}

	@Override
	public int countUp(ColumnVO vo) {
		return mapper.countUp(vo);
	}

	@Override
	public List<ColumnVO> columnList() {
		return mapper.columnList();
	}

	@Override
	public int insert(ColumnVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int update(ColumnVO vo) {
		return mapper.update(vo);
	}
	
	@Override
	public int delete(ColumnVO vo) {
		return mapper.delete(vo);
	}
}