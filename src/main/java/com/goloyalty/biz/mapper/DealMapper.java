package com.goloyalty.biz.mapper;

import java.util.List;
import java.util.Map;

import com.goloyalty.api.model.Deal;

public interface DealMapper {
	Map<String, Object> findById(String id);

	List<Map<String, Object>> findDeals();
	
	void saveDeal(Map<String, Object> map);

	Integer countTotalActiveDeal();

	List<Deal> findDealsAPI();

	List<Map<String, Object>> findDashboardDeals();

}
