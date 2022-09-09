package com.dev.controller.notice;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.controller.Controller;
import com.dev.service.notice.NoticeService;
import com.google.gson.JsonParser;

public class DeleteCommentsController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		int repleNum = Integer.parseInt(req.getParameter("repleNum"));
		int bno = Integer.parseInt(req.getParameter("bno"));

		
		NoticeService noticeService = NoticeService.getInstance();
		noticeService.deleteComments(bno, repleNum);

	}

}
