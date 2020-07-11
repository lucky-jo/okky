package com.ncs.service;

import com.ncs.mapper.QnaMapper;
import com.ncs.mapper.QnaReplyMapper;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {
	
	@Autowired
	QnaReplyMapper qnaReplyMapper;
	
	@Autowired
	QnaMapper qnaMapper;

	@Override
	public int register(ReplyVO replyVO) {
		
		/* 댓글 남긴 사람들에게 업데이트 될 때마다 메시지 전송
		 * for (iterable_type iterable_element : iterable) {
		 * messageMapper.delevery(element); }
		 */
		qnaMapper.replycountUp(replyVO.getSeq());
		return qnaReplyMapper.register(replyVO);
	}

	@Override
	public List<ReplyVO> selectlist(int seq) {
		return qnaReplyMapper.selectlist(seq);
	}

	@Override
	public int update(ReplyVO replyVO) {
		return qnaReplyMapper.update(replyVO);
	}

	@Override
	public int delete(ReplyVO replyVO) {
		return qnaReplyMapper.delete(replyVO);
	}

	@Override
	public int replyCount() {
		return qnaReplyMapper.replyCount();
	}

	@Override
	public ReplyVO get(ReplyVO replyVO) {
		return qnaReplyMapper.get(replyVO);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		return qnaReplyMapper.modify(replyVO);
	}


}
