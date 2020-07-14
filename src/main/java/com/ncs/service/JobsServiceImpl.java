package com.ncs.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncs.mapper.JobsMapper;
import com.ncs.mapper.LikeCountMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.JobsReplyVO;
import com.ncs.vo.JobsVO;



@Service
public class JobsServiceImpl<GetCountDto> implements JobsService {
	
	
	@Autowired
	JobsMapper mapper;
	
	@Autowired
	LikeCountMapper likeCountMapper;
	
	
	@Override
	public List<JobsVO>selectlist(){
		return mapper.selectlist();
	}
	@Override 
	public int insert(JobsVO vo) { 
		return mapper.insert(vo); 
	}
	@Override
	public JobsVO selectOne(JobsVO vo) {
		GetCountDTO dto = new GetCountDTO();
		dto.setId("Lee");
		dto.setBoard(vo.getBoard());
		dto.setToday(getFolder());
		dto.setSeq(vo.getSeq());
		if( mapper.getcount(dto) == 0) {
			mapper.registercount(dto);
			mapper.countUp(vo.getSeq());
		}
		return mapper.selectOne(vo);
	}
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}
	@Override 
	public int update(JobsVO vo) { 
	    return mapper.update(vo); 
	}
	@Override 
	public int delete(JobsVO vo) { 
		return mapper.delete(vo);
    }
	@Override 
	public int searchRowCount(SearchCriteria cri) { 
		return mapper.searchRowCount(cri); 
    }
	@Override 
	public List<JobsVO> searchList(SearchCriteria cri) { 
		return mapper.searchList(cri); 
	}
	@Override
	public int totalRowCount() {
		return mapper.totalRowCount();
	}
	@Override
	public int countUp(JobsVO vo) {
		return mapper.countUp(vo);
	}
	
	
	
}
