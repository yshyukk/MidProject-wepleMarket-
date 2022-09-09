package com.dev.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.User;

public class userDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserService service = UserService.getInstance();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("password");
		
		User vo = new User();
		vo.setUserId(id);
		vo.setUserPwd(pw);
		
		service.dropUser(id, pw);
		
		req.setAttribute("user", vo);
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		Utils.forward(req, resp, "main.do");
	
	}

}
