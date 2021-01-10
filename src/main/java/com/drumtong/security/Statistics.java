package com.drumtong.security;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BDetailSalesDAO;
import com.drumtong.business.dao.BHitsDAO;
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.StatisticsData;
import com.google.gson.Gson;

@Component
public class Statistics {
	static BHitsDAO bHitsDAO;
	static BSalesDAO bSalesDAO;
	static BDetailSalesDAO bDetailSalesDAO;
	
	@Autowired BHitsDAO beanbHitsDAO;
	@Autowired BSalesDAO beanbSalesDAO;
	@Autowired BDetailSalesDAO beanbDetailSalesDAO;
	
	@PostConstruct
	public void init() {
		bHitsDAO = beanbHitsDAO;
		bSalesDAO = beanbSalesDAO;
		bDetailSalesDAO = beanbDetailSalesDAO;
	}
	
	// 날짜 매개변수가 없는 경우, 기본은 일주일 간 day hits
	public static String statistics(String estid, String pageKind, String option) {
		String endDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		option = option == null ? "Day" : option;
		switch (option) {
		case "Week":
			calendar.add(Calendar.DAY_OF_MONTH, -27);
			break;
		case "Month":
			calendar.add(Calendar.DAY_OF_MONTH, -119);
			break;
		default:
			calendar.add(Calendar.DAY_OF_MONTH, -6);
			break;
		}
		String startDate = new SimpleDateFormat("yyyy-MM-dd").format(calendar.getTime());
		return statistics(estid, pageKind, option, startDate, endDate);
	}
	
	// pageKind : "Hits", "Orders", "Prices"
	// option : "Day",  "Week", "Month"
	public static String statistics(String estid, String pageKind, String option, String startDate, String endDate) {
		List<StatisticsData> result = new ArrayList<StatisticsData>();
		pageKind = (pageKind == null || "n".equals(pageKind))? "Hits" : pageKind;
		option = (option == null || "n".equals(option))? "Day" : option;
		result = selectList(estid, result, pageKind, option, simpleformat(startDate), simpleformat(endDate));
		
		Gson gson = new Gson();
		return gson.toJson(result);
	}

	
	// yyyy-MM-dd 형태의 글자 데이터를 날짜로 바꾸어준다.
	private static Date simpleformat(String date) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date result = null;
		try {
			result = simpleDateFormat.parse(date);
		} catch (ParseException e) {
			System.out.println("Statistics의 simpleformat 메서드에서 String 형태의 날짜를 Date 형식으로 변환 중 오류 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	// 원하는 날 이후 날짜를 출력
	private static Date calcDay(Date today, int num) {
		Calendar tmp = Calendar.getInstance();
		tmp.setTime(today);
		tmp.add(Calendar.DAY_OF_MONTH, num);
		return tmp.getTime();
	}
	
	// 해당 날짜의 마지막 날 반환하기
	private static Date calcMonth(Date today, int num) {
		Calendar tmp = Calendar.getInstance();
		tmp.setTime(today);
		System.out.println(today);
		System.out.println("마지막 날 : " + tmp.getActualMaximum(tmp.DAY_OF_MONTH));
		tmp.set(tmp.get(Calendar.YEAR), tmp.get(Calendar.MONTH), tmp.getActualMaximum(tmp.DAY_OF_MONTH));
//		tmp.add(Calendar.MONTH, num);
//		tmp.add(Calendar.DAY_OF_WEEK, -1);
		return tmp.getTime();
	}
	
	
	// pageKind : "Hits", "Orders", "Prices"
	private static int getValue(String pageKind, StatisticsData statisticsData) {
		switch(pageKind) {
		case "Hits":
			return bHitsDAO.CountHit(statisticsData);
		case "Orders":
			return bSalesDAO.CountOrder(statisticsData);
		case "Prices":
			return bSalesDAO.CountPrice(statisticsData);
		}
		return 0;
	}

	// 날짜를 계산함
	// dayArr[3] {현재 계산할 시작 날, 끝 날, 남은 날짜(startDate를 갱신해야 함)}
	// option : "Day",  "Week", "Month"
	private static Date[] separateDate(String option, Date startDate, Date endDate) {
		Date[] dayArr = new Date[3];
		switch(option) {
		case "Day":
			dayArr[0] = dayArr[1] = startDate;
			dayArr[2] = calcDay(startDate, 1);
			return dayArr;
		case "Week":	// 일요일~토요일
			Calendar ToGetADay = Calendar.getInstance();
			ToGetADay.setTime(startDate);	// 시작 날
			int day = ToGetADay.get(Calendar.DAY_OF_WEEK);	// 일 : 1 ~ 토 : 7
			return calcPeriod(dayArr, startDate, calcDay(startDate, 7-day), endDate);
		case "Month":	// 달 단위로(11월,10월)
			return calcPeriod(dayArr, startDate, calcMonth(startDate, 1), endDate);
		}
		return dayArr;
	}
	
	public static Date[] calcPeriod(Date[] dayArr, Date startDate, Date nextDate, Date endDate) {
		dayArr[0] = startDate;	// 현재 주
		dayArr[1] = nextDate.compareTo(endDate) > 0 ? endDate : nextDate;
		dayArr[2] = calcDay(dayArr[1], 1);
		return dayArr;
	}
	
	private static List<StatisticsData> selectList(String estid, List<StatisticsData> result, String pageKind, String option, Date startDate, Date endDate) {
		int i = 0;
		Date dayArr[] = null;
		do {
			// 1. 날짜를 옵션에 맞추어 먼저 분리한다.
			dayArr = separateDate(option, startDate, endDate);
			StatisticsData statisticsData = new StatisticsData(estid, dayArr[0], dayArr[1]);

			// 2. 날짜에 맞는 데이터 개수를 pageKind를 통해 구분하여 구한다.
			int value = getValue(pageKind, statisticsData);
			statisticsData.setValue(value);
			result.add(statisticsData);
			startDate = dayArr[2];
			if(i == 10) {
				System.out.println("시스템 오류로 10번째까지만 출력합니다.");
				break;
			}
		}while(startDate.compareTo(endDate) <= 0);
		return result;
	}
}
