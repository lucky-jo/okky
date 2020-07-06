package com.ncs.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ncs.mapper.ComunityMapper;
import com.ncs.mapper.LikeCountMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;
import com.ncs.vo.GetCountDTO;

@Service
public class ComunityServiceImpl implements ComunityService{
	
	@Autowired
	ComunityMapper mapper;
	
	@Autowired
	LikeCountMapper likeCountMapper;
	
	@Override
	public List<ComunityVO> selectList(){
		return mapper.selectList();
	}
	@Override
	public int insert(ComunityVO vo) {
		return mapper.insert(vo);
	}
	//@Transactional (두 가지 기능중 하나라도 fail시 작동X)
	@Transactional
	@Override
	public ComunityVO selectOne(ComunityVO vo) {
		GetCountDTO dto = new GetCountDTO();
		dto.setId("kim");
		dto.setBoard(vo.getBoard());
		dto.setToday(getFolder());
		dto.setSeq(vo.getSeq());
		if( mapper.getcount(dto) == 0) {
			mapper.registercount(dto);
			mapper.countUp(vo.getSeq());
		}
		return mapper.selectOne(vo);
	}
//	@Override
//	public int countUp(ComunityVO vo) {
//		return mapper.countUp(vo);
//	}
	@Override
	public int update(ComunityVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(ComunityVO vo) {
		return mapper.delete(vo);
	}
	@Override
	public int totalRowCount() {
		return mapper.totalRowCount();
	}

	@Override
	public List<ComunityVO> searchList(SearchCriteria cri){
		return mapper.searchList(cri);
	}
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return mapper.searchRowCount(cri);
	}
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}
}
