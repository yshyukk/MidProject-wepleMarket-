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
import com.dev.vo.Criteria;
import com.dev.vo.Page;
import com.dev.vo.ReviewInfo;

public class ReviewListPagingController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		int prodId = (int)session.getAttribute("prodId");
		
		Criteria cri = new Criteria();
		ReviewInfo rvo = new ReviewInfo();
		
		
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setAmount(Integer.parseInt(amount));
		
		ReviewService service = ReviewService.getInstance();
		
		List<ReviewInfo> listPage = service.getListPaging(cri, prodId);
		
		if (session.getAttribute("AllPagingList") == null) {
			session.setAttribute("AllPagingList", listPage);
		} else {
			session.removeAttribute("AllPagingList");
			session.setAttribute("AllPagingList", listPage);
		}
		
		List<ReviewInfo> totalAllList = service.reviewList(prodId);
		
		System.out.println(totalAllList);
		
		int total = totalAllList.size();
		
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "reviewBoard/reviewList.jsp");

	}

}
