package com.drumtong.business.dao;

import com.drumtong.business.vo.BScheduleDaysVO;

public interface BScheduleDaysDAO {

	// 신규 데이터 등록
	int insertSignUp(String ESTID);


	// 영업일정관리 {첫 번째 주, 두 번째 주, 세 번째 주, 네 번째 주, 다섯 번째 주, 여섯 번째 주, 공휴일 휴무 여부}를 업데이트 시켜준다.
	int updateConstract(BScheduleDaysVO bScheduleDaysVO);

}
