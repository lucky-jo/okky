package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.ColumnCommentMapper;
import com.ncs.vo.ColumnCommentVO;

@Service
public class ColumnCommentServiceImpl implements ColumnCommentService {

	@Autowired
	ColumnCommentMapper mapper;
	
	@Override
	public List<ColumnCommentVO> selectList(ColumnCommentVO cvo){
		return mapper.selectList(cvo);
	}
	public int cinsert(ColumnCommentVO cvo) {
		return mapper.cinsert(cvo);
	}
}
