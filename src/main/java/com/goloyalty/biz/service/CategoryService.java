package com.goloyalty.biz.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface CategoryService {
	List<Map<String, Object>> findCategories();

	List<Map<String, Object>> findCategoriesById(String id);

	Map<String, Object> findById(String id);

	void saveDealCategory(Map<String, Object> map, Principal principal);
	
	void saveRefCategory(Map<String, Object> map, Principal principal);

	void updateRefCategory(Map<String, Object> map, Principal principal);
}
