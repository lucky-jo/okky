package com.ncs.service;

import java.util.List;

import com.ncs.vo.ReplyVO;

public interface ColReplyService {
	
	int register(ReplyVO rvo);
	List<ReplyVO> selectlist(int seq);
	int update(ReplyVO rvo);
	int delete(ReplyVO rvo);
	int replyCount();

}
