package com.ncs.service;

import com.ncs.vo.ReplyVO;

import java.util.List;

public interface QnaReplyService {
	
	int register(ReplyVO rvo);
	List<ReplyVO> selectlist(int seq);
	int update(ReplyVO rvo);
	int delete(ReplyVO rvo);
	int replyCount();
	ReplyVO get(ReplyVO replyVO);

}
