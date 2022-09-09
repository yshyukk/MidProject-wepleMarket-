package com.dev.controller.qna;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.qna.QnaService;
import com.dev.vo.Board;
import com.dev.vo.Product;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class InsertQnaController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json; charset=utf-8;");
		
		HttpSession session = req.getSession();
		
		Product prod = (Product) session.getAttribute("prodVO");
		int prodId = prod.getProdId();
		String userId = (String) session.getAttribute("userId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		
		// 등록
		Board vo = new Board();
		vo.setWriter(userId);
		vo.setBoardContent(content);
		vo.setProdId(prodId);
		vo.setTitle(title);
		
		QnaService service = QnaService.getInstance();
		
		boolean result = service.addQna(vo);
		
		
		// 작성일 가져오기
		Board newvo = service.getRecentReview(userId, prodId);
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(newvo));
	}
}
