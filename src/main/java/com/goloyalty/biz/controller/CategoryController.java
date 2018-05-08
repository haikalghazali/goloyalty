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

import com.goloyalty.biz.service.CategoryService;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	private static Logger logger = LogManager.getLogger(CategoryController.class);
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping(value = "/categories", method = RequestMethod.GET)
	 public String categoriesPage(ModelMap model) {
		model.addAttribute("listCategories", categoryService.findCategories());
		
		return "admin/category/categories";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String categoryFormPage(ModelMap model) {
		model.addAttribute("indicator", "save");
		model.addAttribute("listCategories", categoryService.findCategories());
		model.addAttribute("category", new HashMap<String, Object>());
		
		return "admin/category/categoryForm";
	}
	
	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET)
	 public String categoryFormPage(@PathVariable(value="id") String id, ModelMap model) {
		model.addAttribute("indicator", "update");
		model.addAttribute("listCategories", categoryService.findCategories());
		model.addAttribute("category", categoryService.findById(id));
		
		return "admin/category/categoryForm";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	 public ResponseEntity<?> categoryFormPage(@RequestParam Map<String, Object> map, Principal principal) {
		if(map.get("indicator").equals("save")) {
			categoryService.saveRefCategory(map, principal);
	        
	        return new ResponseEntity<String>("Category successfully created", HttpStatus.CREATED);
		} else {
			categoryService.updateRefCategory(map, principal);
	        
	        return new ResponseEntity<String>("Category successfully updated", HttpStatus.CREATED);
		}
	}
}
