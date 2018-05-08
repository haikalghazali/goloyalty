package com.goloyalty.biz.service;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goloyalty.api.model.Deal;
import com.goloyalty.exception.InvalidFileException;

@Service
public interface DealService {
	Map<String, Object> findById(String id);
	
	List<Map<String, Object>> findDeals();
	
	void saveDeal(Map<String, Object> map, MultipartFile file, Principal principal, HttpServletRequest request) throws IOException, InvalidFileException;

	void updateDeal(Map<String, Object> map, MultipartFile file, Principal principal) throws IOException;
	
	Integer countTotalActiveDeal();
	
	List<Deal> findDealsAPI();

	List<Map<String, Object>> findDashboardDeals();
}
