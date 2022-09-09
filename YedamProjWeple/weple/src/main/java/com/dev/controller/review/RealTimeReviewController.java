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
import com.dev.vo.ProdReview;

public class RealTimeReviewController implements Controller {
	// 실시간 리뷰
	// 별점이 높으면서 최신순으로 정렬
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setAmount(Integer.parseInt(amount));
		
		ReviewService service = ReviewService.getInstance();
		
		List<ProdReview> realTimePagingList = service.rtPagingList(cri);
		
		if(session.getAttribute("realTimePagingList") != null) {
			session.removeAttribute("realTimePagingList");
			session.setAttribute("realTimePagingList", realTimePagingList);
		} else {
			session.setAttribute("realTimePagingList", realTimePagingList);
		}
		
		for (ProdReview rvw : realTimePagingList) {
			System.out.println(rvw);
		}
		
		List<ProdReview> list = service.realTimeReviewList();
				
		int total = list.size();
		
		System.out.println(total);
		
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "main/realTimeReviewList.tiles");
	}

}
