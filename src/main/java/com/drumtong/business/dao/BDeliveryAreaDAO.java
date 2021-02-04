package com.drumtong.business.dao;

import java.util.ArrayList;

import com.drumtong.business.vo.BDeliveryAreaVO;

public interface BDeliveryAreaDAO {

	// 배달지역 테이블에  {시도,시군구,시구,읍면동,통리,반}를 업데이트 시켜준다. 이 메서드는 추후에 데이터 타입을 보고 작업할 수 있도록 한다.
	int insertConstract(BDeliveryAreaVO bDeliveryAreaVO);
	
	
	//	배달 지역을 비동기식으로 수정해주는 메서드입니다.
	int updateBDeliveryArea(BDeliveryAreaVO bDeliveryAreaVO);

	
	// 시도데이터를 가져와주는 함수이다.
	ArrayList<String> selectAddressA(String estid);


	// 시군구 데이터를 가져와주는 함수이다.
	ArrayList<String> selectAddressB(BDeliveryAreaVO vo);

	// 읍면동 데이터를 가져와주는 함수입니다.
	ArrayList<String> selectAddressC(BDeliveryAreaVO vo);

}
