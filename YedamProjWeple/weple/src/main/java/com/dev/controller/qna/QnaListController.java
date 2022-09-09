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

public class QnaListController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		//int prodId = (int)session.getAttribute("prodId");
		int prodId = 10020;
		
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setAmount(Integer.parseInt(amount));
		
		QnaService qService = QnaService.getInstance();
		
		List<Board> qListpaging = qService.qnaListPaging(cri);
		
		if (session.getAttribute("AllQnaList") == null) {
			session.setAttribute("AllQnaList", qListpaging);
		} else {
			session.removeAttribute("AllQnaList");
			session.setAttribute("AllQnaList", qListpaging);
		}
		
		List<Board> totalQnaList = qService.qnaList(prodId);
		
		int total = totalQnaList.size();
		
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "qnaBoard/qnaList.jsp");
	}
	

}
