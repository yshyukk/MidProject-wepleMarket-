package com.dev.service.notice;

import java.util.List;

import com.dev.dao.NoticeDAO;
import com.dev.vo.Board;
import com.dev.vo.Comments;

public class NoticeService {
	// 싱글톤
	private static NoticeService noticeService = null;
	NoticeDAO nDAO = new NoticeDAO();
	
	private NoticeService() {
		
	}
	
	public static NoticeService getInstance() {
		if(noticeService == null) {
			noticeService = new NoticeService();
		}
		return noticeService;
	}
	
	// 공지사항 게시판 전체 select해오는 기능
	public List<Board> showAllNotice() {
		return nDAO.showAllNotice();
	}
	
	// 글 클릭했을때 각 컨텐츠 보여주는 기능
	public Board showOneNotice(int bno) {
		return nDAO.showOneNotice(bno);
	}
	
	// 글 클릭했을 때 조회수 업로드 하는 기능
	public void updateCNT(int bno, int cnt) {
		nDAO.updateCNT(bno, cnt);
	}
	
	// 글 번호(bno)에 맞는 댓글 조회해서 리스트에 담아서 전달해야한다.
	public List<Comments> selectComments(int bno) {
		return nDAO.selectComments(bno);
	}
	
	// 댓글 수정
	public void updateComments(Comments comments) {
		nDAO.updateComments(comments);
	}
	
	// 댓글 삭제
	public void deleteComments(int bno, int repleNum) {
		nDAO.deleteComments(bno, repleNum);
	}
	
	// 댓글 달기
	public void insertComments(Comments comments) {
		nDAO.insertComments(comments);
	}

	public int getCommentNum(String userId) {
		return nDAO.getCommentNum(userId);
	}
}
