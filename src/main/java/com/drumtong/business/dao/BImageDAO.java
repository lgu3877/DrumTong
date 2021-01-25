package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BPaymentVO;

public interface BImageDAO {
	// 해당 estid의 매장사진 리스트를 불러옵니다.
	List<BImageVO> selectImageList(String estid);

	// 매장사진 테이블에  {저장이미지}를 업데이트 시켜준다.
	int insertConstract(BImageVO bImageVO);
	
	// 매장사진테이블에서 {매장 대표 사진}을 업데이트 시켜줍니다.
	int insertDelegatePhoto(BImageVO bImageVO);
	
	//	UUID 중복검사 aws S3에 들어가는 이미지입니다 
	int confirm(String SerialUUID);

	// 매장 사진을 삭제 요청해줍니다.
	int deleteBImage(BImageVO vo);

}
