package com.dev.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.product.ProductService;
import com.dev.vo.Product;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CatgProdListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json; charset=utf-8;");
		// json형태로 반환.
		
		HttpSession session = req.getSession(false);
		
		int where = Integer.parseInt(req.getParameter("catgLevel"));
		int id = Integer.parseInt(req.getParameter("catgId"));
		String userId = (String) session.getAttribute("userId");
		
		ProductService service = ProductService.getInstance();
		List<Product> prodList = service.getProdUsingCatgId(where, id, userId);
		
		for(Product pr : prodList) {
			if(pr.getAvgStar() != 99.9) {
				System.out.println(pr.getAvgStar());
			}
		}
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(prodList));
	}

}
