package com.poly.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptors.AdminInterceptor;

@Component
public class AdminInterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	private AdminInterceptor adminInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(adminInterceptor)
		.addPathPatterns(
				"/admin/accounts/**",
				"/admin/categories/**",
				"/admin/orders/**",
				"/admin/products/**"
				
				);
	}
	
}
