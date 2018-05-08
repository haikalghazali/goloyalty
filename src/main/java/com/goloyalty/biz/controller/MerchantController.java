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

import com.goloyalty.biz.service.MerchantService;

@Controller
@RequestMapping("/admin/merchant")
public class MerchantController {
	private static Logger logger = LogManager.getLogger(MerchantController.class);
	
	@Autowired
	MerchantService merchantService;
	
	@RequestMapping(value="/merchants", method = RequestMethod.GET)
	 public String merchantsPage(ModelMap model) {
		model.addAttribute("listMerchants", merchantService.findMerchants());
		
        return "admin/merchant/merchants";
    }
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String merchantFormPage(ModelMap model) {
		model.addAttribute("indicator", "save");
		model.addAttribute("merchant", new HashMap<Object, String>());
		
		return "admin/merchant/merchantForm";
	}
	
	@RequestMapping(value="/id/{id}", method = RequestMethod.GET)
	public String merchantFormPage(@PathVariable(value="id") String id, ModelMap model){
		model.addAttribute("indicator", "update");
		model.addAttribute("merchant", merchantService.findById(id));
		
		return "admin/merchant/merchantForm";
	}
	
	@RequestMapping(value="/save", method = RequestMethod.POST)
	public ResponseEntity<?> merchantFormPage(@RequestParam Map<String, Object> map, Principal principal) {
		if(map.get("indicator").equals("save")) {
			merchantService.saveMerchant(map, principal);
	        
	        return new ResponseEntity<String>("Merchant successfully registered", HttpStatus.CREATED);
		} else {
			merchantService.updateMerchant(map, principal);
	        
	        return new ResponseEntity<String>("Merchant successfully updated", HttpStatus.CREATED);
		}
	}
}
