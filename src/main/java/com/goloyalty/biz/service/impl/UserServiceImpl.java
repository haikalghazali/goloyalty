package com.goloyalty.biz.service.impl;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.goloyalty.api.model.Customer;
import com.goloyalty.biz.mapper.UserMapper;
import com.goloyalty.biz.service.UserService;
import com.goloyalty.util.BaseUtil;
import com.goloyalty.util.DateUtil;

@Service
public class UserServiceImpl implements UserService {
	private static Logger logger = LogManager.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Override
	public Map<String, Object> findById(String id) {
		return userMapper.findById(id);
	}
	
	@Override
	public List<Map<String, Object>> findUsers() {
		return userMapper.findUsers();
	}
	
	@Override
	public boolean isUserExist(Map<String, Object> map) {
		return userMapper.isUserExist(map);
	}
	
	@Override
	public void saveUser(Map<String, Object> map, Principal principal) {
		map.put("user_id", BaseUtil.generateUserRandomNumber());
		map.put("password", bCryptPasswordEncoder.encode((CharSequence) map.get("password")));
		map.put("dob", DateUtil.formatDate(map.get("dob").toString()));
		map.put("inst_id", principal.getName());
		userMapper.saveUser(map);
	}
	
	@Override
	public void updateUser(Map<String, Object> map, Principal principal) {
		map.put("dob", DateUtil.formatDate(map.get("dob").toString()));
		map.put("mdf_id", principal.getName());
		userMapper.updateUser(map);
	}
	
	@Override
	public Integer countTotalActiveUser() {
		return userMapper.countTotalActiveUser();
	}

	@Override
	public Customer findCustomerProfileAPI() {
		return userMapper.findCustomerProfileAPI();
	}
}