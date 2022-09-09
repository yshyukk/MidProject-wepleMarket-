package com.dev.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;

public class SendRepleNumController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int repleNum = Integer.parseInt(req.getParameter("repleNum"));
		
		req.setAttribute("repleNum", repleNum);
		Utils.forward(req, resp, "main/updateCommentsForm.tiles");

	}

}
