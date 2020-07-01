package com.ncs.mapper;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsVO;

public interface JobsMapper {

	/*
	 * public int searchRowCount(SearchCriteria cri);
	 * 
	 * public List<JobsVO> searchList(SearchCriteria cri);
	 */
	
	public List<JobsVO> selectlist();

	public int newinsert(JobsVO vo);

	public JobsVO selectOne(JobsVO vo);
	
	public int update(JobsVO vo);
	/*
	 * public int insert(JobsVO vo);
	 * 
	 * 
	 * 
	 * public int delete(JobsVO vo);
	 */

	
	
}
