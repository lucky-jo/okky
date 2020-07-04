package com.ncs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.TechReplyMapper;
import com.ncs.vo.ReplyVO;

@Service
public class TechReplyServiceImpl implements TechReplyService {
	
	@Autowired
	TechReplyMapper rmapper;

	@Override
	public int register(ReplyVO rvo) {
		return rmapper.register(rvo);
	}

	@Override
	public List<ReplyVO> selectlist(int seq) {
		return rmapper.selectlist(seq);
	}

	@Override
	public int update(ReplyVO rvo) {
		return rmapper.update(rvo);
	}

	@Override
	public int delete(ReplyVO rvo) {
		return rmapper.delete(rvo);
	}

	@Override
	public int replyCount() {
		return rmapper.replyCount();
	}
	
	

}
