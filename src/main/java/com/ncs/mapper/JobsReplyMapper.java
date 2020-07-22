package com.ncs.mapper;

import java.util.List;

import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.ReplyVO;

public interface JobsReplyMapper {
	
	List<ReplyVO>selectlist(int seq);
	int register(JobsReplyVO rvo);
	int update(JobsReplyVO rvo);
	int delete(JobsReplyVO rvo);
	int replyCount();

}
