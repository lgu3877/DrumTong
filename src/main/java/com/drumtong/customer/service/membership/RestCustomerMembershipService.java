package com.drumtong.customer.service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.customer.dao.CPrivateDataDAO;


@Service
public class RestCustomerMembershipService {
	
	@Autowired CPrivateDataDAO cPrivateDataDAO;		// 고객정보 테이블
	
	// 아이디 중복 검사
	public int useridDupl(String id) {
		return cPrivateDataDAO.useridDupl(id);
	}

	
}
