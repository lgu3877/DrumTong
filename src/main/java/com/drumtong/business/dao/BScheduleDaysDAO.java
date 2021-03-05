package com.drumtong.business.dao;

import java.util.HashMap;

import com.drumtong.business.vo.BScheduleDaysVO;

public interface BScheduleDaysDAO {

	// 신규 데이터 등록
	int insertSignUp(String ESTID);


	// 영업일정관리 {첫 번째 주, 두 번째 주, 세 번째 주, 네 번째 주, 다섯 번째 주, 여섯 번째 주, 공휴일 휴무 여부}를 업데이트 시켜준다.
	int updateConstract(BScheduleDaysVO bScheduleDaysVO);

	
	
	
	// =======================================REST=========================================

	// 매장 일정관리를 비동기식으로 삭제해주는 메서드입니다.
	int deleteBScheduleDays(HashMap<String,String> obj);

	// 매장 일정관리를 비동기식으로 추가 입력해주는 메서드입니다.
	int insertBScheduleDays(HashMap<String, String> obj);

	// 매장 일정관리에 공휴일 휴일 여부를 수정해주는 메서드입니다. 필드  { 휴일 유무  }
	int updateHoliday(BScheduleDaysVO bScheduleDaysVO);

	// select 매장 정기휴무  일정
	BScheduleDaysVO selectBScheduleDays(String estid);

	// 영업중인지 체크하기(정기 휴무)
	int isOpen(HashMap<String, String> param);

	


}
