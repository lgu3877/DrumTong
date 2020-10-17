package com.drumtong.business.dao;

import com.drumtong.business.vo.BTempSuspensionVO;

public interface BTempSuspensionDAO {

	//	영업임시중지관리 {임시중지 시작일, 임시중지 마지막일}을 업데이트 시켜준다.
	int insertConstract(BTempSuspensionVO bTempSuspensionVO);

}
