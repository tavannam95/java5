package com.poly.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.entities.Account;

@Component
public class AdminInterceptor implements HandlerInterceptor{

	@Autowired
	HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		Account user = (Account) session.getAttribute("user");
		if ( user!=null && user.getAdmin()!=1) {
			session.setAttribute("redirect-uri", request.getRequestURI());
			session.setAttribute("error", "Chức năng chỉ giành cho quản trị viên!");
			response.sendRedirect("/home");
			return false;
		}
		return true;
	}
}
