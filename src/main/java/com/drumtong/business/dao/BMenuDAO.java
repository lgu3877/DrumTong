package com.drumtong.business.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.BMenuVO;

public interface BMenuDAO {

// 메뉴 번호순으로 반환
	List<BMenuVO> select(String estid);


//	// 메뉴 테이블에  {메뉴이름, 가격, 퀵가격, 예상소요시간}를 업데이트 시켜준다.
	int insertConstract(BMenuVO bMenuVO);

	//	메인 카테고리와 중분류 카테고리를 메인관리 (매장관리)에 Get방식으로 접근했을 때 데이터를 뿌려주는 용도로 사용되는 SQL문입니다
	//  메뉴 카테고리의 자료형 HashMap<String, ArrayList<String>> menuCategories
	//  HashMap String을 가져온다. 하지만 가져올 떄는 일단 ArrayList로 가져온다 foreach로 풀 예정
	ArrayList<String> selectMaincategories(String estid);
	
	//	메인 카테고리와 중분류 카테고리를 메인관리 (매장관리)에 Get방식으로 접근했을 때 데이터를 뿌려주는 용도로 사용되는 SQL문입니다
	//  메뉴 카테고리의 자료형 HashMap<String, ArrayList<String>> menuCategories
	//  ArrayList<String> 을 가져온다.
	ArrayList<String> selectSubcategories(BMenuVO bMenuVO);
	
//======================================= REST ================================================
	
	//매장 메뉴를 비동기식으로 새 데이터를 입력해주는 메서드입니다.
	int insertBMenu(BMenuVO bMenuVO);
	
	// 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	int updateBMenu(BMenuVO bMenuVO);

	// 매장 메뉴를 비동기식으로 삭제해주는 메서드입니다.
	int deleteBMenu(BMenuVO bMenuVO);

	// 메인, 서브 카테고리에 해당하는 메뉴 리스트를 반환하는 메서드
	List<BMenuVO> selectMenu(BMenuVO param);


	


	


}
