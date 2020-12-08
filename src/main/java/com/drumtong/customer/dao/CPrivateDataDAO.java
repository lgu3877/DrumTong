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


	
}
