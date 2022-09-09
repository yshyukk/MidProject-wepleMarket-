package com.dev.controller.order;

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

public class ShowPayFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		CartService service = CartService.getInstance();
		String userId = (String) session.getAttribute("userId");
		
		int totalPrice = 0;
		int totalProdAmount = 0;
		int totalBuyAmount = 0;
		
		List<Cart> list = service.showCart(userId);
		if(session.getAttribute("cartList") != null) {
			session.removeAttribute("cartList");
			session.setAttribute("cartList", list);
		} else {
			session.setAttribute("cartList", list);
		}
		
		for(Cart cart : list) {
			totalPrice += cart.getTotalPrice();
			totalBuyAmount += cart.getBuyAmount();
			totalProdAmount += 1;
		}
		
		req.setAttribute("totalPrice", totalPrice);
		req.setAttribute("totalBuyAmount", totalBuyAmount);
		req.setAttribute("totalProdAmount", totalProdAmount);
		
		Utils.forward(req, resp, "user/payForm.tiles"); //커밋돼라
	}

}
