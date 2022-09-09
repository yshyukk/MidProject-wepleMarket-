package com.dev.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.cart.CartService;
import com.dev.vo.Cart;

public class CartShowController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		CartService service = CartService.getInstance();
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		
		List<Cart> cartList = service.showCart(userId);
		
		req.setAttribute("cartList", cartList);
		Utils.forward(req, resp, "cart/cartView.tiles");
	}

}
