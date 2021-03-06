package com.drumtong.customer.dao;

import java.util.HashMap;

import com.drumtong.customer.vo.CPrivateDataVO;

public interface CPrivateDataDAO {

	// 고객 회원가입
	int insertSignUp(CPrivateDataVO vo);
	
	// 로그인, 비밀번호와 일치하는 계정 가지고 옴
	CPrivateDataVO selectLogin(String securePassword);

	String selectID(String memberID);
	
//	(REST) 아이디 중복 검사 
	int useridDupl(String id);
	
//	(REST) 비밀번호 수정
	int updateChange(HashMap<String, String> value);

//	(REST) 이메일 중복 검사
	int userEmailDupl(String email);

	String selectEmail(HashMap<String, String> param);

	// 고객 프로필 사진 UUID 검사
	int confirm(String serialUUID);

	// 고객 이미지 주소 업데이트
	int updateImg(CPrivateDataVO cPrivateDataVO);


	
}
