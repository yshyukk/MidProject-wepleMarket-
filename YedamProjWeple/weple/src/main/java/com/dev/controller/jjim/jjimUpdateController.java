package com.dev.controller.jjim;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.jjim.JjimService;

public class jjimUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = req.getSession(false);
		String userId = (String) session.getAttribute("userId");
		
		if (userId == null) {
			resp.getWriter().print("fail");
		} else {
			int isChk = Integer.parseInt(req.getParameter("myjjim")) ;
			JjimService service = JjimService.getInstance();
			int prodId = Integer.parseInt(req.getParameter("prodId")) ;
			if (isChk == 1) {
				service.removejjim(prodId, userId);
			} else {
				service.insertjjim(prodId, userId);
			}
			resp.getWriter().print("true");
		}
	}

}
