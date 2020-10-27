package com.drumtong.business.dao;

import com.drumtong.business.vo.BScheduleTimeVO;

public interface BScheduleTimeDAO {

	
	// 신규 데이터 등록
	int insertSignUp(String ESTID);


	// 영업시간관리 {평일, 토요일, 일요일}시간을 업데이트 시켜준다. && REST시에도 사용이됩니다.
	int updateConstract(BScheduleTimeVO bScheduleTimeVO);



	// =======================================REST=========================================

	

}
