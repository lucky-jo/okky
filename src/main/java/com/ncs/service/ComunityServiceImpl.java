package com.ncs.service;

import com.ncs.mapper.ComunityMapper;
import com.ncs.mapper.LikeCountMapper;
import com.ncs.mapper.MemberMapper;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;
import com.ncs.vo.GetCountDTO;
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
public class ComunityServiceImpl implements ComunityService{
	
	@Autowired
	ComunityMapper comunityMapper;
	
	@Autowired
	LikeCountMapper likeCountMapper;
	
	@Autowired
	MemberVO memberVO;
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public List<ComunityVO> selectList(){
		return comunityMapper.selectList();
	}
	@Transactional
	@Override
	public int insert(ComunityVO comunityVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		// => 컨트롤러가 아닌 서비스에서 request 객체를 받기 위해
		memberVO.setUserid(request.getRemoteUser());
		// => 현재 로그인 되어 있는 id를 확인하고 request 객체를 받아서 vo에 전달
		memberVO.setApoint(30);
		// => 글 등록시 활동점수에 30점 set
		memberMapper.pointUp(memberVO);// 포인트업 안에 Apoint,Userid가 들어있음 , 따로 vo X
		// => pointUp에서 위에 담은 Apoint(30) 을 가져와서 점수를 올려줌
		return comunityMapper.insert(comunityVO);
	}
	//@Transactional (두 가지 기능중 하나라도 fail시 작동X)
	@Transactional
	@Override
	public ComunityVO selectOne(ComunityVO comunityVO) {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		// => request 객체 정의
		if(request.getRemoteUser() != null) { 
		GetCountDTO dto = new GetCountDTO(); // GetCountDTO 정의
		dto.setId(request.getRemoteUser()); // 로그인 된 id 확인 후 dto에 전달
		dto.setBoard(comunityVO.getBoard()); // vo에 board 값을 dto에  set
		dto.setToday(getFolder()); // Folder(현재날자) 값을 dto에 set
		dto.setSeq(comunityVO.getSeq()); // vo에 seq 값을 dto에 set
		if( comunityMapper.getcount(dto) == 0) { // ComunityMapper에 getcount에 dto를 담아 쿼리문에 전달하고 0일때
			comunityMapper.registercount(dto);  // count값 받아서 register 쿼리문에 날려서 insert
			comunityMapper.countUp(comunityVO.getSeq()); // 글 번호 해당 게시물 조회수 증가 mapper로 날림
		}
			memberVO.setUserid(request.getRemoteUser()); // 로그인 된 id 값 확인 해서 memberVO에 set
			memberVO.setApoint(1); // vo에 활동점수 1점 set
			memberMapper.pointUp(memberVO); // 활동점수 담아서 pointUp mapper로 날림
		}
		return comunityMapper.selectOne(comunityVO);
	}
//	@Override
//	public int countUp(ComunityVO vo) {
//		return mapper.countUp(vo);
//	}
	@Override
	public int update(ComunityVO comunityVO) {
		return comunityMapper.update(comunityVO);
	}
	@Override
	public int delete(ComunityVO comunityVO) {
		return comunityMapper.delete(comunityVO);
	}
	@Override
	public int totalRowCount() {
		return comunityMapper.totalRowCount();
	}

	@Override
	public List<ComunityVO> searchList(SearchCriteria searchCriteria){
		return comunityMapper.searchList(searchCriteria);
	}
	@Override
	public int searchRowCount(SearchCriteria searchCriteria) {
		return comunityMapper.searchRowCount(searchCriteria);
	}
	private String getFolder() { // ? 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		return sdf.format(date);
	}
}
