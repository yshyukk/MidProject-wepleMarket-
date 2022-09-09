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

public class NewerController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession();
		ProductService service = ProductService.getInstance();
		
		List<Product> list = service.getNewProd();
		
		if(session.getAttribute("newProdList") != null) {
			session.removeAttribute("newProdList");
			session.setAttribute("newProdList", list);
		} else {
			session.setAttribute("newProdList", list);
		}
		
		Utils.forward(req, resp, "main/newer.tiles");
	}

}
