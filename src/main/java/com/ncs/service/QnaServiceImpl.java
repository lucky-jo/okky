package com.ncs.service;

import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.QnaMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.LikeDTO;
import com.ncs.vo.QnaVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaMapper mapper;

	@Autowired
	LikeCountMapper likeCountMapper;
	
	@Override
	public List<QnaVO> selectList(){
		return mapper.selectList();
	}
	@Override
	public int insert(QnaVO vo) {
		return mapper.insert(vo);
	}

	@Transactional
	@Override
	public QnaVO selectOne(QnaVO vo) {
		GetCountDTO dto = new GetCountDTO();
		dto.setId("jo");
		dto.setBoard(vo.getBoard());
		dto.setToday(getFolder());
		dto.setSeq(vo.getSeq());
		if (mapper.getcount(dto) == 0 ) {
			mapper.registercount(dto);
			mapper.countUp(vo.getSeq());
		}
		return mapper.selectOne(vo);
	}
	@Override
	public int update(QnaVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(QnaVO vo) {
		return mapper.delete(vo);
	}
	@Override
	public int totalRowCount() {
		return mapper.totalRowCount();
	}
	@Override
	public List<QnaVO> searchList(SearchCriteria cri){
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
