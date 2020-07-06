package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.JobsReplyMapper;
import com.ncs.vo.JobsReplyVO;



@Service
public class JobsReplyServiceImpl implements JobsReplyService {
	
	@Autowired
	JobsReplyMapper rmapper;
	
	
	@Override
	public List<JobsReplyVO>selectlist(int seq){
		return rmapper.selectlist(seq);
	}
	@Override 
	public int update(JobsReplyVO rvo) { 
	    return rmapper.update(rvo); 
	}
	@Override 
	public int delete(JobsReplyVO rvo) { 
		return rmapper.delete(rvo);
    }
	@Override
	public int rinsert(JobsReplyVO rvo) {
		return rmapper.rinsert(rvo);
	}
	
	
	
	
	
}
