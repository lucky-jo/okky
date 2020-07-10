package com.ncs.service;

import com.ncs.mapper.JobsMapper;
import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.MemberMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.JobsVO;
import com.ncs.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class JobsServiceImpl implements JobsService{

	@Autowired
	JobsMapper jobsMapper;

	@Autowired
	LikeCountMapper likeCountMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MemberVO memberVO;
	
	@Override
	public List<JobsVO> selectList(){
		return jobsMapper.selectList();
	}
	
	@Transactional
	@Override
	public int insert(JobsVO jobsVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		memberVO.setUserid(request.getRemoteUser());
		memberVO.setApoint(30);
		memberMapper.pointUp(memberVO);
		return jobsMapper.insert(jobsVO);
	}

	@Transactional
	@Override
	public JobsVO selectOne(JobsVO jobsVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if( request.getRemoteUser() != null ) {
			GetCountDTO dto = new GetCountDTO();
			dto.setId(request.getRemoteUser());
			dto.setBoard("jobs");
			dto.setToday(getFolder());
			dto.setSeq(jobsVO.getSeq());
			if (jobsMapper.getcount(dto) == 0 ) {
				jobsMapper.registercount(dto);
				jobsMapper.countUp(jobsVO.getSeq());
			}
			memberVO.setUserid(request.getRemoteUser());
			memberVO.setApoint(1);
			memberMapper.pointUp(memberVO);
		}
		

		return jobsMapper.selectOne(jobsVO);
	}
	@Override
	public int update(JobsVO jobsVO) {
		return jobsMapper.update(jobsVO);
	}
	@Override
	public int delete(JobsVO jobsVO) {
		return jobsMapper.delete(jobsVO);
	}
	@Override
	public int totalRowCount() {
		return jobsMapper.totalRowCount();
	}
	@Override
	public List<JobsVO> searchList(SearchCriteria searchCriteria){
		return jobsMapper.searchList(searchCriteria);
	}
	@Override
	public int searchRowCount(SearchCriteria searchCriteria) {
		return jobsMapper.searchRowCount(searchCriteria);
	}
   	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}

}