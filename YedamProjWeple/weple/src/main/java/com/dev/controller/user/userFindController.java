package com.dev.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.User;

public class userFindController implements Controller{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String nm = req.getParameter("name");
		//String ml = req.getParameter("email");
		//String id = req.getParameter("id");
		String job = req.getParameter("job");
		
		if(nm.isEmpty()) {
			req.setAttribute("error", "정보를 입력하세요");
			if(job.equals("search")) {
				Utils.forward(req, resp, "account/findId.tiles");
				System.out.println("1111");
			}
			return;
		}
		UserService service = UserService.getInstance();
		User vo = service.findingId(nm);
		if(vo==null) {
			req.setAttribute("result", "검색된 정보가 없습니다.");
		}
		req.setAttribute("user", service.findingId(nm));
		
		if(job.equals("search")) {
			System.out.println("2222");
			Utils.forward(req, resp, "account/findIdAfter.tiles");
		}
		
	}

}
