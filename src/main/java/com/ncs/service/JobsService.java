package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;


public interface JobsService {
	
	    
	  
	List<JobsVO> selectlist(); // selectList()
	
	int insert(JobsVO vo); // insert
	
	JobsVO selectOne(JobsVO vo); // selectOne
	
	int update(JobsVO vo); // update
	
	int delete(JobsVO vo); // delete
	
	List<JobsVO> searchList(SearchCriteria cri);//searchList
		
	int searchRowCount(SearchCriteria cri);//searchRowCount

	int totalRowCount();

	int countUp(int seq);

	

    
		

		
		
		
		

}
