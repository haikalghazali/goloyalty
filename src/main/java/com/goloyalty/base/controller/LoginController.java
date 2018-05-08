package com.goloyalty.base.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goloyalty.biz.service.DealService;
import com.goloyalty.biz.service.MerchantService;
import com.goloyalty.biz.service.UserService;

@Controller
public class LoginController {
	@Autowired
	UserService userService;
	
	@Autowired
	MerchantService merchantService;
	
	@Autowired
	DealService dealService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(){
		return "login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }
    
    @RequestMapping(value = "/404", method = RequestMethod.GET)
    public String accessDeniedPage() {
        return "404";
    }
    
    @RequestMapping(value = "/admin/dashboard", method = RequestMethod.GET)
    public String adminPage(ModelMap model) {
    	model.addAttribute("totalUser", userService.countTotalActiveUser());
    	model.addAttribute("totalMerchant", merchantService.countTotalActiveMerchant());
    	model.addAttribute("totalDeal", dealService.countTotalActiveDeal());
    	model.addAttribute("dashboardDeals", dealService.findDashboardDeals());
    	
        return "admin/dashboard";
    }
    
    @RequestMapping(value = "/merchant/dashboard", method = RequestMethod.GET)
    public String merchantPage(ModelMap model) {
        return "merchant/dashboard";
    }
}
