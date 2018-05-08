package com.goloyalty.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.goloyalty.biz.service.LoginService;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler  {
	private static Logger logger = LogManager.getLogger(CustomSuccessHandler.class);
	
	@Autowired
	private LoginService loginService;
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
		String targetUrl = determineTargetUrl(authentication);
 
        if (response.isCommitted()) {
        	logger.error("Can't redirect");
            return;
        }
        
        // store user info in session
        request.getSession().setAttribute("userInfo", getUserInfo());
 
        redirectStrategy.sendRedirect(request, response, targetUrl);
    }
 
    /*
     * This method extracts the roles of currently logged-in user and returns
     * appropriate URL according to his/her role.
     */
    protected String determineTargetUrl(Authentication authentication) {
        String url = "";
 
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
 
        List<String> roles = new ArrayList<String>();
 
        for (GrantedAuthority a : authorities) {
            roles.add(a.getAuthority());
        }
 
        if (isAdmin(roles)) {
            url = "/admin/dashboard";
        } else if (isMerchant(roles)) {
            url = "/merchant/dashboard";
        } else {
            url = "/404";
        }
 
        return url;
    }
 
    private boolean isMerchant(List<String> roles) {
        if (roles.contains("Merchant")) {
            return true;
        }
        return false;
    }
 
    private boolean isAdmin(List<String> roles) {
        if (roles.contains("Administrator")) {
            return true;
        }
        return false;
    }
 
    public void setRedirectStrategy(RedirectStrategy redirectStrategy) {
        this.redirectStrategy = redirectStrategy;
    }
 
    protected RedirectStrategy getRedirectStrategy() {
        return redirectStrategy;
    }
    
    private Map<String, Object> getUserInfo() {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	return loginService.findUserInfoByUsername(((UserDetails)principal).getUsername());
    }
}
