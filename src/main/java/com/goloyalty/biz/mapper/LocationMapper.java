package com.goloyalty.biz.mapper;

import java.util.List;
import java.util.Map;

public interface LocationMapper {
	List<Map<String, Object>> findLocations();

	void saveDealLocation(Map<String, Object> locationMap);

	List<Map<String, Object>> findLocationsById(String id);

	Map<String, Object> findById(String id);
	
	void saveRefLocation(Map<String, Object> map);

	void updateRefLocation(Map<String, Object> map);
}
