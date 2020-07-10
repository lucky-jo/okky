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

import com.ncs.mapper.ColumnMapper;
import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.MemberMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.MemberVO;

@Service
public class ColumnServiceImpl implements ColumnService{

	@Autowired
	ColumnMapper columnMapper;

	@Autowired
	LikeCountMapper likeCountMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MemberVO memberVO;
	
	@Override
	public List<ColumnVO> selectList(){
		return columnMapper.selectList();
	}
	
	@Transactional
	@Override
	public int insert(ColumnVO columnVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		memberVO.setUserid(request.getRemoteUser());
		memberVO.setApoint(30);
		memberMapper.pointUp(memberVO);
		return columnMapper.insert(columnVO);
	}

	@Transactional
	@Override
	public ColumnVO selectOne(ColumnVO columnVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if( request.getRemoteUser() != null ) {
			GetCountDTO dto = new GetCountDTO();
			dto.setId(request.getRemoteUser());
			dto.setBoard("column");
			dto.setToday(getFolder());
			dto.setSeq(columnVO.getSeq());
			if (columnMapper.getcount(dto) == 0 ) {
				columnMapper.registercount(dto);
				columnMapper.countUp(columnVO.getSeq());
			}
			memberVO.setUserid(request.getRemoteUser());
			memberVO.setApoint(1);
			memberMapper.pointUp(memberVO);
		}
		

		return columnMapper.selectOne(columnVO);
	}
	@Override
	public int update(ColumnVO columnVO) {
		return columnMapper.update(columnVO);
	}
	@Override
	public int delete(ColumnVO columnVO) {
		return columnMapper.delete(columnVO);
	}
	@Override
	public int totalRowCount() {
		return columnMapper.totalRowCount();
	}
	@Override
	public List<ColumnVO> searchList(SearchCriteria searchCriteria){
		return columnMapper.searchList(searchCriteria);
	}
	@Override
	public int searchRowCount(SearchCriteria searchCriteria) {
		return columnMapper.searchRowCount(searchCriteria);
	}
   	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}

}