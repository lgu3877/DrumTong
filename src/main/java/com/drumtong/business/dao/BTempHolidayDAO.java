package com.drumtong.business.dao;

import com.drumtong.business.vo.BTempHolidayVO;

public interface BTempHolidayDAO {
	
	// 영업임시휴일관리 {임시휴일 시작일, 임시휴일 마지막일}을 업데이트 시켜준다.
	int insertConstract(BTempHolidayVO bTempHolidayVO);


	
	
//	=====================================REST=====================================
	
	
	// 1. 매장 임시 휴무일을 수정해주는 메서드입니다. 
	int updateBTempHoliday(BTempHolidayVO bTempHolidayVO);


	// 2. 매장 임시 휴무일을 삭제해주는 메서드입니다.
	int deleteBTempHoliday(BTempHolidayVO bTempHolidayVO);

	// 3. 매장 임시 휴무일에 새 데이터를 입력해주는 메서드입니다.
	int insertBTempHoliday(BTempHolidayVO bTempHolidayVO);

	// 4. 매장 임시휴무일 새 데이터를 입력해주는 메서드입니다ㅏ.
	BTempHolidayVO selectBTempHoliday(BTempHolidayVO bTempHolidayVO);

}
