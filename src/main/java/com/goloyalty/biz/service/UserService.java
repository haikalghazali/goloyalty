package com.goloyalty.biz.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.goloyalty.api.model.Customer;

@Service
public interface UserService {
	Map<String, Object> findById(String id);
	
	List<Map<String, Object>> findUsers();
	
	boolean isUserExist(Map<String, Object> map);
	
	void saveUser(Map<String, Object> map, Principal principal);
	
	void updateUser(Map<String, Object> map, Principal principal);
	
	Integer countTotalActiveUser();

	/*********** API ***********/
	Customer findCustomerProfileAPI();
}
