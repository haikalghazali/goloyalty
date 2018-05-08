package com.goloyalty.biz.service.impl;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goloyalty.biz.mapper.CategoryMapper;
import com.goloyalty.biz.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	private static Logger logger = LogManager.getLogger(CategoryServiceImpl.class);
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Override
	public List<Map<String, Object>> findCategories() {
		return categoryMapper.findCategories();
	}

	@Override
	public List<Map<String, Object>> findCategoriesById(String id) {
		return categoryMapper.findCategoriesById(id);
	}

	@Override
	public Map<String, Object> findById(String id) {
		return categoryMapper.findById(id);
	}

	@Override
	public void saveDealCategory(Map<String, Object> map, Principal principal) {
		map.put("inst_id", principal.getName());
		categoryMapper.saveDealCategory(map);
	}
	
	@Override
	public void saveRefCategory(Map<String, Object> map, Principal principal) {
		map.put("inst_id", principal.getName());
		categoryMapper.saveRefCategory(map);
	}

	@Override
	public void updateRefCategory(Map<String, Object> map, Principal principal) {
		map.put("mdf_id", principal.getName());
		categoryMapper.updateRefCategory(map);
	}
}
