package com.drumtong.customer.dao;

import java.util.List;

import com.drumtong.customer.vo.CPointVO;

public interface CPointDAO {

	// 포인트 충전 내역을 들고오는 메서드
	List<CPointVO> selectAll(String memberid);

	// 포인트 충전하기
	int insertPoint(CPointVO cPointvo);
	
}
