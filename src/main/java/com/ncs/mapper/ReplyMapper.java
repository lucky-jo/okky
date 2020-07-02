package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.vo.ReplyVO;

@Repository
public interface ReplyMapper {

	
	public List<ReplyVO> selectList(ReplyVO rvo);
	public int rinsert(ReplyVO rvo);
}
