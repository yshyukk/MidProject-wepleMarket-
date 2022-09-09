package com.dev.controller.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.List;
import java.util.List;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.valves.JsonErrorReportValve;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dev.vo.Cart;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.stream.MalformedJsonException;
import com.dev.vo.Cart;
import com.dev.vo.Cart;
import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.cart.CartService;
import com.dev.vo.Buy;
import com.dev.vo.Cart;

public class showAllProdInCartController implements Controller {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		CartService service = CartService.getInstance();
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId"); 
		
		// 출력할 때 필요한 것은 prodName, prodAmount, totalPrice, isShare
		// Cart넘겨서 나중에 cartView에서 출력하면 된다.
		
		List<Cart> cartList = service.showCart(userId);
		
		// cartList 세선에 넣기
		if(session.getAttribute("cartList") != null) {
			session.removeAttribute("cartList");
			session.setAttribute("cartList", cartList);
		} else {
			session.setAttribute("cartList", cartList);
		}
		
		JSONArray jArray = new JSONArray();
		for (int i = 0; i < cartList.size(); i++) {
			JSONObject jObject = new JSONObject();
			jObject.put("prodId", cartList.get(i).getProdId());
			jObject.put("prodName", cartList.get(i).getProdName());
			jObject.put("isShare", cartList.get(i).getIsShare());
			jObject.put("prodAmount", cartList.get(i).getBuyAmount());
			jObject.put("totalPrice", cartList.get(i).getTotalPrice());
			jObject.put("imgUrl", cartList.get(i).getImgUrl());
			jObject.put("prodPrice", cartList.get(i).getProdPrice());
			jArray.add(jObject);
		}
		
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(jArray));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}

}
