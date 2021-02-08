package com.drumtong.customer.service.laundry;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.dao.CBookmarkDAO;
import com.drumtong.customer.dao.CCouponDAO;
import com.drumtong.customer.vo.CBookmarkVO;
import com.drumtong.customer.vo.CCouponVO;
import com.drumtong.map.dao.MEmdDAO;
import com.drumtong.map.dao.MSidoDAO;
import com.drumtong.map.dao.MSigunguDAO;
import com.drumtong.map.vo.MSidoVO;
import com.drumtong.map.vo.MSigunguVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Service
public class RestCustomerLaundryService {
	
	@Autowired CBookmarkDAO cBookmarkDAO;
	@Autowired CCouponDAO cCouponDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired MEmdDAO mEmdDAO;
	@Autowired MSidoDAO mSidoDAO;
	@Autowired MSigunguDAO mSigunguDAO;
	
	public String setBookmark(HashMap<String, String> param) {
		String result = param.get("result");
		
		// 북마크 이미 추가되있는지 검사하기
		CBookmarkVO check = cBookmarkDAO.isCheck(param);
		
		// result가 yellow면 추가, white면 삭제
		boolean checkResult = check != null;	// 현재 북마크에 추가되어있을 때 true
		boolean AddOrRemove = "yellow".equals(result);
		int daoResult;
		if(!checkResult && AddOrRemove) {	// 북마크 추가
			// 북마크 추가 안되어있고 yellow로 바꿨다면
			daoResult = cBookmarkDAO.insert(param);
		} else if (checkResult && !AddOrRemove) {	// 북마크 해제
			// 북마크 추가 되어있고, white로 바꿨다면
			daoResult = cBookmarkDAO.delete(param);
		} else {
			// 에러(DB와 bookmark의 일관성이 없는 경우)
			// db에 없는데 white를 눌렀을 경우
			// db에 이미 있는데 yellow를 눌렀을 경우
			System.out.println("db에 " + (checkResult ? "있" : "없") + "는데 " + result + "를 눌렀습니다.");
		}
		
		return AddOrRemove ? "true" : "false";
	}


	public String setCoupon(HashMap<String, String> param) {
		System.out.println("memberid : " + param.get("memberid"));
		System.out.println("couponid : " + param.get("couponid"));
		
		// 쿠폰아이디와 멤버아이디로 중복확인
		CCouponVO hasCoupon = cCouponDAO.selectCheck(param);
		
		// 없다면 추가
		int insertResult = 0;
		if(hasCoupon == null) {
			insertResult = cCouponDAO.insertCoupon(param);
		} else {
			System.out.println("널아니");
		}
		
		return insertResult == 1 ? "true" : "false";
	}


	public String getsido() {
		List<MSidoVO> sido = mSidoDAO.getsidoxy();
		return new Gson().toJson(sido);
	}


	public String getsigungu() {
		List<MSigunguVO> sigungu = mSigunguDAO.getsigunguxy();
		return new Gson().toJson(sigungu);
	}


//	public String clusterer(String address, int level, String type) {
//		// address에 따라 관련 세탁소 가지고 오도록!
//		// level에 따라 주소를 비교하기
//		// type에 따라 개수를 가지고올지, 리스트를 통째로 가지고 올지 정하기
//		List<BInformationVO> list = bInformationDAO.selectBusinessMapInfo();
//		try {
//			return list != null
//					? new ObjectMapper().writeValueAsString(list):null;
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
}
