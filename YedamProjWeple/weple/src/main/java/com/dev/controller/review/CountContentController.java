package com.dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.review.ReviewService;
import com.dev.vo.ReviewInfo;

public class CountContentController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		ReviewService service = ReviewService.getInstance();
		
		int prodId = (int)session.getAttribute("prodId");
		
		double star = service.contentCount(prodId);
	
		req.setAttribute("star", Math.round(star*100));
		
		Utils.forward(req, resp, "reviewBoard/avgStar.jsp");
	}

}
