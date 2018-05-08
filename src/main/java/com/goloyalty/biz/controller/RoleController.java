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

import com.goloyalty.biz.service.RoleService;

@Controller
@RequestMapping("/admin/role")
public class RoleController {
	private static Logger logger = LogManager.getLogger(RoleController.class);
	
	@Autowired
	RoleService roleService;

	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	 public String rolesPage(ModelMap model) {
		model.addAttribute("listRoles", roleService.findRoles());
		
		return "admin/role/roles";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String roleFormPage(ModelMap model) {
		model.addAttribute("indicator", "save");
		model.addAttribute("listRoles", roleService.findRoles());
		model.addAttribute("location", new HashMap<String, Object>());
		
		return "admin/role/roleForm";
	}
	
	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	 public String roleFormPage(@PathVariable(value="id") String id, ModelMap model) {
		model.addAttribute("indicator", "update");
		model.addAttribute("listRoles", roleService.findRoles());
		model.addAttribute("role", roleService.findById(id));
		
		return "admin/role/roleForm";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	 public ResponseEntity<?> roleFormPage(@RequestParam Map<String, Object> map, Principal principal) {
		if(map.get("indicator").equals("save")) {
			roleService.saveRole(map, principal);
	        
	        return new ResponseEntity<String>("Role successfully created", HttpStatus.CREATED);
		} else {
			roleService.updateRole(map, principal);
	        
	        return new ResponseEntity<String>("Role successfully updated", HttpStatus.CREATED);
		}
	}
}
