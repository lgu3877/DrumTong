package com.drumtong.business.dao;

import com.drumtong.business.vo.BPrivateDataVO;

public interface BPrivateDataDAO {
	

	// 사업자 회원가입 
	int insertSignUp(BPrivateDataVO vo);
	
	// 로그인 
	BPrivateDataVO selectLogin(String securePassword);

	String selectID(String BPersonID);
	
	
	// 아이디 찾기(이름/휴대폰)
	String idFindNamePhoneNum(BPrivateDataVO bprivatedatavo);

	// 아이디 찾기(이름/생년월일)
	String idFindNameBirth(BPrivateDataVO bprivatedatavo);

	// 아이디 찾기(이름/이메일)
	String idFindNameEmail(BPrivateDataVO bprivatedatavo);

	// 아이디 찾기(사업자등록번호/이메일)
	String idFindCRNEmail(BPrivateDataVO bprivatedatavo);

	// 아이디 찾기(사업자등록번호/휴대폰)
	String idFindCRNPhone(BPrivateDataVO bprivatedatavo);
	
	// 비밀번호 찾기(전화번호/이름/아이디)
	BPrivateDataVO pwFindPhoneNameID(BPrivateDataVO bprivatedatavo);

	// 비밀번호 찾기(이메일/아이디)
	BPrivateDataVO pwFindEmailID(BPrivateDataVO bprivatedatavo);
	
	// 개인정보 businessAccountInfo 데이터 페이지로 넘겨주기.
	BPrivateDataVO selectbPrivateData(String bpersonid);

	

//	===============================REST==============================================
	
	
	//	(REST) 아이디 중복 검사 
	int useridDupl(String id);
	
}
