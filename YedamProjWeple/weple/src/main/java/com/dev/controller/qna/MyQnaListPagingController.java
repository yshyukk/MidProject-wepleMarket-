package com.dev.controller.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.qna.QnaService;
import com.dev.vo.Board;
import com.dev.vo.Criteria;
import com.dev.vo.Page;

public class MyQnaListPagingController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		String writer = (String)session.getAttribute("userId");
		
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setAmount(Integer.parseInt(amount));
		
		System.out.println(writer);
		System.out.println(pageNum);
		System.out.println(amount);
		
		QnaService qService = QnaService.getInstance();
		List<Board> qMyListpaging = qService.qnaMyListPaging(cri, writer);
		
		if (session.getAttribute("allMyQnaList") == null) {
			session.setAttribute("allMyQnaList", qMyListpaging);
		} else {
			session.removeAttribute("allMyQnaList");
			session.setAttribute("allMyQnaList", qMyListpaging);
		}
		
		for(Board board : qMyListpaging) {
		   System.out.println(board);
		}
		
		List<Board> totalMyQnaList = qService.qMyList(writer);
		
		int total = totalMyQnaList.size();
		
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "user/qnaMyList.tiles");
	}
}
