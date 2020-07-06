package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;


public interface JobsReplyService {
	
	    
	  
	List<JobsReplyVO> selectlist(int seq); // selectList()
	
	int rinsert(JobsReplyVO rvo); // rinsert
	
	int update(JobsReplyVO rvo); // update
	
	int delete(JobsReplyVO rvo); // delete

	

	
	


		
		
		
		

}
