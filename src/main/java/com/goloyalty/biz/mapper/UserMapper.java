package com.goloyalty.biz.mapper;

import java.util.List;
import java.util.Map;

import com.goloyalty.api.model.Customer;

public interface UserMapper {
	Map<String, Object> findById(String id);

	List<Map<String, Object>> findUsers();

	boolean isUserExist(Map<String, Object> map);

	void saveUser(Map<String, Object> map);
	
	void updateUser(Map<String, Object> map);

	Integer countTotalActiveUser();

	Customer findCustomerProfileAPI();
}
