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
import com.goloyalty.biz.service.UserService;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	private static Logger logger = LogManager.getLogger(UserController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	RoleService roleService;
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	 public String usersPage(ModelMap model) {
		model.addAttribute("listUsers", userService.findUsers());
		
		return "admin/user/users";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String userFormPage(ModelMap model) {
		model.addAttribute("indicator", "save");
		model.addAttribute("listRoles", roleService.findRoles());
		model.addAttribute("user", new HashMap<String, Object>());
		
		return "admin/user/userForm";
	}
	
	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	 public String userFormPage(@PathVariable(value="id") String id, ModelMap model) {
		model.addAttribute("indicator", "update");
		model.addAttribute("listRoles", roleService.findRoles());
		model.addAttribute("user", userService.findById(id));
		
		return "admin/user/userForm";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	 public ResponseEntity<?> userFormPage(@RequestParam Map<String, Object> map, Principal principal) {
		if(map.get("indicator").equals("save")) {
			if(userService.isUserExist(map)) {
				logger.error("Unable to create. A User with name {} already exist", map.get("username"));
	            return new ResponseEntity<>("Unable to create. A user with name " + map.get("username") + " already exist.", HttpStatus.CONFLICT);
			}
			userService.saveUser(map, principal);
	        
	        return new ResponseEntity<String>("User successfully created", HttpStatus.CREATED);
		} else {
			userService.updateUser(map, principal);
	        
	        return new ResponseEntity<String>("User successfully updated", HttpStatus.CREATED);
		}
	}
}
