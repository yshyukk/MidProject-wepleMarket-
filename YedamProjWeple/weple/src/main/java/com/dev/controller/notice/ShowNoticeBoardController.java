package com.dev.controller.notice;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.notice.NoticeService;
import com.dev.vo.Board;

public class ShowNoticeBoardController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		NoticeService service = NoticeService.getInstance();
		// 전체리스트 보여주기
		List<Board> notices = service.showAllNotice();
		
		
		req.setAttribute("notices", notices);
		Utils.forward(req, resp, "main/noticeBoardMain.tiles");
		
	}

}
