package com.ncs.service;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsVO;

import java.util.List;

public interface JobsService {

	List<JobsVO> selectList();
	int insert(JobsVO jobsVO);
	JobsVO selectOne(JobsVO jobsVO);
	int update(JobsVO jobsVO);
	int delete(JobsVO jobsVO);
	int totalRowCount();
	List<JobsVO> searchList(SearchCriteria searchCriteria);
	int searchRowCount(SearchCriteria searchCriteria);
}
