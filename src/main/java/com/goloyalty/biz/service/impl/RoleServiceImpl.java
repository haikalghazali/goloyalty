package com.goloyalty.biz.service.impl;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goloyalty.biz.mapper.RoleMapper;
import com.goloyalty.biz.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	private static Logger logger = LogManager.getLogger(RoleServiceImpl.class);
	
	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Map<String, Object>> findRoles() {
		return roleMapper.findRoles();
	}

	@Override
	public Map<String, Object> findById(String id) {
		return roleMapper.findById(id);
	}

	@Override
	public void saveRole(Map<String, Object> map, Principal principal) {
		map.put("inst_id", principal.getName());
		roleMapper.saveRole(map);
	}

	@Override
	public void updateRole(Map<String, Object> map, Principal principal) {
		map.put("mdf_id", principal.getName());
		roleMapper.updateRole(map);
	}
}
