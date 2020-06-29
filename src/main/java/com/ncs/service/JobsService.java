package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsVO;


public interface JobsService {
	
	    
	int searchRowCount(SearchCriteria cri);//searchRowCount
	
	List<JobsVO> searchList(SearchCriteria cri);//searchList
	  
	List<JobsVO> selectlist(SearchCriteria cri); // selectList()
	
	JobsVO selectOne(JobsVO vo); // selectOne
		
	int insert(JobsVO vo); // insert
		
	int update(JobsVO vo); // update
		
	int delete(JobsVO vo); // delete

		

		

		
		
		
		

}
