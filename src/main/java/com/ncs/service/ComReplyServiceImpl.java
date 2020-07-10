package com.ncs.service;

import com.ncs.mapper.ComReplyMapper;
import com.ncs.mapper.QnaMapper;
import com.ncs.vo.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComReplyServiceImpl implements ComReplyService {
	
	@Autowired
	ComReplyMapper comReplyMapper;
	
	@Autowired
	QnaMapper qnaMapper;

	@Override
	public int register(ReplyVO replyVO) {
		qnaMapper.replycountUp(replyVO.getSeq());
		return comReplyMapper.register(replyVO);
	}

	@Override
	public List<ReplyVO> selectList(int seq) {
		return comReplyMapper.selectList(seq);
	}

	@Override
	public int update(ReplyVO replyVO) {
		return comReplyMapper.update(replyVO);
	}

	@Override
	public int delete(ReplyVO replyVO) {
		return comReplyMapper.delete(replyVO);
	}

	@Override
	public int replyCount() {
		return comReplyMapper.replyCount();
	}
	
	

}
