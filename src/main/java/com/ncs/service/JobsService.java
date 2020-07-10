package com.ncs.service;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsVO;

public interface JobsService {

	List<JobsVO> selectList();
	int insert(JobsVO vo);
	JobsVO selectOne(JobsVO vo);
	int update(JobsVO vo);
	int delete(JobsVO vo);
	int totalRowCount();
	List<JobsVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
}
