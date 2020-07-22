package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.JobsMapper;
import com.ncs.mapper.JobsReplyMapper;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;
import com.ncs.vo.ReplyVO;



@Service
public class JobsReplyServiceImpl implements JobsReplyService {
	
	@Autowired
	JobsReplyMapper rmapper;
	
	@Autowired
	JobsMapper mapper;
	
	@Override
	public List<ReplyVO>selectlist(int seq){
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
	public int register(JobsReplyVO rvo) {
		mapper.replycountUp(rvo.getSeq());
		return rmapper.register(rvo);
	}
	@Override
	public int replyCount() {
		return rmapper.replyCount();
	}
	
	
	
}
