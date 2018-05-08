package com.goloyalty.security;

import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.goloyalty.biz.service.LoginService;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	private static Logger logger = LogManager.getLogger(UserDetailsServiceImpl.class);
	
	@Autowired
	private LoginService loginService;

	@Override
	@Transactional(readOnly = true)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> map = loginService.findByUsername(username);
		if(map == null){
			throw new UsernameNotFoundException("Invalid username or password.");
		}

		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		grantedAuthorities.add(new SimpleGrantedAuthority((String) map.get("role_name")));
		
		return new org.springframework.security.core.userdetails.User((String) map.get("username"), (String) map.get("password"), grantedAuthorities);
	}
}
