package com.ncs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.ColumnVO;
import com.ncs.vo.GetCountDTO;

@Repository
public interface ColumnMapper {
	
	List<ColumnVO> selectList();
	int insert(ColumnVO vo);
	ColumnVO selectOne(ColumnVO vo);
	int update(ColumnVO vo);
	int delete(ColumnVO vo);
	int totalRowCount();
	List<ColumnVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
	int countUp(int seq);
	int replycountUp(int seq);
	int getcount(GetCountDTO dto);
	int registercount(GetCountDTO dto);
}
