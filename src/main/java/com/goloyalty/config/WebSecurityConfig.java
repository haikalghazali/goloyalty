package com.goloyalty.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter  {
	@Autowired
	private UserDetailsService userDetailsService;
	
	@Autowired
	private CustomSuccessHandler customSuccessHandler;
	
	@Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
				.antMatchers("/resources/**").permitAll()
				.antMatchers("/").permitAll()
				.antMatchers("/index").permitAll()
				.antMatchers("/login").permitAll()
				.antMatchers("/404").permitAll()
				.antMatchers("/register").permitAll()
				.antMatchers("/api/**").permitAll()
				.antMatchers("/admin/**").hasAuthority("Administrator")
				.antMatchers("/merchant/**").hasAuthority("Merchant")
				.anyRequest().authenticated()
				.and()
			.formLogin()
			 	.loginPage("/login")
			 	.successHandler(customSuccessHandler)
			 	.usernameParameter("username")
			 	.passwordParameter("password")
			 	.and()
			 .csrf()
			 	.and()
			 .exceptionHandling()
			 	.accessDeniedPage("/404")
			 	.and()
			 .logout()
		 		.permitAll();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
	    web
	    	.ignoring()
	    		.antMatchers("/resources/**", "/static/**", "/assets/**", "/css/**", "/img/**", "/js/**");
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
	}
}
