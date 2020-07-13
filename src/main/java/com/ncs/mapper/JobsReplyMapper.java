package com.ncs.mapper;

import java.util.List;

import com.ncs.vo.JobsReplyVO;

public interface JobsReplyMapper {
	
	int jdetail(JobsReplyVO rvo);
	List<JobsReplyVO>selectlist(int seq);
	int update(JobsReplyVO rvo);
	int delete(JobsReplyVO rvo);
	int rinsert(JobsReplyVO rvo);
	int replyCount();

}
