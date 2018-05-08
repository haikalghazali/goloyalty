package com.goloyalty.biz.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.goloyalty.biz.service.CategoryService;
import com.goloyalty.biz.service.DealService;
import com.goloyalty.biz.service.MerchantService;
import com.goloyalty.biz.service.LocationService;
import com.goloyalty.exception.InvalidFileException;

@Controller
@RequestMapping("/admin/deal")
public class DealController {
	private static Logger logger = LogManager.getLogger(DealController.class);
	
	@Autowired
	DealService dealService;
	
	@Autowired
	MerchantService merchantService;
	
	@Autowired
	LocationService locationService;
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = "deals", method = RequestMethod.GET)
	 public String dealsPage(ModelMap model) {
		model.addAttribute("listDeals", dealService.findDeals());
		
		return "admin/deal/deals";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String dealFormPage(ModelMap model) {
		model.addAttribute("indicator", "save");
		model.addAttribute("listMerchants", merchantService.findMerchants());
		model.addAttribute("listLocations", locationService.findLocations());
		model.addAttribute("listCategories", categoryService.findCategories());
		model.addAttribute("deal", new HashMap<Object, String>());
		
		return "admin/deal/dealForm";
	}
	
	@RequestMapping(value="/id/{id}", method = RequestMethod.GET)
	public String dealFormPage(@PathVariable(value="id") String id, ModelMap model){
		model.addAttribute("indicator", "update");
		model.addAttribute("listMerchants", merchantService.findMerchants());
		model.addAttribute("listLocations", locationService.findLocations());
		model.addAttribute("listCategories", categoryService.findCategories());
		model.addAttribute("deal", dealService.findById(id));
		model.addAttribute("category", categoryService.findCategoriesById(id));
		model.addAttribute("location", locationService.findLocationsById(id));
		
		return "admin/deal/dealForm";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
    public ResponseEntity<?> dealFormPage(@RequestParam("deal") String deal, @RequestParam("file") MultipartFile file, Principal principal, HttpServletRequest request) throws IOException, InvalidFileException {
		Map<String, Object> map = new ObjectMapper().readValue(deal, new TypeReference<Map<String, Object>>(){});
		if(map.get("indicator").equals("save")) {
			if (file.isEmpty()) {
	        	logger.error("Please select a file to upload");
	            return new ResponseEntity<>("Please select a file to upload", HttpStatus.CONFLICT);
	        }
			
			dealService.saveDeal(map, file, principal, request);	
	        
			return new ResponseEntity<String>("Deal successfully registered", HttpStatus.CREATED);
		} else {
			return new ResponseEntity<String>("Deal successfully updated", HttpStatus.CREATED);
		}
    }
}
