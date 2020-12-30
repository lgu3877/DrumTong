package com.drumtong.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BDetailSalesDAO;
import com.drumtong.business.vo.BDetailSalesVO;
import com.drumtong.business.vo.OrderList;

@Component	// [건욱]
public class OrderListSetting {
	
	static BDetailSalesDAO bDetailSalesDAO;
	
	@Autowired BDetailSalesDAO BeanbDetailSalesDAO;
	
	@PostConstruct
	private void init() {
		
		this.bDetailSalesDAO = BeanbDetailSalesDAO;
		
	}
	
	public static List<OrderList> setOrderList(List<OrderList> orderList){
				// OrderList에 Foreach문을 돌려준다
				/*
				 * List의 뭉치인 orderList를 forEach문으로 한 객체씩 분리시켜주어서
				 * orderList 내부에 메인 메뉴 -> 서브메뉴 -> 메뉴 들을 트리형식으로 넣어준다.
				 * 
				 */
				for (OrderList ol : orderList) {
					
					// orderList 객체에 Salecode를 추출한다.
					String saleCode = ol.getSalecode();
					
					
					HashMap<String, HashMap<String,List<BDetailSalesVO>>> maincategoriesMap = new HashMap<String, HashMap<String,List<BDetailSalesVO>>>();
					
					
					// HashMap을 선언해준다. 
					/* 
					 * 이 HashMap은 {BDetailSales.XML}파일에  (selectDistinctCategory) 메서드에 사용할 때 사용된다.
					 * 요구되는 값은 [category] [maincategory] [salecode] 총 3개의 값이 요구된다.
					 * 
					 * maincategory를 검색할 때는 [category] [salecode] 필드만 사용되고
					 * subcategory를 검색할 때는 [category] [maincategory] [salecode]가 다 사용된다.
					 * 
					 */
					HashMap<String, String> map = new HashMap<String,String>();
					
//					첫 번째는[ maincategory]로 sql을 검색할 거기 때문에 category값에 maincategory를 넣어준다.
					map.put("category", "maincategory");
//					두 번째는 [saleCode]를 넣어준다.
					map.put("salecode", saleCode);
//		 			xml에 오류가 날 수도 있어서 빈값을 넣어주겠다.
					map.put("maincategoryname", "");
					
					
					
					
					
					// [Maincategory]를 Oracle의 Distinct(중복제거)로 데이터를 가져와준다. (Order by로 가나다 순임)
					List<String> maincategoryList = bDetailSalesDAO.selectDistinctCategory(map);
					
					

//							  메인                                            서브                       VO
//					HashMap<String, List<HashMap<String,List<BDetailSalesVO>>>>
					
					// [Maincategory]의 길이만큼 반복문을 실행시켜준다.
					for ( int i = 0; i < maincategoryList.size(); i++ ) {
						// 메인 카테고리 배열 [Name] 추출
						String maincategoryName = maincategoryList.get(i);
						
						
						// HashMap을 선언해준다.				
						HashMap<String, String> hashmap = new HashMap<String,String>();
						
						
//						첫 번째는[maincategory]로 sql을 검색할 거기 때문에 [category]값에 maincategory를 넣어준다.
//						두 번째는 [maincategoryname]값에 메인카테고리 값을 넣어준다.
//						세 번째는 [saleCode]를 넣어준다.
						hashmap.put("category", "subcategory");
						hashmap.put("maincategoryname", maincategoryName);
						hashmap.put("salecode", saleCode);
						
						
						// 서브카테고리들의 List
						List<HashMap<String,List<BDetailSalesVO>>> subcategoriesList = new ArrayList<HashMap<String,List<BDetailSalesVO>>>();
						
						// 서브카테고리와 vo
						HashMap<String,List<BDetailSalesVO>> subcategoryANDvo = new HashMap<String,List<BDetailSalesVO>>();

						
						// Subcategory HashMap
						/*
						 * bDetailSales.xml에서 [selectDistinctCategory]메서드를 사용해서 
						 * 위의 hashmap에서 선언해준 3개의 값을 메서드에 전달시켜준다.
						 * 
						 * 제대로 전달이 된다면 
						 * 기존의 sql문에서 where 조건문이 [maincategory]와 [salecode]를 검사하게된다. 
						 * (메인 카테고리와 세일코드의 값을 and 연산으로 검색시켜줌. 그렇게 된다면 해당 메뉴에 대한 서브메뉴만 나오게됨 (중첩제거되어서))
						 * 
						 * sql문으로 가져온 subcategory List<String> 배열을 람다함수를 사용해서 forEach로 하나씩 꺼내어준다.
						 * 
						 */
						
						bDetailSalesDAO.selectDistinctCategory(hashmap).forEach((subcategoryname) ->{
							
							// 
							hashmap.put("subcategoryname", subcategoryname);
						
							// List<BdeatilsSaleVO> 해당되는 서브메뉴의 리스트 VO 가져오기
							/*
							 * 해당 기능은 hashmap에 subcategoryname 값을 추가시켜서
							 * [selectBDetailSalesMenu] 메서드에 where 조건문을 걸어줘서 
							 * [Salecode] [Maincategory] [Subcategory] 3개의 값을 고려해서 BDetailSales테이블에 검색시켜줍니다.
							 * 3개의 조건문에 부합되는 메뉴들만 가져와줍니다.
							 */
							subcategoryANDvo.put(subcategoryname, bDetailSalesDAO.selectBDetailSalesMenu(hashmap));
							
							
						});
//						// 서브메뉴들에 서브카테고리와 vo를 넣어준다.
//						subcategoriesList.add(subcategoryANDvo);
//						
//						// 메인메뉴카테고리들에 메인메뉴의 이름과 서브카테고리의 리스트들을 넣어준다.
//						maincategoriesMap.put(maincategoryName, subcategoriesList);
						// 서브메뉴들에 서브카테고리와 vo를 넣어준다.
						
						// 메인메뉴카테고리들에 메인메뉴의 이름과 서브카테고리의 리스트들을 넣어준다.
						maincategoriesMap.put(maincategoryName, subcategoryANDvo);
							
						
					}
					// ol에 Tree구조의 메인카테고리와 서브카테고리 메뉴들을 넣어준다.
					ol.setMaincategory(maincategoriesMap);
					
					
					System.out.println("■■■■■■■■■■■■■■■ 영경 테스트 ■■■■■■■■■■■■■■■");
				}
				
				
				// 반복문을 모두 수행한 orderList 리스트를 반환해준다.
				return orderList;
	}
}
