package com.dev.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.notice.NoticeService;
import com.dev.vo.Comments;

public class UpdateCommentsController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
	
		int repleNum = Integer.parseInt(req.getParameter("repleNum"));
		String updateComment = req.getParameter("updateComment");
		
		
		NoticeService noticeService = NoticeService.getInstance();
		Comments comments = new Comments();
		comments.setRepleNum(repleNum);
		comments.setReple(updateComment);
		
		noticeService.updateComments(comments);
		
		resp.getWriter().print(updateComment);
		
	}

}
