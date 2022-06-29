package com.poly.controller.admin;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.beans.CartItemModel;
import com.poly.beans.OrderDetailModel;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.entities.Account;
import com.poly.entities.Order;
import com.poly.entities.OrderDetail;
import com.poly.entities.Product;
import com.poly.service.CartService;

@Controller
@RequestMapping("/admin/orderdetails")
public class OrderDetailController {
	
	@Autowired
	OrderDAO orderDAO;
	
	@Autowired
	OrderDetailDAO orderDetailDAO;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductDAO productDAO;
	
	@ModelAttribute("products")
	public Map<Integer, String> getAccounts() {
		Map<Integer, String> map = new HashMap<Integer, String>();
		List<Product> list = this.productDAO.findAll();
		for (Product product : list) {
			map.put(product.getId(), product.getName());
		}
		return map;
	}
	
	@GetMapping("/index/{id}")
	public String index(
			Model model,
			@PathVariable("id") Integer id
			) {
		List<OrderDetail> list = this.orderDetailDAO.findByOrderId(id);
		
		model.addAttribute("data", list);
		model.addAttribute("orderId", id);
		model.addAttribute("view", "admin/orderdetails/index.jsp");
		return "layout";
	}

	@GetMapping("/create")
	public String create(
				Model model,
				@PathVariable("id") Order order,
				@ModelAttribute("orderDetailModel") OrderDetailModel orderDetailModel
			) {
		
		model.addAttribute("order", order);
		model.addAttribute("view", "admin/orderdetails/create.jsp");
		
		return "layout";
	}
	
	@RequestMapping("/store")
	public String store(
				Model model,
				HttpSession session
			) {
		Account account = (Account) session.getAttribute("user");
		Order order = this.orderDAO.findByUserIdStatus(account.getId()).get(0);
		List<OrderDetail> listOrderDetails = this.orderDetailDAO.findByOrderId(order.getId());
		
		Collection<CartItemModel> cartItemModels = this.cartService.getCartItems();
		int quantity = 0;
		for (CartItemModel cartItemModel : cartItemModels) {
			int qty = 0;
			for (OrderDetail oDetail : listOrderDetails) {
				if (oDetail.getProduct().getId()==cartItemModel.getId()) {
					qty = cartItemModel.getQuantity() + oDetail.getQuantity();
					break;
				}
			}
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrder(order);
			orderDetail.setQuantity(qty + cartItemModel.getQuantity());
			orderDetail.setPrice(cartItemModel.getPrice());
			orderDetail.setProduct(this.productDAO.findById(cartItemModel.getId()).get());
			quantity = qty + cartItemModel.getQuantity();
			this.orderDetailDAO.save(orderDetail);
			Product product = this.productDAO.findById(cartItemModel.getId()).get();
			product.setQuantity(product.getQuantity() - quantity);
			this.productDAO.save(product);
		}
		
		order.setStatus(1);
		this.orderDAO.save(order);
		
		
		
		Date now = new Date();
		Order orderNew = new Order();
		orderNew.setAddress(account.getAddress());
		orderNew.setStatus(0);
		orderNew.setUser(account);
		orderNew.setCreateDate(now);
		
		this.orderDAO.save(orderNew);
		this.cartService.clear();
		
		return "redirect:/admin/orderdetails/index/" + order.getId();
	}
	
	@GetMapping("/edit/{id}")
	public String edit(
				@PathVariable("id") OrderDetail orderDetail,
				Model model
			) {
		OrderDetailModel orderDetailModel = new OrderDetailModel();
		orderDetailModel.setOrderId(orderDetail.getOrder().getId());
		orderDetailModel.setPrice(orderDetail.getPrice());
		orderDetailModel.setProductId(orderDetail.getProduct().getId());
		orderDetailModel.setQuantity(orderDetail.getQuantity());
		
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("orderDetailModel", orderDetailModel);
		
		model.addAttribute("view", "admin/orderdetails/edit.jsp");
		return "layout";
	}

	@PostMapping("/update/{id}/{order}")
	public String update(
				Model model,
				@PathVariable("id") Integer id,
				@PathVariable("order") Order order,
				@Valid @ModelAttribute("orderDetailModel") OrderDetailModel orderDetailModel,
				BindingResult result
			) {
		
		if (result.hasErrors()) {
			OrderDetail orderDetail = this.orderDetailDAO.findById(id).get();
			model.addAttribute("orderDetail", orderDetail);
			model.addAttribute("view", "admin/orderdetails/edit.jsp");
			return "layout";
		}else {
			
			OrderDetail orderDetail = this.orderDetailDAO.findById(id).get();
			orderDetail.setQuantity(orderDetailModel.getQuantity());
			orderDetail.setPrice(orderDetail.getProduct().getPrice()*orderDetailModel.getQuantity());
			System.out.println(orderDetail.getPrice());
			this.orderDetailDAO.save(orderDetail);
			
			return "redirect:/admin/orderdetails/index/" + order.getId();
		}
	}
	
	@RequestMapping("/delete/{id}/{order}")
	public String delete(
				@PathVariable("id") OrderDetail orderDetail,
				@PathVariable("order") Integer order
			) {
		this.orderDetailDAO.delete(orderDetail);
		return "redirect:/admin/orderdetails/index/" + order;
	}
	
}
