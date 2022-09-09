package com.dev.controller.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.notice.NoticeService;
import com.dev.vo.Board;
import com.dev.vo.Comments;

public class ShowNoticeDetailController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// bno를 받아온다
		int bno = Integer.parseInt(req.getParameter("bno"));
		NoticeService noticeService = NoticeService.getInstance();
		
		// 조회수 업로드
		// 클릭한 board를 보여주는 메소드를 실행
		Board notice = noticeService.showOneNotice(bno);
		// 그 board의 cnt를 받아와서
		int cnt = notice.getCNT();
		// cnt+1로 업로드한다.
		noticeService.updateCNT(bno, cnt);
		
	
		
		req.setAttribute("notice", notice);
		Utils.forward(req, resp, "main/noticeBoardDetail.tiles");
	}

}
