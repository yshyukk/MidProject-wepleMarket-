package com.dev.controller.main;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.product.ProductService;
import com.dev.vo.Product;

public class MainController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		ProductService ps = ProductService.getInstance();
		
		List<Product> shareProdList = ps.getSharedProd();
		
		Set<Product> randomProdList = ps.getRandomProd();
		
		if(session.getAttribute("shareProdList") != null) {
			session.removeAttribute("shareProdList");
			session.setAttribute("shareProdList", shareProdList);
		} else {
			session.setAttribute("shareProdList", shareProdList);
		}
		
		if(session.getAttribute("randomProdList") != null) {
			session.removeAttribute("randomProdList");
			session.setAttribute("randomProdList", randomProdList);
		} else {
			session.setAttribute("randomProdList", randomProdList);
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("main/main.tiles");
		rd.forward(req, resp);

	}

}
