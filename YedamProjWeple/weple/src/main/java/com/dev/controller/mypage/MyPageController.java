package com.dev.controller.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.User;

public class MyPageController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		User vo = (User) session.getAttribute("userVO");
		UserService service = UserService.getInstance();
		
		// 회원 등급 업데이트
		User set = service.setUserGrade(vo);
		
		// 세션 수정
		session.removeAttribute("userVO");
		session.setAttribute("userVO", set);
		
		
		RequestDispatcher rd = req.getRequestDispatcher("user/mypage.tiles");
		rd.forward(req, resp);

	}

}
