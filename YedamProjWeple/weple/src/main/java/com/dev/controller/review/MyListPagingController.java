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

public class MyListPagingController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String writer = (String) session.getAttribute("userId");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
			
		Criteria cri = new Criteria();
		
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setAmount(Integer.parseInt(amount));
	
		ReviewService service = ReviewService.getInstance();
		
		List<ReviewInfo> myPagingList = service.getMyListPaging(cri, writer);
		
		if (session.getAttribute("pagingList") != null) {
			session.removeAttribute("pagingList");
			session.setAttribute("pagingList", myPagingList);
		} else {
			session.setAttribute("pagingList", myPagingList);
		}		
		
		//페이지 no amount구해서 정보 넘겨줌
		List<ReviewInfo> totalMyList = service.myReviewList(writer);		
		for (ReviewInfo info : totalMyList) {
			System.out.println(info);
		}
		
		int total = totalMyList.size();
		
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "user/myList.tiles");
	}

}
