package com.ncs.service;

import java.util.List;

import com.ncs.vo.JobsVO;


public interface JobsService {
	
	    
	/*
	 * int searchRowCount(SearchCriteria cri);//searchRowCount
	 * 
	 * List<JobsVO> searchList(SearchCriteria cri);//searchList
	 */	  
	List<JobsVO> selectlist(); // selectList()
	
	int insert(JobsVO vo); // insert
	
	JobsVO selectOne(JobsVO vo); // selectOne
	
	int update(JobsVO vo); // update
	
	int delete(JobsVO vo); // delete
	
	
		

		

		
		
		
		

}
