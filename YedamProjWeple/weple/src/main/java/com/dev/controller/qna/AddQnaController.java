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

public class AddQnaController implements Controller {
	//Form으로 prodId값과 writer값을 넘겨주기
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		//String writer = (String)session.getAttribute("writer");
		String writer = "test5";
		int prodId = (int)session.getAttribute("prodId");
		
		if(session.getAttribute("writer") != null) {
			session.removeAttribute("writer");
			session.setAttribute("writer", writer);
		}else {
			session.setAttribute("writer", writer);
		}
		if(session.getAttribute("prodId") != null) {
			session.removeAttribute("prodId");
			session.setAttribute("prodId", prodId);
		}else {
			session.setAttribute("prodId", prodId);
		}

		//prodId와 writer를 Form으로 보내줌
		Utils.forward(req, resp, "qnaBoard/addQnaForm.jsp");
	}

}
