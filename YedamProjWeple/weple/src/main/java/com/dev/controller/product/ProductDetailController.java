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
import com.dev.service.qna.QnaService;
import com.dev.service.review.ReviewService;
import com.dev.vo.Board;
import com.dev.vo.Product;
import com.dev.vo.ReviewInfo;

public class ProductDetailController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		ProductService pservice = ProductService.getInstance();
		ReviewService rservice = ReviewService.getInstance();
		QnaService qservice = QnaService.getInstance();
		
		Product prod = pservice.selectOneProd(prodId);
		List<String> regions = pservice.getSalesRegions(prodId);
		
		List<ReviewInfo> reviewList = rservice.reviewList(prodId);
		
		List<Board> qnaList = qservice.getProdQnAList(prodId);
		
		HttpSession session = req.getSession();
		
		if(session.getAttribute("prodVO") != null) {
			session.removeAttribute("prodVO");
			session.setAttribute("prodVO", prod);
		} else {
			session.setAttribute("prodVO", prod);
		}
		
		if(session.getAttribute("prodId") != null) {
			session.removeAttribute("prodId");
			session.setAttribute("prodId", prod.getProdId());
		} else {
			session.setAttribute("prodId", prod.getProdId());
		}
		
		if(session.getAttribute("regions") != null) {
			session.removeAttribute("regions");
			session.setAttribute("regions", regions);
		} else {
			session.setAttribute("regions", regions);
		}
		
		if(session.getAttribute("reviewList") != null) {
			session.removeAttribute("reviewList");
			session.setAttribute("reviewList", reviewList);
		} else {
			session.setAttribute("reviewList", reviewList);
		}
		
		if(session.getAttribute("qnaList") != null) {
			session.removeAttribute("qnaList");
			session.setAttribute("qnaList", qnaList);
		} else {
			session.setAttribute("qnaList", qnaList);
		}
		
		
		
		Utils.forward(req, resp, "main/productDetail.tiles");
	}

}
