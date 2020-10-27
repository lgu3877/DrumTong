package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BMenuVO;

public interface BMenuDAO {

// 메뉴 번호순으로 반환
	List<BMenuVO> select(String estid);


//	// 메뉴 테이블에  {메뉴이름, 가격, 퀵가격, 예상소요시간}를 업데이트 시켜준다.
	int insertConstract(BMenuVO bMenuVO);


	
	
//======================================= REST ================================================
	
	//매장 메뉴를 비동기식으로 새 데이터를 입력해주는 메서드입니다.
	int insertBMenu(BMenuVO bMenuVO);
	
	// 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	int updateBMenu(BMenuVO bMenuVO);

	// 매장 메뉴를 비동기식으로 삭제해주는 메서드입니다.
	int deleteBMenu(BMenuVO bMenuVO);
}
