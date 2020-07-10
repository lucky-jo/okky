package com.ncs.service;

import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.MemberMapper;
import com.ncs.mapper.TechMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.TechVO;
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
public class TechServiceImpl implements TechService{

	@Autowired
	TechMapper techMapper;

	@Autowired
	LikeCountMapper likeCountMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MemberVO memberVO;
	
	@Override
	public List<TechVO> selectList(){
		return techMapper.selectList();
	}
	
	@Transactional
	@Override
	public int insert(TechVO techVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		memberVO.setUserid(request.getRemoteUser());
		memberVO.setApoint(30);
		memberMapper.pointUp(memberVO);
		return techMapper.insert(techVO);
	}

	@Transactional
	@Override
	public TechVO selectOne(TechVO techVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if( request.getRemoteUser() != null ) {
			GetCountDTO getCountDTO = new GetCountDTO();
			getCountDTO.setId(request.getRemoteUser());
			getCountDTO.setBoard("tech");
			getCountDTO.setToday(getFolder());
			getCountDTO.setSeq(techVO.getSeq());
			if (techMapper.getcount(getCountDTO) == 0 ) {
				techMapper.registercount(getCountDTO);
				techMapper.countUp(techVO.getSeq());
			}
			memberVO.setUserid(request.getRemoteUser());
			memberVO.setApoint(1);
			memberMapper.pointUp(memberVO);
		}
		

		return techMapper.selectOne(techVO);
	}
	@Override
	public int update(TechVO techVO) {
		return techMapper.update(techVO);
	}
	@Override
	public int delete(TechVO techVO) {
		return techMapper.delete(techVO);
	}
	@Override
	public int totalRowCount() {
		return techMapper.totalRowCount();
	}
	@Override
	public List<TechVO> searchList(SearchCriteria searchCriteria){
		return techMapper.searchList(searchCriteria);
	}
	@Override
	public int searchRowCount(SearchCriteria searchCriteria) {
		return techMapper.searchRowCount(searchCriteria);
	}
   	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}

}