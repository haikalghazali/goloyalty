package com.goloyalty.biz.mapper;

import java.util.List;
import java.util.Map;

public interface CategoryMapper {
	List<Map<String, Object>> findCategories();
	
	void saveRefCategory(Map<String, Object> map);

	List<Map<String, Object>> findCategoriesById(String id);

	Map<String, Object> findById(String id);

	void updateRefCategory(Map<String, Object> map);

	void saveDealCategory(Map<String, Object> map);
}
