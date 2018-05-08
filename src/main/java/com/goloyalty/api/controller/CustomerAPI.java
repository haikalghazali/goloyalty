package com.goloyalty.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goloyalty.api.model.Customer;
import com.goloyalty.biz.service.UserService;

@Controller
public class CustomerAPI {
	@Autowired
	UserService userService;
	
	@GetMapping("/api/customer/profile")
    @ResponseBody
    public Customer getCustomerProfile() {
		return userService.findCustomerProfileAPI();
    }

}
