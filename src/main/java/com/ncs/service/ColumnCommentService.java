package com.ncs.service;

import java.util.List;

import com.ncs.vo.ColumnCommentVO;

public interface ColumnCommentService {

	List<ColumnCommentVO> selectList(ColumnCommentVO cvo);
	
	int cinsert(ColumnCommentVO cvo);
}