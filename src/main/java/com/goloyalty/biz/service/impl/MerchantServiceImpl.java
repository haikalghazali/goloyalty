package com.goloyalty.biz.service.impl;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goloyalty.biz.mapper.MerchantMapper;
import com.goloyalty.biz.service.MerchantService;
import com.goloyalty.util.BaseUtil;

@Service
public class MerchantServiceImpl implements MerchantService {
	private static Logger logger = LogManager.getLogger(MerchantServiceImpl.class);
	
	@Autowired
	private MerchantMapper merchantMapper;

	@Override
	public Map<String, Object> findById(String id) {
		return merchantMapper.findById(id);
	}

	@Override
	public List<Map<String, Object>> findMerchants() {
		return merchantMapper.findMerchants();
	}
	
	@Override
	public void saveMerchant(Map<String, Object> map, Principal principal) {
		map.put("merchant_id", BaseUtil.generateMerchantRandomNumber());
		map.put("inst_id", principal.getName());
		merchantMapper.saveMerchant(map);
	}

	@Override
	public void updateMerchant(Map<String, Object> map, Principal principal) {
		map.put("mdf_id", principal.getName());
		merchantMapper.updateMerchant(map);
	}

	@Override
	public Integer countTotalActiveMerchant() {
		return merchantMapper.countTotalActiveMerchant();
	}

}
