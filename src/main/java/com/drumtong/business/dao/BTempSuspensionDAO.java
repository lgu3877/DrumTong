package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BTempSuspensionVO;

public interface BTempSuspensionDAO {

	
	// 영업 강제 중지의 데이터를 가져와줍니다.
	List<BTempSuspensionVO> selectBTempSuspension(String estid);
	
	
	//	영업임시중지관리 {임시중지 시작일, 임시중지 마지막일}을 업데이트 시켜준다.
	int insertConstract(BTempSuspensionVO bTempSuspensionVO);

	
	
//	===============================================REST===============================================
	
	// 매장 임시 중지을 수정해주는 메서드입니다.
	int updateBTempSuspension(BTempSuspensionVO bTempSuspensionVO);



	// 매장 임시 중지을 삭제해주는 메서드입니다.
	int deleteBTempSuspension(BTempSuspensionVO bTempSuspensionVO);



	// 매장 임시 중지에 새 데이터를 입력해주는 메서드입니다.
	int insertBTempSuspension(BTempSuspensionVO bTempSuspensionVO);


	
	
	
}
