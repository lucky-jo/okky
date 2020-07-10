package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.JobsVO;

@Repository
public interface JobsMapper {
	
	List<JobsVO> selectList();
	int insert(JobsVO vo);
	JobsVO selectOne(JobsVO vo);
	int update(JobsVO vo);
	int delete(JobsVO vo);
	int totalRowCount();
	List<JobsVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
	int countUp(int seq);
	int replycountUp(int seq);
	int getcount(GetCountDTO dto);
	int registercount(GetCountDTO dto);
}
