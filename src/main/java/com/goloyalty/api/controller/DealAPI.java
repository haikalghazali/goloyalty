package com.goloyalty.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goloyalty.api.model.Deal;
import com.goloyalty.biz.service.DealService;

@Controller
public class DealAPI {
	@Autowired
	DealService dealService;
	
	@GetMapping("/api/deals")
    @ResponseBody
    public List<Deal> dealList() {
		return dealService.findDealsAPI();
    }
	
//	@RequestMapping(value={"/api/deals"}, method = RequestMethod.GET)
//	public String dealFeed(){
//		return "api/deal-feed";
//	}
}
