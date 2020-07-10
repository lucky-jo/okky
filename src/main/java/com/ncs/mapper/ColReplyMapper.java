package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.vo.ReplyVO;

@Repository
public interface ColReplyMapper {
	
	int register(ReplyVO rvo);
	List<ReplyVO> selectlist(int seq);
	int update(ReplyVO rvo);
	int delete(ReplyVO rvo);
	int replyCount();

}
