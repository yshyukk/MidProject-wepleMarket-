package com.dev.controller.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.product.ProductService;
import com.dev.vo.Product;

public class CatgDispController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int catgId = Integer.parseInt(req.getParameter("catgId")) ;
		ProductService service = ProductService.getInstance();
		
		List<Integer> catgIdList = service.getCatgId(3, 2, catgId);
		
		Map<String, String> catgIdMap = new HashMap<>();
		try {
			catgIdMap = service.getCatgName();
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		
		List<Product> prodNameList = new ArrayList<>();
		
		for(int id : catgIdList) {
			Product prod = new Product();
			prod.setProdId(id);
			prod.setProdName(catgIdMap.get(String.valueOf(id)));
			prodNameList.add(prod);
		}
		
		if(session.getAttribute("catgStrList") != null) {
			session.removeAttribute("catgStrList");
			session.setAttribute("catgStrList", prodNameList);
		} else {
			session.setAttribute("catgStrList", prodNameList);
		}
		
		Utils.forward(req, resp, "main/catgDisp.tiles");
		
	}

}
