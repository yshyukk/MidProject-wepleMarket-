package com.dev.controller.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.qna.QnaService;
import com.dev.vo.Board;

public class DeleteQnaController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		QnaService qService = QnaService.getInstance();

		Board vo = new Board();

		HttpSession session = req.getSession();

		int bno = Integer.parseInt(req.getParameter("bno"));
		// String writer = (String) session.getAttribute("userId");
		String writer = "test4";

		vo.setBno(bno);
		vo.setWriter(writer);

		boolean isQnaDel = qService.deleteQna(vo);
		System.out.println("얘->" + isQnaDel);

		if (isQnaDel) {
			resp.getWriter().print("true");
		} else {
			resp.getWriter().print("false");
		}

	}

}
