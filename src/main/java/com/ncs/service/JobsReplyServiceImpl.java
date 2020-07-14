package com.ncs.service;

import com.ncs.mapper.JobsMapper;
import com.ncs.mapper.JobsReplyMapper;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobsReplyServiceImpl implements JobsReplyService {
	
	@Autowired
	JobsReplyMapper jobsReplyMapper;
	@Autowired
	JobsMapper jobsMapper;

	@Override
	public int register(ReplyVO replyVO) {
		
		/* 댓글 남긴 사람들에게 업데이트 될 때마다 메시지 전송
		 * for (iterable_type iterable_element : iterable) {
		 * messageMapper.delevery(element); }
		 */
		jobsMapper.replycountUp(replyVO.getSeq());
		return jobsReplyMapper.register(replyVO);
	}

	@Override
	public List<ReplyVO> selectlist(int seq) {
		return jobsReplyMapper.selectlist(seq);
	}

	@Override
	public int update(ReplyVO replyVO) {
		return jobsReplyMapper.update(replyVO);
	}

	@Override
	public int delete(ReplyVO replyVO) {
		return jobsReplyMapper.delete(replyVO);
	}

	@Override
	public int replyCount() {
		return jobsReplyMapper.replyCount();
	}
	
	@Override
	public ReplyVO get(ReplyVO replyVO) {
		return jobsReplyMapper.get(replyVO);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		return jobsReplyMapper.modify(replyVO);
	}
	

}
