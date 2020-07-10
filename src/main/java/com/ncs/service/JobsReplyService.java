package com.ncs.service;

import com.ncs.vo.ReplyVO;

import java.util.List;

public interface JobsReplyService {
	
	int register(ReplyVO replyVO);
	List<ReplyVO> selectlist(int seq);
	int update(ReplyVO replyVO);
	int delete(ReplyVO replyVO);
	int replyCount();

}
