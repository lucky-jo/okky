package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.vo.ColumnCommentVO;

@Repository
public interface ColumnCommentMapper {
	
	public List<ColumnCommentVO> selectList(ColumnCommentVO cvo);
	public int cinsert(ColumnCommentVO cvo);
	
	public List<ColumnCommentVO> selectList();
	public ColumnCommentVO selectOne(ColumnCommentVO cvo);

}
