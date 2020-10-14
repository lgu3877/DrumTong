package com.drumtong.business.dao;

import com.drumtong.business.vo.BTempHolidayVO;

public interface BTempHolidayDAO {
	
	// 영업임시휴일관리 {임시휴일 시작일, 임시휴일 마지막일}을 업데이트 시켜준다.
	int insertConstract(BTempHolidayVO bTempHolidayVO);

}
