                                                                       package com.dev.controller.addr;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.addr.AddrService;
import com.dev.vo.Addr;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ShowDefaultAddrController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		AddrService addrService = AddrService.getInstance();
		
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		
		Addr defaultAddr = addrService.selectDefault(userId);
		
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(defaultAddr));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}

}
