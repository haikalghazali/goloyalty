package com.goloyalty.biz.service.impl;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.goloyalty.biz.mapper.LoginMapper;
import com.goloyalty.biz.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	private static Logger logger = LogManager.getLogger(LoginServiceImpl.class);
	
	@Autowired
	private LoginMapper loginMapper;

	@Override
	public Map<String, Object> findByUsername(String username) {
		return loginMapper.findByUsername(username);
	}

	@Override
	public Map<String, Object> findUserInfoByUsername(String username) {
		return loginMapper.findUserInfoByUsername(username);
	}

}
