package com.drumtong.customer.service.main;

import org.springframework.stereotype.Service;

import com.drumtong.security.SearchAutoComplete;

@Service
public class RestCustomerMainService {

	public String searchAutoComplete(String searchWord) {
		return SearchAutoComplete.getSearchAutoJsonVer(searchWord);
	}

}
