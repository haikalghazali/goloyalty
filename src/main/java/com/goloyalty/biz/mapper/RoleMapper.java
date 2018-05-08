package com.goloyalty.biz.mapper;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
	List<Map<String, Object>> findRoles();

	Map<String, Object> findById(String id);

	void saveRole(Map<String, Object> map);

	void updateRole(Map<String, Object> map);
}
