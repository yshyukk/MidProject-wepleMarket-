package com.dev.controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.review.ReviewService;
import com.dev.vo.ReviewInfo;

public class MyListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ReviewService service = ReviewService.getInstance();
		HttpSession session = req.getSession();
		
		String writer = (String)session.getAttribute("userId");
		
		List<ReviewInfo> myList = service.myReviewList(writer);

		if(session.getAttribute("myRevList") == null) {
			session.setAttribute("myRevList", myList);
		} else {
			session.removeAttribute("myRevList");
			session.setAttribute("myRevList", myList);
		}
		
		//MyListController() -> service.myReviewList() 에서 가져온 값.
		req.setAttribute("myReviewList", myList);
		
		Utils.forward(req, resp, "reviewBoard/myList.jsp");
	}

}
