package com.goloyalty.biz.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

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

import com.goloyalty.biz.service.LocationService;

@Controller
@RequestMapping("/admin/location")
public class LocationController {
	private static Logger logger = LogManager.getLogger(LocationController.class);
	
	@Autowired
	LocationService locationService;

	@RequestMapping(value = "/locations", method = RequestMethod.GET)
	 public String locationsPage(ModelMap model) {
		model.addAttribute("listLocations", locationService.findLocations());
		
		return "admin/location/locations";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String locationFormPage(ModelMap model) {
		model.addAttribute("indicator", "save");
		model.addAttribute("listLocations", locationService.findLocations());
		model.addAttribute("location", new HashMap<String, Object>());
		
		return "admin/location/locationForm";
	}
	
	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	 public String locationFormPage(@PathVariable(value="id") String id, ModelMap model) {
		model.addAttribute("indicator", "update");
		model.addAttribute("listLocations", locationService.findLocations());
		model.addAttribute("location", locationService.findById(id));
		
		return "admin/location/locationForm";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	 public ResponseEntity<?> locationFormPage(@RequestParam Map<String, Object> map, Principal principal) {
		if(map.get("indicator").equals("save")) {
			locationService.saveRefLocation(map, principal);
	        
	        return new ResponseEntity<String>("Location successfully created", HttpStatus.CREATED);
		} else {
			locationService.updateRefLocation(map, principal);
	        
	        return new ResponseEntity<String>("Location successfully updated", HttpStatus.CREATED);
		}
	}
}
