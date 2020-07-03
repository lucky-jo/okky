package com.ncs.mapper;

import java.util.List;

import com.ncs.vo.ColumnCommentVO;

public interface ColumnCommentMapper {
	
	public List<ColumnCommentVO> selectList(ColumnCommentVO cvo);
	public int cinsert(ColumnCommentVO cvo);

}
