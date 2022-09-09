package com.dev.controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.cart.CartService;
import com.dev.service.product.ProductService;
import com.dev.vo.Buy;
import com.dev.vo.Cart;
import com.dev.vo.Product;

public class CartInsertController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/json;charset=utf-8");
	
		CartService service = CartService.getInstance();
//		1. session에서 req값 받아와서 userId 셋팅
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		
//		2. insert컨트롤러에서 req값 받아와서 prod_id, isShare여부, amount 등 변수로 셋팅
		Product product = (Product) session.getAttribute("prodVO");
		int prodId = product.getProdId();
		int buyAmount = Integer.parseInt(req.getParameter("amount"));
		int isShare = Integer.parseInt(req.getParameter("isShare"));

//		3-1. 장바구니에 동일한 제품이 있는지 체크
		Cart isExist = service.showOneProd(userId, prodId, isShare);
		
		
		
//		3-2. 없으면 새로 추가
		
		Buy cartProduct;
		if (isExist == null) {
			cartProduct = new Buy();
			cartProduct.setUserId(userId);
			cartProduct.setProdId(prodId);
			cartProduct.setBuyAmount(buyAmount);
			cartProduct.setIsShare(isShare);
			service.insertIntoCart(cartProduct);
		}

		else {
			int prevAmount = isExist.getBuyAmount();
			buyAmount += prevAmount;
			service.updateCart(prodId, buyAmount, userId, isShare);
		}
		
		
		resp.getWriter().print("success");
		

	}

}
