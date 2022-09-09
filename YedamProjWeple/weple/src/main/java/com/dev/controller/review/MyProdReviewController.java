package com.dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.review.ReviewService;
import com.dev.vo.Board;

public class MyProdReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderNum = Integer.parseInt(req.getParameter("orderNum"));
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		
		ReviewService service = ReviewService.getInstance();
		Board bo = service.selectProdReview(orderNum, prodId);
		
		req.setAttribute("thisBD", bo);
		
		Utils.forward(req, resp, "user/myProdReview.tiles");
	}

}
