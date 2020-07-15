package com.ncs.mapper;

import java.util.List;

import com.ncs.util.Criteria;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
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

	public int totalRowCount();
	
	public int replycountUp(int seq);
	
    public int getcount(GetCountDTO dto);
	
	public int registercount(GetCountDTO dto);
	
	public List<JobsVO> criList(Criteria cri);

	public int countUp(int seq);



	
}
