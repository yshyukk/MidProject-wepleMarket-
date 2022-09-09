package com.dev.controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.review.ReviewService;
import com.dev.vo.ReviewInfo;

public class InsertResultListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ReviewService service = ReviewService.getInstance();
		
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		
		List<ReviewInfo> reviewList = service.reviewList(prodId);
		
		req.setAttribute("list", reviewList);
		
		Utils.forward(req, resp, "reviewBoard/reviewList.jsp");
	}
	

}
