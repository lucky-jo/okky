package com.ncs.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.MemberMapper;
import com.ncs.mapper.TechMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.TechVO;

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
	public int insert(TechVO vo) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		memberVO.setUserid(request.getRemoteUser());
		memberVO.setApoint(30);
		memberMapper.pointUp(memberVO);
		return techMapper.insert(vo);
	}

	@Transactional
	@Override
	public TechVO selectOne(TechVO vo) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if( request.getRemoteUser() != null ) {
			GetCountDTO dto = new GetCountDTO();
			dto.setId(request.getRemoteUser());
			dto.setBoard("tech");
			dto.setToday(getFolder());
			dto.setSeq(vo.getSeq());
			if (techMapper.getcount(dto) == 0 ) {
				techMapper.registercount(dto);
				techMapper.countUp(vo.getSeq());
			}
			memberVO.setUserid(request.getRemoteUser());
			memberVO.setApoint(1);
			memberMapper.pointUp(memberVO);
		}
		

		return techMapper.selectOne(vo);
	}
	@Override
	public int update(TechVO vo) {
		return techMapper.update(vo);
	}
	@Override
	public int delete(TechVO vo) {
		return techMapper.delete(vo);
	}
	@Override
	public int totalRowCount() {
		return techMapper.totalRowCount();
	}
	@Override
	public List<TechVO> searchList(SearchCriteria cri){
		return techMapper.searchList(cri);
	}
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return techMapper.searchRowCount(cri);
	}
   	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}

}