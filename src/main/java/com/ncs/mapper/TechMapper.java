package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.TechVO;

@Repository
public interface TechMapper {
	
	List<TechVO> selectList();
	int insert(TechVO vo);
	TechVO selectOne(TechVO techVO);
	int update(TechVO vo);
	int delete(TechVO vo);
	int totalRowCount();
	List<TechVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
	int countUp(int seq);
	int replycountUp(int seq);
	int getcount(GetCountDTO dto);
	int registercount(GetCountDTO dto);
}
