package com.goloyalty.biz.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface LoginService {
	Map<String, Object> findByUsername(String username);

	Map<String, Object> findUserInfoByUsername(String username);
}
