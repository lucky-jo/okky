package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.ComReplyMapper;
import com.ncs.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ComReplyMapper mapper;
	
	@Override
	public List<ReplyVO> selectList(ReplyVO rvo){
		return mapper.selectList(rvo);
	}

	@Override
	public int rinsert(ReplyVO rvo) {
		return mapper.rinsert(rvo);
	}
}
