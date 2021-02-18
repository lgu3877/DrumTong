package com.drumtong.customer.service.laundry;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.dao.CBookmarkDAO;
import com.drumtong.customer.dao.CCouponDAO;
import com.drumtong.customer.vo.CBookmarkVO;
import com.drumtong.customer.vo.CCouponVO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.map.dao.MEmdDAO;
import com.drumtong.map.dao.MSidoDAO;
import com.drumtong.map.dao.MSigunguDAO;
import com.drumtong.map.vo.MEmdVO;
import com.drumtong.map.vo.MSidoVO;
import com.drumtong.map.vo.MSigunguVO;
import com.google.gson.Gson;

@Service
public class RestCustomerLaundryService {
	
	@Autowired CBookmarkDAO cBookmarkDAO;
	@Autowired CCouponDAO cCouponDAO;
	@Autowired BCouponDAO bCouponDAO;
	@Autowired BInformationDAO bInformationDAO;
	
	
	// 지도 DAO
	@Autowired MEmdDAO mEmdDAO;
	@Autowired MSidoDAO mSidoDAO;
	@Autowired MSigunguDAO mSigunguDAO;
	
	public String setBookmark(HttpServletRequest req, HashMap<String, String> param) {
		CPrivateDataVO User = (CPrivateDataVO) req.getSession().getAttribute("cLogin");
		param.put("memberid", User.getMemberid());
		
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


	public String setCoupon(HttpServletRequest req, HashMap<String, String> param) {
		CPrivateDataVO User = (CPrivateDataVO) req.getSession().getAttribute("cLogin");
		param.put("memberid", User.getMemberid());
		
		// 쿠폰아이디와 멤버아이디로 중복확인
		CCouponVO hasCoupon = cCouponDAO.selectCheck(param);
		
		// 없다면 추가
		int insertResult = 0;
		if(hasCoupon == null) {
			insertResult = bCouponDAO.updateDownload(param.get("couponid"));
			if(insertResult == 1)	
				insertResult = cCouponDAO.insertCoupon(param);
		}
		
		return insertResult == 1 ? "true" : "false";
	}

	// 승원씨가 작업한 sido를 가져오는 REST함수입니다
	public String getsido() {
		List<MSidoVO> sido = mSidoDAO.selectMSido();
		return new Gson().toJson(sido);
	}

	// 승원씨가 작업한 sido를 가져오는 REST함수입니다
	public String getsigungu(String sidoname) {
		List<MSigunguVO> sigungu = mSigunguDAO.selectMSigungu(sidoname);
		return new Gson().toJson(sigungu);
	}

	// 읍면동 Select REST [건욱]
	public String getEmd() {
		List<MEmdVO> emd = mEmdDAO.selectEmd();
		return new Gson().toJson(emd);
	}

	// 매장 좌표 Select REST [건욱]
	public String selectBInformationCoord() {
 	    
		List<BInformationVO> bInformationCoordList = bInformationDAO.selectBInformationCoord();
		return new Gson().toJson(bInformationCoordList);
	}


//	public String clusterer(String address, int level, String type) {
//		// address에 따라 관련 세탁소 가지고 오도록!
//		// level에 따라 주소를 비교하기
//		// type에 따라 개수를 가지고올지, 리스트를 통째로 가지고 올지 정하기a
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
