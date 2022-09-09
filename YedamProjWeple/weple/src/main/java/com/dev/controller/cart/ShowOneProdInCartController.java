package com.dev.controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.cart.CartService;
import com.dev.vo.Buy;
import com.dev.vo.Cart;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ShowOneProdInCartController implements Controller {


	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		CartService service = CartService.getInstance();
		// CartInsertController에서 넘어온다.
		Buy cartProduct = (Buy) req.getAttribute("cartProduct");
		String clickCart = (String) req.getAttribute("clickCart");
		
		String userId = cartProduct.getUserId();
		int prodId = cartProduct.getProdId();
		
//		Cart prodOne = service.showOneProd(userId, prodId);
		
		// 출력할 때 필요한 것은 prodName, prodAmount, totalPrice, isShare
		// Cart넘겨서 나중에 cartView에서 출력하면 된다.
//		
//		JSONObject jObject = new JSONObject();
//		jObject.put("prodId", prodOne.getProdId());
//		jObject.put("prodName", prodOne.getProdName());
//		jObject.put("isShare", prodOne.getIsShare());
//		jObject.put("prodAmount", prodOne.getBuyAmount());
//		jObject.put("totalPrice", prodOne.getTotalPrice());
//		
//		Gson gson = new GsonBuilder().create();
//		try {
//			resp.getWriter().print(gson.toJson(jObject));
//		} catch(IOException e) {
//			e.printStackTrace();
//		}
		
		// json, gson 형태로 데이터 변환,
		
		
		

	}

}
