package com.goloyalty.biz.mapper;

import java.util.List;
import java.util.Map;

public interface MerchantMapper {
	Map<String, Object> findById(String id);

	List<Map<String, Object>> findMerchants();

	void saveMerchant(Map<String, Object> map);

	void updateMerchant(Map<String, Object> map);

	Integer countTotalActiveMerchant();

}
