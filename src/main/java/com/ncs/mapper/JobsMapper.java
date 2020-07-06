package com.ncs.mapper;

import java.util.List;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;

public interface JobsMapper {

	public List<JobsVO> selectlist();

	public int insert(JobsVO vo);

	public JobsVO selectOne(JobsVO vo);
	
	public int update(JobsVO vo);
	
	public int delete(JobsVO vo);
	
	public int searchRowCount(SearchCriteria cri);

	public List<JobsVO> searchList(SearchCriteria cri);
	
	
	
}
