package com.ncs.service;

import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.QnaMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.QnaVO;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Log4j
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
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		if( request.getRemoteUser() != null ) {
			GetCountDTO dto = new GetCountDTO();
			dto.setId(request.getRemoteUser());
			dto.setBoard("qna");
			dto.setToday(getFolder());
			dto.setSeq(vo.getSeq());
			if (mapper.getcount(dto) == 0 ) {
				log.info("조회한 적이 없네.");
				mapper.registercount(dto);
				mapper.countUp(vo.getSeq());
				log.info("그럼 조회수 증가");
			}
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
