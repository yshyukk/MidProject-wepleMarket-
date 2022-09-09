package com.dev.controller.qna;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.qna.QnaService;
import com.dev.vo.Board;

public class ViewContentController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		QnaService qService = QnaService.getInstance();
		
		String writer = req.getParameter("writer");
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		Board vo = new Board();
		
		vo.setWriter(writer);
		vo.setBno(bno);
		
		List<Board> qnaContextList = qService.viewContent(vo);
		
		req.setAttribute("qnaContent", qnaContextList);
		
		Utils.forward(req, resp, "qnaBoard/qnaContext.jsp");
	}

}
