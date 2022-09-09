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

public class ReviewInfoController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ReviewService service = ReviewService.getInstance();
		
		List<ReviewInfo> infoList = service.reviewInfo();
		
		req.setAttribute("list", infoList);
		
		Utils.forward(req, resp, "reviewBoard/showReview.jsp");
		
		/*req.setCharacterEncoding("utf-8");
		
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		String prodName = req.getParameter("prodName");
		String boardContent = req.getParameter("boardContent");
		String writer = req.getParameter("writer");
		String writeDate = req.getParameter("writeDate");
		
		ReviewInfo rvo = new ReviewInfo();
		rvo.setProdId(prodId);
		rvo.setProdName(prodName);
		rvo.setBoardContent(boardContent);
		rvo.setWriter(writer);
		rvo.setWriteDate(writeDate);
		
		service.reviewInfo(rvo);
		
		RequestDispatcher rd = req.getRequestDispatcher("board/boardInsert.tiles");
		rd.forward(req, resp);*/

	}

}
