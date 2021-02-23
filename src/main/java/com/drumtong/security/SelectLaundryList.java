package com.drumtong.security;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.customer.vo.EstablishmentList;

// 세탁소 리스트 가져오는 메서드(public 함수는 getRandomList, getMapList 2개 총 세가지로만 사용!)
@Component
public class SelectLaundryList {
	private static HashMap<String, String> param;
	private static final String INITEMDCODE = "26350105";	// 랜덤 리스트를 가져올 때 로그인을 하지 않았다면 이 emd 코드를 참조해 세탁소 리스트를 가지고 온다!
	
	@Autowired BInformationDAO beanBInformationDAO;
	private static BInformationDAO bInformationDAO;
	
	@PostConstruct
	public void init() {
		bInformationDAO = beanBInformationDAO;
	}
	
	
	// 고객 메인 페이지에 랜덤으로 세탁소 리스트를 가져와주는 메서드(emd 코드를 이용할 때)
	public static List<EstablishmentList> getRandomList(HttpServletRequest req){
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
		return RandomList;
	}
	
	// 고객 세탁소 검색 페이지에서 필터, 페이지, 지도 상태에 따라 세탁소 리스트를 가져와주는 메서드(남서쪽, 북동쪽 좌표를 이용할 때)
	public static List<Object> getMapList(String left, String right, String top, String bottom, String filter1, String filter2, String filter3, String filter4, String filter5, String page){
		param = paramSet(filter1, filter2, filter3, filter4, filter5, page);
		param.put("left", left);
		param.put("right", right);
		param.put("top", top);
		param.put("bottom", bottom);
		return SeparateAccordingToPremium(param);
	}
	
	// 고객 세탁소 검색 페이지에서 필터, 페이지, 지도 상태에 따라 세탁소 리스트를 가져와주는 메서드(emdcode를 이용할 때)
	public static List<Object> getMapList(String emdcode, String filter1, String filter2, String filter3, String filter4, String filter5, String page){
		param = paramSet(filter1, filter2, filter3, filter4, filter5, page);
		param.put("emdcode", emdcode);
		return SeparateAccordingToPremium(param);
	}
	
	private static List<Object> SeparateAccordingToPremium(HashMap<String, String> param) {
		List<Object> list = new ArrayList<Object>();
		param.put("premium", "Y");
		list.add(getLaundryList());
		
		param.put("premium", "N");
		list.add(getLaundryList());
		return list;
	}
	// 세탁소 리스트를 sql문 통해 적절히 가져와주는 내부 메서드
	private static List<EstablishmentList> getLaundryList() {
		System.out.println("param : " + param.toString());
		return bInformationDAO.selectEstablishmentList(param);
	}
	
	// 매개변수들을 모아 hash map에 풋 해주는 함수
	private static HashMap<String, String> paramSet(String filter1, String filter2, String filter3, String filter4, String filter5, String page){
		HashMap<String, String> tmp = new HashMap<String, String>();


		tmp.put("filter1", filter1);
		tmp.put("filter2", filter2Setting(filter2));
		tmp.put("filter3", filter3);
		tmp.put("filter4", filter4);
		tmp.put("filter5", filter5);
		tmp.put("page", page);
		return tmp;
	}
	
	// 요일관련된 필터
	private static String filter2Setting(String filter2) {
		if(filter2.equals("today")) {
			int todayNum = Calendar.getInstance().get(Calendar.DAY_OF_WEEK);
			switch (todayNum) {
			case 1:// 일요일
				filter2 = "SUNDAY";
				break;
			case 7:// 토요일
				filter2 = "SATURDAY";
				break;
			default: // 2~6// 평일
				filter2 = "WEEKDAY";
				break;
			}
		}
		return filter2;
	}
	
	// == 아래 메서드는 모두 랜덤으로 세탁소를 가져오기 위한 내부 함수들
	
	// 랜덤으로 10개 매장을 들고 오는 메서드[영경]
	private static List<EstablishmentList> randomList(HttpServletRequest req){
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		boolean isUser = Login != null;
		// 로그인 했을 땐 수령지 주소 기준(메인 주소만)으로 안했을 땐 기본 주소로
		String EMDCODE = isUser ? Login.getEmdcode() : INITEMDCODE;
		
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
	private static List<EstablishmentList> perCalcReturnList(String EMDCODE, int limitNum){
		List<EstablishmentList> tmp = new ArrayList<EstablishmentList>();
		param = paramSet("none", "today", "none", "none", "none", "0");
		
		// 파라미터 값을 넣는다.
		param.put("emdcode", EMDCODE);
		// 오늘 요일을 넣는다.
		
		// 파라미터 값으로 list를 가져온다.
		tmp = getLaundryList();
		
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
	private static Set<EstablishmentList> randomSearch(List<EstablishmentList> list, Set<EstablishmentList> result){
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
	private static Set<EstablishmentList> notDupl(EstablishmentList li, Set<EstablishmentList> result) {
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
}
