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
		
		// 만약 10개가 아니라면 갯수를 맞춰주기[영경]
		if(RandomList.size() != 10) {
			List<EstablishmentList> tmp = new ArrayList<EstablishmentList>();
			int i = 0;
			int lastNum = RandomList.size();
			while(tmp.size() != 10) {
				tmp.add(RandomList.get(i));
				if(++i == lastNum) i = 0;
			}
			RandomList = tmp;
		}
		
		
		mav.addObject("RandomList", RandomList);
		
		return mav;
	}
	
	// 랜덤으로 10개 매장을 들고 오는 메서드[영경]
	private List<EstablishmentList> randomList(HttpServletRequest req){
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		boolean isUser = Login != null;
		// 로그인 했을 땐 수령지 주소 기준(메인 주소만)으로 안했을 땐 기본 주소로
		String EMDCODE = isUser ? Login.getEmdcode() : "26350105";
		
		// EMDCODE와 배송가능 주소가 일치하는 매장 리스트를 10개 이상 가지고온다.
		List<EstablishmentList> establishmentList = perCalcReturnList(EMDCODE, 10);
		
		Set<EstablishmentList> result = new HashSet<EstablishmentList>();
		
		// 가지고 온 리스트를 랜덤으로 10개 가지고 온다.
		result = randomSearch(establishmentList, result);
		
		// 만약 주소에 해당하는 매장 리스트가 10개 미만이라면 부족한 개수만큼 추가적으로 리스트를 가져와 랜덤으로 뽑아준다..
		if(result.size() != 10) {
			result = randomSearch(perCalcReturnList("All", 10 - result.size()), result);
		}
		
		
		
		return new ArrayList<>(result);
	}
	
	// 주소(EMDCODE)와 배송가능 주소가 일치하면서 상위 n% 안에 해당하는 매장 리스트를 n개(limitNum) 이상 구한다  [영경]
	private List<EstablishmentList> perCalcReturnList(String EMDCODE, int limitNum){
		List<EstablishmentList> tmp = new ArrayList<EstablishmentList>();
		HashMap<String, String> param = new HashMap<String, String>();
		
		// 파라미터 값을 넣는다.
		param.put("emdcode", EMDCODE);
		
		// 파라미터 값으로 list를 가져온다.
		tmp = bInformationDAO.selectEstablishmentList(param);
		
		// 가져온 리스트 사이즈가 10보다 작거나 같을 때!
		if(tmp.size() <= limitNum) return tmp;
		
		// 가져온 리스트의 N% 해당하는 리스트를 가져오고 그 개수가 limitNum보다 크거나 같아야 리턴한다.
		double num = 0.1;
		do {
			int size = tmp.size();
			int result = (int)(size * num);
			if(result >= limitNum) {
				// 받아온 리스트 크기가 최소 10개 이상일 땐 break
				return tmp.subList(0, result);
			}
			num += 0.1;
		}while(num <= 1);
		
		// 100% 정보를 다 가져와도 결국 limitNum을 못넘기면 그냥 리턴한다.
		return tmp;
	}
	
	// 새로 구해온 list를 랜덤으로 반환용 result에 합쳐 반환한다. [영경]
	private Set<EstablishmentList> randomSearch(List<EstablishmentList> list, Set<EstablishmentList> result){
		final int RESULT = 10;
		// 중복된 숫자를 피하기 위해 randomNums 리스트를 만든다.
		Set<Integer> randomNums = new HashSet<Integer>();
		int maxNum = list.size();
		boolean checkList = true;
		
		//만약 list와 result 개수를 더한 값이 10개 미만이라면
		if((result.size() + maxNum) <= RESULT) {
			for(EstablishmentList li : list) {
				// estid가 일치하는 매장은 중복해서 등록되지 않도록 한다.
				result = notDupl(li, result);
			}
			
			return result;
		}
		
		// 10개 이상일 경우 랜덤으로 리스트를 가져온다.
		while(checkList) {
			int random = (int)Math.random() * maxNum + 1;
			
			// 데이터 가져와서 result 에 추가하기(랜덤 숫자가 중복되거나 데이터가 중복되는 경우 입력되지 않도록 HashSet 이용)
			if(randomNums.add(random)) {
				// 중복되지 않게 추가시킨다.
				result = notDupl(list.get(random), result);
				checkList = result.size() < 10;
			}
		}
		return result;
	}

	// li를 result와 중복되는 estid가 아닌지 확인 후 추가하는 메서드
	private Set<EstablishmentList> notDupl(EstablishmentList li, Set<EstablishmentList> result) {
		boolean Exist = true;
		for(EstablishmentList re : result) {
			if(li.getEstid().equals(re.getEstid()) ) {
				Exist = !Exist;
				break;
			}
		}
		if(Exist) result.add(li);
		return result;
	}
	
	
	//@Transactional(timeout=5)
}
