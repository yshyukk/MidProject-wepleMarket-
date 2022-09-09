package com.dev.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.Addr;

public class addressListFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");

		UserService service = UserService.getInstance();

		List<Addr> list = service.addressList(userId);

		for (Addr addr : list) {
			System.out.println(addr);
		}
		req.setAttribute("list", list);

		List<Addr> list2 = service.addressListD(userId);

		for (Addr addr : list2) {
			System.out.println(addr);
		}
		req.setAttribute("list2", list2);

		Utils.forward(req, resp, "user/addressUpdate.tiles");
	}

}
