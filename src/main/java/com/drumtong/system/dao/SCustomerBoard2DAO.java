package com.drumtong.system.dao;

import java.util.List;

import com.drumtong.system.vo.SCustomerBoardVO;

public interface SCustomerBoard2DAO {

	//	최근 이벤트 게시판 데이터 5개를 Main으로 보내준다.
	List<SCustomerBoardVO> selectRecentData2(int NumberOfData);
}
