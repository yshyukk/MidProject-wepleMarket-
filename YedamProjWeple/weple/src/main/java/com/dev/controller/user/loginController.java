package com.dev.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.dao.UserDAO;
import com.dev.service.user.UserService;
import com.dev.vo.User;

public class loginController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String id = req.getParameter("userId");
		String pw = req.getParameter("userPw");
		
		UserDAO dao = new UserDAO();
		int loginResult = dao.login(id, pw);
		
		UserService service = UserService.getInstance();
		User userVO = service.getUserInfo(id);
		
		if (loginResult == 1) {
			req.setAttribute("loginResult", loginResult);
			HttpSession session = req.getSession();
			
			if(session.getAttribute("userId") != null ) {
				session.removeAttribute("userId");
				session.removeAttribute("userVO");
				session.setAttribute("userId", id);
				session.setAttribute("userVO", userVO);
			} else {
				session.setAttribute("userId", id);
				session.setAttribute("userVO", userVO);
			}
			
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");//메인으로 (로그인성공) 경로경로경로
			rd.forward(req, resp);
		} else {
			req.setAttribute("loginResult", loginResult);
			RequestDispatcher rd = req.getRequestDispatcher("account/login.tiles");//로그인경로 그대로(로그인실패 경고창)
			rd.forward(req, resp);
		}
		
	}

}
