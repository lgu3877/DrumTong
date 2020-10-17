package com.drumtong.business.service.mainmanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BDeliveryAreaDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BMenuDAO;
import com.drumtong.business.vo.BDeliveryAreaVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;

@Service
public class RestBusinessMainManagementService {
	
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BMenuDAO	bMenuDAO;
	@Autowired BDeliveryAreaDAO bDeliveryAreaDAO;
	
	// ========================= 대분류 [매장관리] ================================
	
	
	// ===== 중분류 [BManagement] 테이블 ====
	
	
	// === 소분류 [ Introduction ] 필드 {매장소개글} ==
	// 1. 매장 관리에 매장 소개글을 비동기식으로 수정해주는 메서드입니다.
	public int updateIntroduction(BManagementVO bManagementVO) {
		
		int RestUpdateIntroductionReuslt = bManagementDAO.updateIntroduction(bManagementVO);
		
		return RestUpdateIntroductionReuslt;
	}


	// === 소분류 [ DeliveryBoolean ] 필드 {배달유무} ==
	// 2. 매장 관리에 배달유무를 비둥기식으로 수정해주는 메서드입니다.
	public int updateDeliveryBoolean(BManagementVO bManagementVO) {
		
		int RestUpdateDeliveryBooleanReuslt = bManagementDAO.updateDeliveryBoolean(bManagementVO);
		
		return RestUpdateDeliveryBooleanReuslt;
	}


	// === 소분류 [ QuickBoolean ] 필드 {퀵유무} ==
	// 3. 매장 관리에 퀵여부를 비둥기식으로 수정해주는 메서드입니다.
	public int updateQuickBoolean(BManagementVO bManagementVO) {
		
		int RestUpdateDeliveryBooleanReuslt = bManagementDAO.updateQuickBoolean(bManagementVO);
		
		return RestUpdateDeliveryBooleanReuslt;
	}

	// === 소분류 [ DEFAULTCATEGORY ] 필드 {퀵유무} ==
	// 4. 매장 관리에 기본 카테고리를 비둥기식으로 수정해주는 메서드입니다.
	public int updateDefaultCategory(BManagementVO bManagementVO) {

		int RestUpdateDefaultCategoryReuslt = bManagementDAO.updateDefaultCategory(bManagementVO);
		
		return RestUpdateDefaultCategoryReuslt;
	}

	
	
	
	// ===== 중분류 [BManagement] 테이블 ====

	
	// 1. 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	public int updateBMenu(BMenuVO bMenuVO) {
		int RestUpdateBMenuReuslt = bMenuDAO.updateBMenu(bMenuVO);
		
		return RestUpdateBMenuReuslt;
	}

	// 2. 매장 메뉴를 비동기식으로 삭제해주는 메서드입니다.
	public int deleteBMenu(BMenuVO bMenuVO) {
		
		int RestDeleteBMenuReuslt = bMenuDAO.deleteBMenu(bMenuVO);
		
		return RestDeleteBMenuReuslt;
	}
	
	
	
	
	

	// ===== 중분류 [BDELIVERYAREA] 테이블 ====	
	
	// 1. 배달 지역을 비동기식으로 수정해주는 메서드입니다.
	public int updateBDeliveryArea(BDeliveryAreaVO bDeliveryAreaVO) {

		int RestUpdateBDeliveryAreaReuslt = bDeliveryAreaDAO.updateBDeliveryArea(bDeliveryAreaVO);
		
		return RestUpdateBDeliveryAreaReuslt;
	}

}
