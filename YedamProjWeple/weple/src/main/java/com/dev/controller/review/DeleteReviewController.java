package com.dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.buy.BuyService;
import com.dev.service.review.ReviewService;
import com.dev.vo.Board;
import com.dev.vo.ReviewInfo;

public class DeleteReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ReviewService service = ReviewService.getInstance();
		BuyService bservice = BuyService.getInstance();
		ReviewInfo rvo = new ReviewInfo();

		HttpSession session = req.getSession();

		int bno = Integer.parseInt(req.getParameter("bno"));
		String writer = (String) session.getAttribute("userId");
		
		Board info = service.getReviewOrderNum(bno);
		bservice.updateIsReview(info.getOrderNum(), info.getProdId());

		rvo.setBno(bno);
		rvo.setWriter(writer);

		boolean isDel = service.deleteReview(rvo);
		System.out.println("얘->" + isDel);

		if (isDel == true) {

			// req.setAttribute("reviewDeleteList", rvo);

			resp.getWriter().print("true");
		} else {
			resp.getWriter().print("false");
		}

	}
}
