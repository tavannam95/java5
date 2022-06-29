package com.poly.controller;

import java.nio.file.Path;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.beans.AccountModel;
import com.poly.beans.AuthModel;
import com.poly.dao.OrderDAO;
import com.poly.entities.Account;
import com.poly.entities.Order;
import com.poly.service.AccountService;

@Controller
@RequestMapping("/auth")
public class AuthController {

	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	HttpServletResponse response;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@Autowired
	AccountService accountService;

	@GetMapping("/login")
	public String login(Model model, @ModelAttribute("authModel") AuthModel authModel) {

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("username")) {
					authModel.setUsername(cookie.getValue());
				}
				if (cookie.getName().equals("password")) {
					authModel.setPassword(cookie.getValue());
				}
				if (cookie.getName().equals("remember") && cookie.getValue().equals("true")) {
					authModel.setRemember(true);
				}
			}
			model.addAttribute("authModel", authModel);
		}

		model.addAttribute("view", "auth/login.jsp");
		return "layout";
	}

	@PostMapping("/signin")
	public String signin(Model model, @Valid AuthModel authModel, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("view", "auth/login.jsp");
			return "layout";
		}

		Account account = this.accountService.login(authModel.getUsername(), authModel.getPassword());
		if (account == null) {
			session.setAttribute("error", "Tài khoản hoặc mật khẩu không chính xác!");
			model.addAttribute("view", "auth/login.jsp");
			return "layout";
		}

		if (authModel.isRemember()) {
			Cookie usernameCookie = new Cookie("username", authModel.getUsername());
			Cookie passwordCookie = new Cookie("password", authModel.getPassword());
			Cookie rememberCookie = new Cookie("remember", "true");
			response.addCookie(usernameCookie);
			response.addCookie(passwordCookie);
			response.addCookie(rememberCookie);
		}else {
			Cookie usernameCookie = new Cookie("username", "");
			Cookie passwordCookie = new Cookie("password", "");
			Cookie rememberCookie = new Cookie("remember", "false");
			response.addCookie(usernameCookie);
			response.addCookie(passwordCookie);
			response.addCookie(rememberCookie);
		}

		session.setAttribute("user", account);
		session.setAttribute("message", "Đăng nhập thành công!");
		
		Object redirectUri = session.getAttribute("redirect-uri");
		
		List<Order> list = this.orderDAO.findByUserId(account.getId());
		boolean chk = true;
		for (Order order : list) {
			if (order.getStatus() == 0) {
				chk = false;
			}
		}
		
		if (chk) {
			Date now = new Date();
			Order order = new Order();
			order.setAddress(account.getAddress());
			order.setStatus(0);
			order.setUser(account);
			order.setCreateDate(now);
			
			this.orderDAO.save(order);
		}
		
		if (redirectUri != null) {
			session.removeAttribute("redirect-uri");
			return "redirect:" + redirectUri;
		}
		return "redirect:/home";
	}

	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		session.setAttribute("message", "Đăng xuất thành công!");
		return "redirect:/home";
	}
	
	@GetMapping("/create")
	public String create(Model model, @ModelAttribute("accountModel") AccountModel accountModel) {
		model.addAttribute("view", "auth/create.jsp");
		return "layout";
	}

	@PostMapping("/store")
	public String store(
			@Valid @ModelAttribute AccountModel accountModel, 
			BindingResult result, 
			Model model

	) {
		
		if (!accountModel.getImageFile().isEmpty()) {

			String path = context.getRealPath("/");
			System.out.println(path);
			try {
				accountModel.setPhoto(accountModel.getImageFile().getOriginalFilename());
				String filePath = path + "/images/" + accountModel.getPhoto();

				accountModel.getImageFile().transferTo(Path.of(filePath));
				accountModel.setImageFile(null);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		if (result.hasErrors()) {
			model.addAttribute("view", "auth/create.jsp");
			return "layout";
		} else {
			
			Account account = new Account();
			account.setEmail(accountModel.getEmail());
			account.setFullname(accountModel.getFullname());
			account.setPassword(accountModel.getPassword());
			account.setPhoto(accountModel.getPhoto());
			account.setUsername(accountModel.getUsername());
			account.setAddress(accountModel.getAddress());
			this.accountService.save(account);
			
			session.setAttribute("message", "Đăng ký thành công!");
			
			return "redirect:/auth/login";
		}
	}

}
