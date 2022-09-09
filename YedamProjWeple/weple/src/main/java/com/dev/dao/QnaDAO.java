package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.Board;
import com.dev.vo.Criteria;

public class QnaDAO extends DAO{
	
		public List<Board> qnaListPaging(Criteria cri) {

			List<Board> AllQnaListPage = new ArrayList<>();

			connect();

			try {
				String sql = "select title, board_type, prod_id, writer, write_date, board_content, bno, cnt "
						+ "from(select rownum rn, title, board_type, prod_id, writer, write_date, board_content, bno, cnt "
						+ "from(select  title, board_type, prod_id, writer, write_date, board_content, bno, cnt "
						+ "from v_bo_plus_nm where prod_id=10020 and board_type =4 order by write_date desc ) "
						+ "where rownum <=?) " + "where rn>?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cri.getAmount() * cri.getPageNum()); // 10 * 1;
				pstmt.setInt(2, cri.getAmount() * (cri.getPageNum() - 1)); // 10

				rs = pstmt.executeQuery();
				System.out.println(cri.getAmount() * cri.getPageNum());
				System.out.println(cri.getAmount() * (cri.getPageNum() - 1));
				while (rs.next()) {

					Board vo = new Board();
					
					vo.setTitle(rs.getString("title"));
					vo.setBno(rs.getInt("bno"));
					vo.setWriter(rs.getString("writer"));
					vo.setProdId(rs.getInt("prod_id"));
					vo.setWriteDate(rs.getString("write_date"));
					vo.setBoardContent(rs.getString("board_content"));
					vo.setCNT(rs.getInt("cnt"));

					AllQnaListPage.add(vo);
					
			
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return AllQnaListPage;
		}	
		
		public List<Board> qnaList(int prodId){
			
			List<Board> AllQnaList = new ArrayList<>();
			
			
			try {
				String sql = "SELECT * FROM v_bo_plus_nm WHERE board_type=4 and prod_id=10020 " //+ prodId
						+ " order by write_date desc";
				
				connect();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					Board vo = new Board();
					
					vo.setTitle(rs.getString("title"));
					vo.setBno(rs.getInt("bno"));
					vo.setProdId(rs.getInt("prod_id"));
					vo.setWriter(rs.getString("writer"));
					vo.setBoardContent(rs.getString("board_content"));
					vo.setWriteDate(rs.getString("write_date"));
					vo.setIsHandled(rs.getInt("is_Handled"));
					AllQnaList.add(vo);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return AllQnaList;
		}
		
		public List<Board> qnaMyListPaging(Criteria cri, String writer){
			
			List<Board> myQnaListPaging = new ArrayList<>();
			
			connect();

			try {
				
				String sql = "select  title, board_type, prod_id, writer, write_date, board_content, bno, cnt, is_handled, img_url, reps_comment "
						+ "from(select rownum rn, title, board_type, prod_id, writer, write_date, board_content, bno, cnt, is_handled, img_url, reps_comment "
						+ "from(select  title, board_type, prod_id, writer, write_date, board_content, bno, cnt, is_handled, img_url, reps_comment "
						+ "from v_bo_plus_nm where  writer= '" + writer +  "' and board_type=4 order by write_date desc ) "
						+ "where rownum <=?) " + "where rn>?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, cri.getAmount() * cri.getPageNum());
				pstmt.setInt(2, cri.getAmount() * (cri.getPageNum() - 1));
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Board vo = new Board();
					
					vo.setTitle(rs.getString("title"));
					vo.setBno(rs.getInt("bno"));
					vo.setWriter(rs.getString("writer"));
					vo.setProdId(rs.getInt("prod_id"));
					vo.setWriteDate(rs.getString("write_date"));
					vo.setBoardContent(rs.getString("board_content"));
					vo.setCNT(rs.getInt("cnt"));
					vo.setIsHandled(rs.getInt("is_handled"));
					vo.setImgUrl(rs.getString("img_url"));
					vo.setRepsComment(rs.getString("reps_comment"));

					myQnaListPaging.add(vo);
					
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return myQnaListPaging;
		}
		
		public List<Board> qMyList(String writer){
			
			List<Board> myQnaList = new ArrayList<>();
			
			try {
				String sql = "SELECT * FROM v_bo_plus_nm WHERE board_type=4 and writer= '" + writer + "' order by write_date desc";
		
				connect();
				stmt = conn.createStatement();
				
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					Board vo = new Board();
					
					vo.setTitle(rs.getString("title"));
					vo.setBno(rs.getInt("bno"));
					vo.setWriter(rs.getString("writer"));
					vo.setProdId(rs.getInt("prod_id"));
					vo.setWriteDate(rs.getString("write_date"));
					vo.setBoardContent(rs.getString("board_content"));
					vo.setCNT(rs.getInt("cnt"));
					vo.setIsHandled(rs.getInt("is_handled"));

					myQnaList.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return myQnaList;
			
		}
		
		public boolean addQna(Board vo) {
			int r = 0;
			connect();
			try {
				
				String sql = "INSERT into boards(bno, writer, board_content, prod_id, write_date, title, board_type) values(board_num_seq.nextval, ?, ?,?,sysdate, ?, 4)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, vo.getWriter());
				pstmt.setString(2, vo.getBoardContent());
				pstmt.setInt(3, vo.getProdId());
				pstmt.setString(4, vo.getTitle());
						
				r = pstmt.executeUpdate();
				
				if (r ==1 ) {
					System.out.println( r + "건을 완료하였습니다.");
					return true;
					
				}else {
					System.out.println("실패");
					return false;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return false;
		}
		public boolean deleteQna(Board vo) {
			String sql = "DELETE boards WHERE bno =?";
			connect();
			
			try {
				pstmt = conn.prepareStatement(sql);			
				pstmt.setInt(1, vo.getBno());

				int r = pstmt.executeUpdate();
				if (r > 0) {
					System.out.println(r + "건 삭제");
					return true;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return false;
		}
		public int updateQna(Board vo) {
			int r = 0;
			
			String sql = "update boards set title=?, boardContent=? WHERE bno =?";
			
			connect();
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getTitle());
				pstmt.setString(2, vo.getBoardContent());
				pstmt.setInt(3, vo.getBno());

				r = pstmt.executeUpdate();
				
				if (r ==1 ) {
					System.out.println("수정을 완료하였습니다.");
					
				}else {
					System.out.println("실패");
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return r;
		} 
		public  List<Board> viewContent(Board vo) {
			
			List<Board> qnaContentList = new ArrayList<>();
			
			try {
				String sql = "SELECT board_content, writer, write_date FROM v_bo_plus_nm WHERE board_type=4 and bno=? order by write_date desc";
					
				connect();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vo.getBno());
				rs = pstmt.executeQuery();

				while (rs.next()) {
				
					vo.setBno(rs.getInt("bno"));
					vo.setWriter(rs.getString("writer"));
					vo.setWriteDate(rs.getString("write_date"));
					vo.setBoardContent(rs.getString("board_content"));
					vo.setCNT(rs.getInt("cnt"));

					qnaContentList.add(vo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return qnaContentList;
		}
		
		
		

		/*
		 * 상품 문의 리스트
		 */
		
		public List<Board> getProdQnAList(int prodId) {
			List<Board> list = new ArrayList<>();
			try {
				connect();
				String sql = "select * from boards where board_type = 4 and prod_id = " + prodId + " order by write_date desc";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					Board bo = new Board();
					bo.setBno(rs.getInt("bno"));
					bo.setBoardContent(rs.getString("board_content"));
					bo.setBoardType(rs.getInt("board_type"));
					bo.setCNT(rs.getInt("cnt"));
					bo.setIsHandled(rs.getInt("is_handled"));
					bo.setProdId(prodId);
					bo.setRepsComment(rs.getString("reps_comment"));
					bo.setTitle(rs.getString("title"));
					bo.setWriteDate(rs.getString("write_date"));
					bo.setWriter(rs.getString("writer"));
					
					list.add(bo);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return list;
		}
		
		
		// 내가 쓴 상품 문의 보기 -> 젤 최신꺼만 (방금 등록한거 보기)
		public Board getRecentReview(String userId, int prodId) {
			Board bo;
			try {
				connect();
				String sql = "select * from boards where writer=? and board_type=4 and prod_id=? order by write_date desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setInt(2, prodId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					bo = new Board();
					bo.setBno(rs.getInt("bno"));
					bo.setBoardContent(rs.getString("board_content"));
					bo.setBoardType(rs.getInt("board_type"));
					bo.setCNT(rs.getInt("cnt"));
					bo.setIsHandled(rs.getInt("is_handled"));
					bo.setProdId(prodId);
					bo.setRepsComment(rs.getString("reps_comment"));
					bo.setTitle(rs.getString("title"));
					bo.setWriteDate(rs.getString("write_date"));
					bo.setWriter(rs.getString("writer"));
					return bo;
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return null;
		}
	}

	
