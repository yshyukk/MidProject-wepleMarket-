package com.dev.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dev.controller.Controller;
import com.dev.service.notice.NoticeService;
import com.dev.vo.Comments;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class ShowCommentsController implements Controller {

	@SuppressWarnings("unchecked")
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		NoticeService noticeService = NoticeService.getInstance();
		int bno = Integer.parseInt(req.getParameter("bno"));
		System.out.println(bno);
		
		// userId는 세션에 있고
		// writer는 notice에 있다 -> notice.writer eql userId인 경우에 댓글 수정, 삭제 버튼이 보이도록
		
		// 글 번호(bno)에 맞는 댓글 조회해서 리스트에 담아서 전달해야한다.
		List<Comments> commentList = noticeService.selectComments(bno);
		
		for(Comments comment : commentList) {
			System.out.println(comment);
		}
		System.out.println("sdfasldf");
		JSONArray commentJArray = new JSONArray();
		for (int i = 0; i < commentList.size(); i++) {
			JSONObject commentJObject = new JSONObject();
			commentJObject.put("bno", commentList.get(i).getBno());
			commentJObject.put("repleNum", commentList.get(i).getRepleNum());
			commentJObject.put("userId", commentList.get(i).getUserId());
			commentJObject.put("reple", commentList.get(i).getReple());
			commentJObject.put("writeDate", commentList.get(i).getWriteDate());
			
			commentJArray.add(commentJObject);
		}
		
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(commentJArray));
		} catch(IOException e) {
			e.printStackTrace();
		}

	}

}
