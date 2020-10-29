package com.drumtong.business.controller.submanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.business.service.submanagement.RestBusinessSubManagementService;


@RestController
@RequestMapping("business/subManagement/")
public class RestBusinessSubManagementController {


	@Autowired RestBusinessSubManagementService svc;
	
}
