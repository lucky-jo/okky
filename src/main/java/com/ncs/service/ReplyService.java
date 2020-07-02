package com.ncs.service;

import java.util.List;

import com.ncs.vo.ReplyVO;

public interface ReplyService {

	 List<ReplyVO> selectList(ReplyVO rvo);
	 int rinsert(ReplyVO rvo);
}
