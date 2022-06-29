package com.poly.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptors.LogInterceptor;

@Component
public class LogInterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	private LogInterceptor logInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(logInterceptor)
		.addPathPatterns(
				"/admin/**"
				
				);
	}
	
}
