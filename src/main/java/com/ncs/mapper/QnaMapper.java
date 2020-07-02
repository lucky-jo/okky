package com.ncs.mapper;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.QnaVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QnaMapper {
	
	List<QnaVO> selectList();
	int insert(QnaVO vo);
	QnaVO selectOne(QnaVO vo);
	int update(QnaVO vo);
	int delete(QnaVO vo);
	int totalRowCount();
	List<QnaVO> searchList(SearchCriteria cri);
	int searchRowCount(SearchCriteria cri);
}
