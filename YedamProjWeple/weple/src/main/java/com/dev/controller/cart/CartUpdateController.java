package com.dev.controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.cart.CartService;
import com.dev.service.product.ProductService;

public class CartUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		
		//
		
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		int prodAmount = Integer.parseInt(req.getParameter("prodAmount"));
		int isShare = Integer.parseInt(req.getParameter("isShare"));
		String userId = (String) session.getAttribute("userId");
		System.out.println("" + prodId + prodAmount + isShare + userId);
		
		CartService cartService = CartService.getInstance();
		
		boolean result = cartService.updateCart(prodId, prodAmount, userId, isShare);
		
		System.out.println(result);
		
		resp.getWriter().print(result);
	
	}

}
