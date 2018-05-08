package com.goloyalty;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.web.servlet.MultipartAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@EnableAutoConfiguration(exclude={MultipartAutoConfiguration.class})
@ComponentScan("com.goloyalty")
@MapperScan("com.goloyalty.biz.mapper")
public class GoloyaltyApplication extends SpringBootServletInitializer {
	private static Logger logger = LogManager.getLogger(GoloyaltyApplication.class);
	
	public static void main(String[] args) {
		logger.info("Starting Spring Boot application...");
		SpringApplication.run(GoloyaltyApplication.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(GoloyaltyApplication.class);
	}
}
