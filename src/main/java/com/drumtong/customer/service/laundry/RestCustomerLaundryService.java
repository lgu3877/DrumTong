package com.drumtong.customer.service.laundry;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.dao.CBookmarkDAO;
import com.drumtong.customer.vo.CBookmarkVO;

@Service
public class RestCustomerLaundryService {
	
	@Autowired CBookmarkDAO cBookmarkDAO;
	@Autowired BInformationDAO bInformationDAO;		
	
	
	public List<BInformationVO> BusinessMapInfo(){
		
		// 사업장의 위도와 경도를 받아온다.
		return bInformationDAO.selectBusinessMapInfo();
	}
	
	
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
}
