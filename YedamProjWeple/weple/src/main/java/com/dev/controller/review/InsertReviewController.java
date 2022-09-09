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

public class InsertReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewService service = ReviewService.getInstance();
		
		HttpSession session = req.getSession();
		
		String writer = (String) session.getAttribute("userId");
		String boardContent = req.getParameter("boardContent");
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		int rating = Integer.parseInt(req.getParameter("rating"));
		int orderNum = Integer.parseInt(req.getParameter("orderNum"));
		
		ReviewInfo rvo = new ReviewInfo();
		
		rvo.setWriter(writer);
		rvo.setBoardContent(boardContent);
		rvo.setProdId(prodId);
		rvo.setRating(rating);	
		
		service.addReivew(rvo, orderNum);
		
		req.setAttribute("insertList", rvo);
		req.setAttribute("orderNum", orderNum);
		
		Utils.forward(req, resp, "user/insertResult.tiles");	
	}
}
