package com.goloyalty.biz.service.impl;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.goloyalty.api.model.Deal;
import com.goloyalty.biz.mapper.CategoryMapper;
import com.goloyalty.biz.mapper.DealMapper;
import com.goloyalty.biz.mapper.LocationMapper;
import com.goloyalty.biz.service.DealService;
import com.goloyalty.exception.InvalidFileException;
import com.goloyalty.util.BaseUtil;
import com.goloyalty.util.DateUtil;
import com.goloyalty.util.FileUtil;

@Service
public class DealServiceImpl implements DealService {
	private static Logger logger = LogManager.getLogger(DealServiceImpl.class);
	
	@Autowired
	private DealMapper dealMapper;
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	private LocationMapper locationMapper;
	
	@Value("${upload.file.directory}")
	private String uploadDirectory;

	@Override
	public Map<String, Object> findById(String id) {
		return dealMapper.findById(id);
	}

	@Override
	public List<Map<String, Object>> findDeals() {
		return dealMapper.findDeals();
	}
	
	@Override
	public void saveDeal(Map<String, Object> map, MultipartFile file, Principal principal, HttpServletRequest request) throws IOException, InvalidFileException {
		String deal_id = BaseUtil.generateDealRandomNumber();
		
		// transfer deal image
		String filePath = request.getSession().getServletContext().getRealPath("/");
		String directoryName = filePath.concat("uploads\\");
		String fileName = FileUtil.handleFileName(file.getOriginalFilename(), uploadDirectory, deal_id);
		file.transferTo(new File(directoryName + fileName));
		
		// save deal details
		map.put("deal_id", deal_id);
		map.put("deal_start_dt", DateUtil.formatDate(map.get("deal_start_dt").toString()));
		map.put("deal_end_dt", DateUtil.formatDate(map.get("deal_end_dt").toString()));
		map.put("deal_image", directoryName + fileName);
		map.put("inst_id", principal.getName());
		dealMapper.saveDeal(map);
		
		// save list of deal categories
		Map<String, Object> categoryMap = new HashMap<String, Object>();
		List<Map<String, Object>> listCategories = (List<Map<String, Object>>) map.get("deal_category");
		
		for(int i = 0; i < listCategories.size(); i++) {
			categoryMap.put("deal_id", deal_id);
			categoryMap.put("category_id", listCategories.get(i));
			categoryMap.put("inst_id", principal.getName());
			categoryMapper.saveDealCategory(categoryMap);
		}
		
		// save list of deal locations
//		Map<String, Object> locationMap = new HashMap<String, Object>();
//		List<Map<String, Object>> listLocation = (List<Map<String, Object>>) map.get("deal_location");
//		
//		for(int i = 0; i < listLocation.size(); i++) {
//			locationMap.put("deal_id", deal_id);
//			locationMap.put("location_id", listLocation.get(i));
//			locationMap.put("inst_id", principal.getName());
//			locationMapper.saveDealLocation(locationMap);
//		}
	}

	@Override
	public void updateDeal(Map<String, Object> map, MultipartFile file, Principal principal) throws IOException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Integer countTotalActiveDeal() {
		return dealMapper.countTotalActiveDeal();
	}

	@Override
	public List<Deal> findDealsAPI() {
		return dealMapper.findDealsAPI();
	}

	@Override
	public List<Map<String, Object>> findDashboardDeals() {
		return dealMapper.findDashboardDeals();
	}

}
