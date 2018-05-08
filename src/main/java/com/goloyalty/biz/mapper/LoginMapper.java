package com.goloyalty.biz.mapper;

import java.util.Map;

public interface LoginMapper {
	Map<String, Object> findByUsername(String username);

	Map<String, Object> findUserInfoByUsername(String username);
}
