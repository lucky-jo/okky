package com.ncs.service;

import java.util.List;


import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;
import com.ncs.vo.ReplyVO;



public interface JobsReplyService {
	
	    
	int register(JobsReplyVO rvo); // rinsert  
	List<ReplyVO> selectlist(int seq); // selectList()
	int update(JobsReplyVO rvo); // update
	int delete(JobsReplyVO rvo); // delete
	int replyCount();

	

	
	


		
		
		
		

}
