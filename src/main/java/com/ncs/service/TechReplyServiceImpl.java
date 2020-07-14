package com.ncs.service;

import com.ncs.mapper.TechMapper;
import com.ncs.mapper.TechReplyMapper;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TechReplyServiceImpl implements TechReplyService {
	
	@Autowired
	TechReplyMapper techReplyMapper;
	
	@Autowired
	TechMapper techMapper;

	@Override
	public int register(ReplyVO replyVO) {
		
		/* 댓글 남긴 사람들에게 업데이트 될 때마다 메시지 전송
		 * for (iterable_type iterable_element : iterable) {
		 * messageMapper.delevery(element); }
		 */
		techMapper.replycountUp(replyVO.getSeq());
		return techReplyMapper.register(replyVO);
	}

	@Override
	public List<ReplyVO> selectlist(int seq) {
		return techReplyMapper.selectlist(seq);
	}

	@Override
	public int update(ReplyVO replyVO) {
		return techReplyMapper.update(replyVO);
	}

	@Override
	public int delete(ReplyVO replyVO) {
		return techReplyMapper.delete(replyVO);
	}

	@Override
	public int replyCount() {
		return techReplyMapper.replyCount();
	}
	@Override
	public ReplyVO get(ReplyVO replyVO) {
		return techReplyMapper.get(replyVO);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		return techReplyMapper.modify(replyVO);
	}

	

}
