package com.goloyalty.biz.service.impl;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goloyalty.biz.mapper.LocationMapper;
import com.goloyalty.biz.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {
	private static Logger logger = LogManager.getLogger(LocationServiceImpl.class);
	
	@Autowired
	private LocationMapper locationMapper;

	@Override
	public List<Map<String, Object>> findLocations() {
		return locationMapper.findLocations();
	}

	@Override
	public List<Map<String, Object>> findLocationsById(String id) {
		return locationMapper.findLocationsById(id);
	}

	@Override
	public Map<String, Object> findById(String id) {
		return locationMapper.findById(id);
	}
	
	@Override
	public void saveDealLocation(Map<String, Object> map, Principal principal) {
		map.put("inst_id", principal.getName());
		locationMapper.saveDealLocation(map);
	}

	@Override
	public void saveRefLocation(Map<String, Object> map, Principal principal) {
		map.put("inst_id", principal.getName());
		locationMapper.saveRefLocation(map);
	}

	@Override
	public void updateRefLocation(Map<String, Object> map, Principal principal) {
		map.put("mdf_id", principal.getName());
		locationMapper.updateRefLocation(map);
	}

}
