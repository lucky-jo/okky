package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.ComReplyMapper;
import com.ncs.mapper.ComunityMapper;
import com.ncs.vo.ReplyVO;

@Service
public class ComReplyServiceImpl implements ComReplyService {
	
	@Autowired
	ComReplyMapper comReplyMapper;
	
	@Autowired
	ComunityMapper comunityMapper;

	@Override
	public int register(ReplyVO replyVO) {
		comunityMapper.replycountUp(replyVO.getSeq());
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
	
	@Override
	public ReplyVO get(ReplyVO replyVO) {
		return comReplyMapper.get(replyVO);
	}

	@Override
	public int modify(ReplyVO replyVO) {
		return comReplyMapper.modify(replyVO);
	}

}
