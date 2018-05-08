package com.goloyalty.biz.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface LocationService {
	List<Map<String, Object>> findLocations();

	List<Map<String, Object>> findLocationsById(String id);

	Map<String, Object> findById(String id);

	void saveDealLocation(Map<String, Object> map, Principal principal);
	
	void saveRefLocation(Map<String, Object> map, Principal principal);

	void updateRefLocation(Map<String, Object> map, Principal principal);
}
