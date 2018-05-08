package com.goloyalty.biz.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface MerchantService {
	Map<String, Object> findById(String id);
	
	List<Map<String, Object>> findMerchants();
	
	void saveMerchant(Map<String, Object> map, Principal principal);

	void updateMerchant(Map<String, Object> map, Principal principal);
	
	Integer countTotalActiveMerchant();

}
