package com.dev.controller.notice;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.notice.NoticeService;
import com.dev.vo.Comments;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CreateCommentsController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json; charset=utf-8;");
		
		System.out.println(req.getParameter("createComment"));
		System.out.println(req.getParameter("bno"));
		
		// 작성내용
		String createComment = req.getParameter("createComment");
		// 게시글번호
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		// userId
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		
		// 현재 날짜
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
		String date = simpleDateFormat.format(new Date());
		 
		
		Comments comments = new Comments();
		comments.setBno(bno);
		comments.setReple(createComment);
		comments.setUserId(userId);
		comments.setWriteDate(date);
		
		NoticeService noticeService = NoticeService.getInstance();
		
		// bno, userId, reple, writeDate
		noticeService.insertComments(comments);
		
		
		// reple_num 가져오기
		int reple_num = noticeService.getCommentNum(userId);
		comments.setRepleNum(reple_num);
		
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(comments));
	}

}
