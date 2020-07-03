package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.JobsMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.JobsVO;



@Service
public class JobsServiceImpl implements JobsService {
	
	
	@Autowired
	JobsMapper mapper;
	
	@Override
	public List<JobsVO>selectlist(){
		return mapper.selectlist();
	}
	@Override 
	public int insert(JobsVO vo) { 
		return mapper.insert(vo); 
	}
	@Override 
	public int rinsert(JobsVO vo) { 
		return mapper.rinsert(vo); 
	}
	@Override
	public JobsVO selectOne(JobsVO vo) {
		return mapper.selectOne(vo);
	}
	@Override 
	public int update(JobsVO vo) { 
	    return mapper.update(vo); 
	}
	@Override 
	public int delete(JobsVO vo) { 
		return mapper.delete(vo);
    }
	@Override 
	public int searchRowCount(SearchCriteria cri) { 
		return mapper.searchRowCount(cri); 
    }
	@Override 
	public List<JobsVO> searchList(SearchCriteria cri) { 
		return mapper.searchList(cri); 
	}
	
	
	
	
}
