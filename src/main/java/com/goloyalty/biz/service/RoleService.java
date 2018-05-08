package com.goloyalty.biz.service;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface RoleService {
	List<Map<String, Object>> findRoles();

	Map<String, Object> findById(String id);

	void saveRole(Map<String, Object> map, Principal principal);

	void updateRole(Map<String, Object> map, Principal principal);
}
