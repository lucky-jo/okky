package com.ncs.mapper;

import com.ncs.vo.ReplyVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QnaReplyMapper {
	
	int register(ReplyVO rvo);
	List<ReplyVO> selectlist(int seq);
	int update(ReplyVO rvo);
	int delete(ReplyVO rvo);
	int replyCount();
	ReplyVO get(ReplyVO replyVO);
	int modify(ReplyVO replyVO);
}
