package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.util.Criteria;
import com.ncs.util.SearchCriteria;
import com.ncs.vo.ComunityVO;
// Mapper.java와 Mapper.xml 경로와 명칭이 같아야 1:1로 작동하는 구조
@Repository
public interface ComunityMapper {
	
	public List<ComunityVO> selectList();
	public int insert(ComunityVO vo);
	public ComunityVO selectOne(ComunityVO vo);
	public int update(ComunityVO vo);
	public int delete(ComunityVO vo);
	public int totalRowCount();
	public List<ComunityVO> criList(Criteria cri);
	public List<ComunityVO> searchList(SearchCriteria cri);
	public int searchRowCount(SearchCriteria cri);
	public int countUp(ComunityVO vo);
	
}
