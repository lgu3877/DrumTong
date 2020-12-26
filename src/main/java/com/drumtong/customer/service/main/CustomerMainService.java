package com.drumtong.customer.service.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.customer.vo.EstablishmentList;
import com.drumtong.system.dao.SCustomerBoard1DAO;
import com.drumtong.system.dao.SCustomerBoard2DAO;


@Service
public class CustomerMainService {

	@Autowired SCustomerBoard1DAO sCustomerBoard1DAO;
	@Autowired SCustomerBoard2DAO sCustomerBoard2DAO;
	@Autowired BInformationDAO bInformationDAO;
	
	
	public ModelAndView main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("customer/main/customerMain");
		// 관리자가 출력할 게시판 개수 - 1    ex) 5개를 출력할거면 4개를 입력
		int NumberOfData = 4;
		
		// 공지사항 리스트를 5개를 넣어줌.
		mav.addObject("boardRecentList", sCustomerBoard1DAO.selectRecentData1(NumberOfData));


		// 이벤트 게시판 리스트를 5개를 넣어줌.
		mav.addObject("eventRecentList", sCustomerBoard2DAO.selectRecentData2(NumberOfData));
		
		
		// 당일 날짜 구함.
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date date = new Date();
		String todayDate = format1.format(date);
		mav.addObject("todayDate", todayDate);
		
		// 랜덤으로 10개의 매장을 들고 옴[영경]
		List<EstablishmentList> RandomList = randomList(req);
		
		mav.addObject("RandomList", RandomList);
		
		return mav;
	}
	
	// 랜덤으로 10개 매장을 들고 오는 메서드[영경]
	private List<EstablishmentList> randomList(HttpServletRequest req){
		System.out.println("randomList 메서드 실행");
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		boolean isUser = Login != null;
		// 로그인 했을 땐 수령지 주소 기준(메인 주소만)으로 안했을 땐 기본 주소로
		String MainAddress = isUser ? Login.getMainreceiptaddress() : "서울특별시 마포구 상암동 월드컵로42길";
		
		List<EstablishmentList> establishmentList;
		
		establishmentList = perCalcReturnList(MainAddress, 10);
		
		Set<EstablishmentList> result = new HashSet<EstablishmentList>();
		
		result = randomSearch(establishmentList, result);
		
		if(result.size() != 10) {
			result = randomSearch(perCalcReturnList("All", 10 - result.size()), result);
		}
		
		
		
		return new ArrayList<>(result);
	}
	
	private List<EstablishmentList> perCalcReturnList(String MainAddress, int limitNum){
		List<EstablishmentList> tmp = new ArrayList<EstablishmentList>();
		HashMap<String, String> param = new HashMap<String, String>();
		param.put("MainAddress", MainAddress);
		tmp = bInformationDAO.selectEstablishmentList(param);
		
		if(tmp.size() <= 10) return tmp;
		
		double num = 0.1;
		do {
			int size = tmp.size();
			int result = (int)(size * num);
			System.out.println("num :" + num + ", size : " + size + ", result : " + result);
			if(result >= limitNum) {
				// 받아온 리스트 크기가 최소 10개 이상일 땐 break
				return tmp.subList(0, result);
			}
			num += 0.1;
		}while(num <= 1);
		
		return tmp;
	}
	
	// 검색할 리스트, 결과 리스트 [영경]
	private Set<EstablishmentList> randomSearch(List<EstablishmentList> list, Set<EstablishmentList> result){
		System.out.println("randomSearch 메서드 실행");
		Set<Integer> randomNums = new HashSet<Integer>();
		int maxNum = list.size();
		boolean checkList = true;
		
//		System.out.println("■■■ 리스트 테스트 ■■■");
//		for(EstablishmentList rlist : list) {
//			System.out.println(rlist.getEstid() + " : " + rlist.getBrandnaming() + ", " + rlist.getGpa());
//		}
//		System.out.println("■■■ size : " + result.size() + "개 ■■■");
		
		//1. 처음 리스트
		if(maxNum < 10) {
			if((result.size() + maxNum) <= 10) {
				// 두 리스트 합치기■■■■■■■■■■■■■■■■■■■■■■■
				
				// 중복된 값은 지우고(removeAll : 차집합)
				list.removeAll(result);
				
//				리스트 추가해주기(addAll : 합집합)
				result.addAll(list);
				
//				System.out.println("■■■ 랜덤 리스트 테스트 ■■■");
//				for(EstablishmentList rlist : result) {
//					System.out.println(rlist.getEstid() + " : " + rlist.getBrandnaming() + ", " + rlist.getGpa());
//				}
//				System.out.println("■■■ size : " + result.size() + "개 ■■■");
				
				return result;
			}
		} 
		
		
		while(checkList) {
			int random = (int)Math.random() * maxNum + 1;
			
			// 데이터 가져와서 result 에 추가하기(랜덤 숫자가 중복되거나 데이터가 중복되는 경우 입력되지 않도록 HashSet 이용)
			if(randomNums.add(random)) {
				if(result.add(list.get(random))) {
					checkList = result.size() < 10;
				}
			}
		}
		
//		System.out.println("■■■ 랜덤 리스트 테스트 ■■■");
//		for(EstablishmentList rlist : result) {
//			System.out.println(rlist.getEstid() + " : " + rlist.getBrandnaming() + ", " + rlist.getGpa());
//		}
//		System.out.println("■■■ size : " + result.size() + "개 ■■■");
		
		return result;
	}
	
	//@Transactional(timeout=5)
}
