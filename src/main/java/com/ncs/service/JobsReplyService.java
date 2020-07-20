package com.ncs.service;

import java.util.List;


import com.ncs.vo.JobsReplyVO;



public interface JobsReplyService {
	
	    
	  
	List<JobsReplyVO> selectlist(int seq); // selectList()
	
	int register(JobsReplyVO rvo); // rinsert
	
	int update(JobsReplyVO rvo); // update
	
	int delete(JobsReplyVO rvo); // delete

	

	
	


		
		
		
		

}
