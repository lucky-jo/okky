package com.ncs.mapper;

import com.ncs.util.SearchCriteria;
import com.ncs.vo.GetCountDTO;
import com.ncs.vo.LikeDTO;
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
	int countUp(int seq);
	int replycountUp(int seq);
	int getcount(GetCountDTO dto);
	int registercount(GetCountDTO dto);
	int like(LikeDTO dto);
}
