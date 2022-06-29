package com.poly.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.entities.Account;

@Component
public class LogInterceptor implements HandlerInterceptor{

	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Account user = (Account) session.getAttribute("user");
		if ( user!= null) {
			return true;
		}
		session.setAttribute("redirect-uri", request.getRequestURI());
		session.setAttribute("error", "Bạn cần phải đăng nhập trước!");
		response.sendRedirect("/auth/login");
		return false;
	}
}
