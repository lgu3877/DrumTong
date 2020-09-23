package com.drumtong.system.dao;

import java.util.List;

import com.drumtong.system.vo.SBoardVO;

public interface SCustomerBoard1DAO {
	
	//	최근 공지사항 데이터 5개를 Main으로 보내준다.
	List<SBoardVO> selectRecentData1(int NumberOfData);

}
