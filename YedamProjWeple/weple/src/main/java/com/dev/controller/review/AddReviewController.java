package com.dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.vo.ReviewInfo;

public class AddReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
				
		int pId = Integer.parseInt(req.getParameter("prodId"));
		int orderNum = Integer.parseInt(req.getParameter("orderNum"));
		
		req.setAttribute("prodId", pId);
		req.setAttribute("orderNum", orderNum);
		
		
		Utils.forward(req, resp, "user/reviewForm.tiles");
		
	}

}
