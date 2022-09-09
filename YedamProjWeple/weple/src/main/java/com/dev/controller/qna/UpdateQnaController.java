package com.dev.controller.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.qna.QnaService;
import com.dev.vo.Board;

public class UpdateQnaController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QnaService qService = QnaService.getInstance();
		
		HttpSession session = req.getSession();
		
		String writer = req.getParameter("writer");	
		String boardContent = req.getParameter("boardContent");
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		String title = req.getParameter("title");
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		Board vo = new Board();
		
		vo.setWriter(writer);;
		vo.setBoardContent(boardContent);
		vo.setProdId(prodId);
		vo.setTitle(title);
		vo.setBno(bno);
		
		qService.updateQna(vo);
		
		req.setAttribute("UpdateQna", vo);
		
		Utils.forward(req, resp, "qnaBoard/updateResult.jsp");
		
	}

}
