package com.dev.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.Addr;

public class addressOutController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserService service = UserService.getInstance();
		
		String adn = req.getParameter("addr_name");
		Addr vo = new Addr();
		vo.setAddrName(adn);
		System.out.println(adn);
		
		service.outAddress(vo);
		
		
		req.setAttribute("user", vo);
		
		
		Utils.forward(req, resp, "addressUpdateForm.do");		
	}

}
