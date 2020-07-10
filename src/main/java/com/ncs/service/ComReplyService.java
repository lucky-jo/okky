package com.ncs.service;

import com.ncs.vo.ReplyVO;

import java.util.List;

public interface ComReplyService {
	
	int register(ReplyVO replyVO);
	List<ReplyVO> selectList(int seq);
	int update(ReplyVO replyVO);
	int delete(ReplyVO replyVO);
	int replyCount();

}
