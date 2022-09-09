package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.Board;
import com.dev.vo.Comments;

public class NoticeDAO extends DAO {
	
	// 필요한 기능
	
	// 공지사항 게시판 전체 select해오는 기능
	public List<Board> showAllNotice() {
		List<Board> boardList = new ArrayList<>();
		try {
			connect();
			String sql = "select board_type, title, board_content, writer, write_date, bno, cnt from boards where board_type = 1 order by write_date desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoardType(rs.getInt("board_type"));
				board.setTitle(rs.getString("title"));
				board.setBoardContent(rs.getString("board_content"));
				board.setWriter(rs.getString("writer"));
				board.setWriteDate(rs.getString("write_date"));
				board.setBno(rs.getInt("bno"));
				board.setCNT(rs.getInt("cnt"));
				
				boardList.add(board);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return boardList;
	}
	
	// 글 클릭했을때 각 컨텐츠 보여주는 기능
	public Board showOneNotice(int bno) {
		Board board = new Board();
		try {
			connect();
			String sql = "select title, board_content, writer, write_date, bno, cnt from boards where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setTitle(rs.getString("title"));
				board.setBoardContent(rs.getString("board_content"));
				board.setWriter(rs.getString("writer"));
				board.setWriteDate(rs.getString("write_date"));
				board.setBno(rs.getInt("bno"));
				board.setCNT(rs.getInt("cnt"));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return board;
	}
	
	// 글 클릭했을 때 조회수 업로드 하는 기능
	public void updateCNT(int bno, int cnt) {
		try {
			connect();
			String sql = "update boards set CNT = ? where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cnt+1);
			pstmt.setInt(2, bno);
			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println("cnt 1올라감");
			} else {
				System.out.println("cnt업로드 실패");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	// 글 번호(bno)에 맞는 댓글 조회해서 리스트에 담아서 전달해야한다.
	public List<Comments> selectComments(int bno) {
		List<Comments> list = new ArrayList<>();
		try {
			connect();
			String sql = "select * from comments where bno = ? order by reple_num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comments comments = new Comments();
				comments.setBno(rs.getInt("bno"));
				comments.setReple(rs.getString("reple"));
				comments.setUserId(rs.getString("user_id"));
				comments.setWriteDate(rs.getString("write_date"));
				comments.setRepleNum(rs.getInt("reple_num"));
				
				list.add(comments);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	// 댓글 수정
	public void updateComments(Comments comments) {
		try {
			System.out.println(comments.getReple());
			System.out.println(comments.getRepleNum());
			connect();
			String sql = "update comments set reple = ? where reple_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comments.getReple());
			pstmt.setInt(2, comments.getRepleNum());
			
			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println("댓글 업로드 완료");
			} else {
				System.out.println("댓글 업로드 실패");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	// 댓글 삭제
	public void deleteComments(int bno, int repleNum) {
		try {
			connect();
			String sql = "delete from comments where bno = ? and reple_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setInt(2, repleNum);
			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println("댓글 삭제 완료");
			} else {
				System.out.println("댓글 삭제 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	// 댓글 달기
	public void insertComments(Comments comments) {
		try {
			connect();
			String sql = "insert into comments values (?, reple_num_seq.nextval, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comments.getBno());
			pstmt.setString(2, comments.getUserId());
			pstmt.setString(3, comments.getReple());
			pstmt.setString(4, comments.getWriteDate());
			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println("댓글 등록 완료");
			} else {
				System.out.println("댓글 등록 실패");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	public int getCommentNum(String userId) {
		
		try {
			connect();
			String sql = "select max(reple_num) reple_num from comments where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("reple_num");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return 0;
	}
}
