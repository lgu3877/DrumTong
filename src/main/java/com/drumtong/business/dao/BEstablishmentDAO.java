package com.drumtong.business.dao;

import com.drumtong.business.vo.BEstablishmentVO;

public interface BEstablishmentDAO {
	
	// ESTID 중복 검사
	int confirm(String ESTID);

	// 신규 데이터 생성
	int insertSignUp(BEstablishmentVO bEstablishmentVO);	
}
