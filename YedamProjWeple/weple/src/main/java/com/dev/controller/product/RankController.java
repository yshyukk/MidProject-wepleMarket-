package com.dev.controller.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.product.ProductService;
import com.dev.vo.Product;

public class RankController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ProductService service = ProductService.getInstance();
		
		List<Product> rankProdList = service.getRankProd();
		
		if(session.getAttribute("rankProdList") != null) {
			session.removeAttribute("rankProdList");
			session.setAttribute("rankProdList", rankProdList);
		} else {
			session.setAttribute("rankProdList", rankProdList);
		}
		
		Utils.forward(req, resp, "main/rank.tiles");
	}

}
