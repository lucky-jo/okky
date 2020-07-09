package com.ncs.service;

import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.MemberMapper;
import com.ncs.mapper.QnaMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.MemberVO;
import com.ncs.vo.QnaVO;
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
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaMapper qnaMapper;

	@Autowired
	LikeCountMapper likeCountMapper;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	MemberVO memberVO;
	
	@Override
	public List<QnaVO> selectList(){
		return qnaMapper.selectList();
	}
	
	@Transactional
	@Override
	public int insert(QnaVO vo) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		memberVO.setUserid(request.getRemoteUser());
		memberVO.setApoint(30);
		memberMapper.pointUp(memberVO);
		return qnaMapper.insert(vo);
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
			if (qnaMapper.getcount(dto) == 0 ) {
				qnaMapper.registercount(dto);
				qnaMapper.countUp(vo.getSeq());
			}
			memberVO.setUserid(request.getRemoteUser());
			memberVO.setApoint(1);
			memberMapper.pointUp(memberVO);
		}
		

		return qnaMapper.selectOne(vo);
	}
	@Override
	public int update(QnaVO vo) {
		return qnaMapper.update(vo);
	}
	@Override
	public int delete(QnaVO vo) {
		return qnaMapper.delete(vo);
	}
	@Override
	public int totalRowCount() {
		return qnaMapper.totalRowCount();
	}
	@Override
	public List<QnaVO> searchList(SearchCriteria cri){
		return qnaMapper.searchList(cri);
	}
	@Override
	public int searchRowCount(SearchCriteria cri) {
		return qnaMapper.searchRowCount(cri);
	}
   	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}

}