package com.ncs.service;

import com.ncs.mapper.ColReplyMapper;
import com.ncs.mapper.ColumnMapper;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColReplyServiceImpl implements ColReplyService {
	
	@Autowired
	ColReplyMapper colReplyMapper;
	
	@Autowired
	ColumnMapper columnMapper;

	@Override
	public int register(ReplyVO replyVO) {
		
		/* 댓글 남긴 사람들에게 업데이트 될 때마다 메시지 전송
		 * for (iterable_type iterable_element : iterable) {
		 * messageMapper.delevery(element); }
		 */
		columnMapper.replycountUp(replyVO.getSeq());
		return colReplyMapper.register(replyVO);
	}

	@Override
	public List<ReplyVO> selectlist(int seq) {
		return colReplyMapper.selectlist(seq);
	}

	@Override
	public int update(ReplyVO replyVO) {
		return colReplyMapper.update(replyVO);
	}

	@Override
	public int delete(ReplyVO replyVO) {
		return colReplyMapper.delete(replyVO);
	}

	@Override
	public int replyCount() {
		return colReplyMapper.replyCount();
	}

	@Override
	public ReplyVO get(ReplyVO replyVO) {
		return colReplyMapper.get(replyVO);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		return colReplyMapper.modify(replyVO);
	}
}
