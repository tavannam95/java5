package com.poly.controller.admin;

import java.nio.file.Path;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.beans.AccountModel;
import com.poly.dao.AccountDAO;
import com.poly.entities.Account;

@Controller
@RequestMapping("/admin/accounts")
public class AccountController {

	@Autowired
	AccountDAO accountDAO;

	@Autowired
	ServletContext context;
	
	@GetMapping("/index")
	public String index(Model model, @RequestParam(name = "size", defaultValue = "5") Integer size,
			@RequestParam(name = "page", defaultValue = "0") Integer page

	) {
		Pageable pageable = PageRequest.of(page, size);
		Page<Account> p = this.accountDAO.findAll(pageable);

		model.addAttribute("page", page);
		model.addAttribute("view", "admin/accounts/index.jsp");
		model.addAttribute("data", p);
		return "layout";
	}

	@GetMapping("/create")
	public String create(Model model, @ModelAttribute("accountModel") AccountModel accountModel) {
		model.addAttribute("view", "admin/accounts/create.jsp");
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
			model.addAttribute("view", "admin/accounts/create.jsp");
			return "layout";
		} else {
			
			Account account = new Account();
			account.setEmail(accountModel.getEmail());
			account.setFullname(accountModel.getFullname());
			account.setPassword(accountModel.getPassword());
			account.setPhoto(accountModel.getPhoto());
			account.setUsername(accountModel.getUsername());
			account.setAddress(accountModel.getAddress());
			this.accountDAO.save(account);

			return "redirect:/admin/accounts/index";
		}
	}

	@GetMapping("/edit/{id}")
	public String edit(
			@PathVariable("id") Account account, 
			AccountModel accountModel, 
			Model model) {

		model.addAttribute("account", account);

		accountModel.setActivated(account.getActivated());
		accountModel.setAddress(account.getAddress());
		accountModel.setAdmin(account.getAdmin());
		accountModel.setEmail(account.getEmail());
		accountModel.setFullname(account.getFullname());
		accountModel.setUsername(account.getUsername());
		accountModel.setPassword(account.getPassword());
		
		model.addAttribute("accountModel", accountModel);
		model.addAttribute("view", "admin/accounts/edit.jsp");
		return "layout";
	}

	@PostMapping("/update/{id}")
	public String update(
			@PathVariable("id") Account account,
			@Valid @ModelAttribute("accountModel") AccountModel accountModel, 
			BindingResult result,
			Model model
					) {
		if (result.hasErrors()) {
			model.addAttribute("view", "admin/accounts/edit.jsp");
			model.addAttribute("account", account);
			return "layout";
		} else {
			
			account.setFullname(accountModel.getFullname());
			account.setUsername(accountModel.getUsername());
			account.setEmail(accountModel.getEmail());
			account.setActivated(accountModel.getActivated());
			account.setAdmin(accountModel.getAdmin());
			account.setAddress(accountModel.getAddress());
			account.setPassword(accountModel.getPassword());
			
			this.accountDAO.save(account);

			return "redirect:/admin/accounts/index";
		}

	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Account account) {
		this.accountDAO.delete(account);
		return "redirect:/admin/accounts/index";
	}
	
}
