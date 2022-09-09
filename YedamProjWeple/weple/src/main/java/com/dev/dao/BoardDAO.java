package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.converters.SqlDateConverter;

import com.dev.common.DAO;
import com.dev.vo.Board;
import com.dev.vo.Criteria;
import com.dev.vo.ProdReview;
import com.dev.vo.ReviewInfo;

public class BoardDAO extends DAO {

	public void addReivew(ReviewInfo rvo, int orderNum) {
		String sql = "INSERT into boards(bno, writer, board_content, prod_id, write_date, board_type, cnt, order_num) values(board_num_seq.nextval,?,?,?,sysdate, 3, ?, ?)";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvo.getWriter());
			pstmt.setString(2, rvo.getBoardContent());
			pstmt.setInt(3, rvo.getProdId());
			pstmt.setInt(4, rvo.getRating());
			pstmt.setInt(5, orderNum);

			int r = pstmt.executeUpdate();
			System.out.println(r + "건 입력");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

	}

	// 상세페이지 아래 prod_id가 같은 제품의 모든 리뷰
	public List<ReviewInfo> getList(int prodId) {
		List<ReviewInfo> list = new ArrayList<>();
		String sql = "SELECT * FROM v_bo_plus_nm WHERE board_type=3 and prod_id=" + prodId
				+ " order by write_date desc";

		try {
			connect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewInfo rvo = new ReviewInfo();
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setCnt(rs.getInt("cnt"));

				list.add(rvo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	/*public void updateReview(Board vo) {
		String sql = "UPDATE boards SET title=?, board_content =? WHERE bno=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getBoardContent());
			pstmt.setInt(3, vo.getBno());

			int r = pstmt.executeUpdate();
			System.out.println(r + "건 수정");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}*/

	// 내가 쓴 리뷰만 골라서 보는 리스트
	public List<ReviewInfo> myReivewList(String writer) {

		List<ReviewInfo> list = new ArrayList<>();

		String sql = "SELECT * FROM v_bo_plus_nm WHERE board_type=3 and writer= '" + writer + "' order by write_date desc";

		try {
			connect();
			pstmt = conn.prepareStatement(sql);
			// pstmt.setString(1, rvo.getWriter());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				ReviewInfo rvo = new ReviewInfo();
				
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setWriter(rs.getString("writer"));

				list.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	public boolean deleteReview(ReviewInfo rvo) {
		String sql = "DELETE boards WHERE bno =?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvo.getBno());

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

	/*public List<Board> myContent() {

		List<Board> list = new ArrayList<>();
		Board vo = new Board();

		String sql = "SELECT * FROM boards WHERE board_type=3 AND bno=?";

		try {
			connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBno());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setBoardContent(rs.getString("board_content"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	*/
	
	public void countStar(ReviewInfo rvo) {

		String sql = "UPDATE boards SET cnt=? WHERE bno=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvo.getRating());
			pstmt.setInt(2, rvo.getBno());

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 상품 평점 별채우기 (prod_id를 어디서 받아올 수 있을까요?)
	public double contentCount(int prodId) {

		double star = 0.0;

		String sql = "select sum(cnt)/ count(*) " + "from boards " + "where prod_id= " + prodId + " group by prod_id";

		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				star = rs.getDouble(1);
				System.out.print("star : " + String.format("%.2f",star));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return star;
		
	}

	public List<ReviewInfo> reviewInfo() {

		List<ReviewInfo> list = new ArrayList<>();
		
		ReviewInfo rvo = new ReviewInfo();

		String sql = "SELECT * from v_bo_plus_nm WHERE writer=? and prod_id=?";

		try {	
			connect();			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvo.getWriter());
			pstmt.setInt(2, rvo.getProdId());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				rvo.setProdId(rs.getInt("prodId"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setWriteDate(rs.getString("write_date"));

				list.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ReviewInfo> getListPaging(Criteria cri, int prodId) {

		List<ReviewInfo> AllListPage = new ArrayList<>();

		connect();

		try {
			
			String sql = "select  board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt "
					+ "from(select rownum rn, board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt "
					+ "from(select  board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt from v_bo_plus_nm where board_type=3 order by write_date desc ) "
					+ "where rownum <=?) " + "where rn>=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cri.getAmount() * cri.getPageNum()); // 10 * 1;
			pstmt.setInt(2, cri.getAmount() * (cri.getPageNum() - 1)); // 10

			rs = pstmt.executeQuery();
			System.out.println(cri.getAmount() * cri.getPageNum());
			System.out.println(cri.getAmount() * (cri.getPageNum() - 1));
			while (rs.next()) {
				ReviewInfo rvo = new ReviewInfo();
				
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setBoardContent(rs.getString("board_content"));
				

				AllListPage.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return AllListPage;
	}

	public List<ReviewInfo> getMyListPaging(Criteria cri, String writer) {
		List<ReviewInfo> listPage = new ArrayList<>();

		connect();

		try {
			String sql = "select board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt, img_url " +
						 " from(select rownum rn, board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt, img_url " +
	                     " from(select  board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt, img_url from v_bo_plus_nm where writer ='" + writer + "' and board_type=3 order by write_date desc ) "
	                   + " where rownum <=?) where rn>=?";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cri.getAmount() * cri.getPageNum()); // 10 * 1;
			pstmt.setInt(2, cri.getAmount() * (cri.getPageNum() - 1)); // 10

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewInfo rvo = new ReviewInfo();
				
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setCnt(rs.getInt("cnt"));
				rvo.setImgUrl(rs.getString("img_url"));

				listPage.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return listPage;
		
	}
	

	/*
	 * 실시간 리뷰
	 * 별점이 높으면서 최신순으로
	 */
	public List<ProdReview> realTimeReviewList() {
		List<ProdReview> list = new ArrayList<>();
		
		try {
			connect();
			String sql = "select * from v_rt_reviw_list";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProdReview pr = new ProdReview();
				pr.setBno(rs.getInt("bno"));
				pr.setBoardContent(rs.getString("board_content"));
				pr.setCnt(rs.getInt("cnt"));
				pr.setImgUrl(rs.getString("img_url"));
				pr.setProdId(rs.getInt("prod_id"));
				pr.setProdName(rs.getString("prod_name"));
				pr.setProdPrice(rs.getInt("prod_price"));
				pr.setWriteDate(rs.getString("write_date"));
				pr.setWriter(rs.getString("writer"));
				list.add(pr);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}
	
public List<ProdReview> rtPagingList(Criteria cri){
		
		List<ProdReview> list = new ArrayList<>();
		
		connect();

		try {
			String sql = "select  board_content, writer, write_date, bno, prod_id, img_url, prod_name, prod_price, cnt " +
						 " from(select rownum rn, board_content, writer, write_date, bno, prod_id, img_url, prod_name, prod_price, cnt " +
	                     " from(select  board_content, writer, write_date, bno, prod_id, img_url, prod_name, prod_price, cnt from  v_rt_reviw_list order by cnt desc, write_date desc ) "
	                   + " where rownum <=?) where rn>=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cri.getAmount() * cri.getPageNum()); // 10 * 1;
			pstmt.setInt(2, cri.getAmount() * (cri.getPageNum() - 1)); // 10

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				ProdReview pr = new ProdReview();
				
				pr.setBno(rs.getInt("bno"));
				pr.setBoardContent(rs.getString("board_content"));
				pr.setImgUrl(rs.getString("img_url"));
				pr.setProdId(rs.getInt("prod_id"));
				pr.setProdName(rs.getString("prod_name"));
				pr.setProdPrice(rs.getInt("prod_price"));
				pr.setWriteDate(rs.getString("write_date"));
				pr.setWriter(rs.getString("writer"));
				pr.setCnt(rs.getInt("cnt"));			
				list.add(pr);
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
	/* 내가 쓴 상품 리뷰
	 */
	public Board selectProdReview(int orderNum, int prodId) {
		Board bo = new Board();
		try {
			connect();
			String sql = "select * from boards where order_num=? and prod_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNum);
			pstmt.setInt(2, prodId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bo.setBoardType(rs.getInt("board_type"));
				bo.setTitle(rs.getString("title"));
				bo.setBoardContent(rs.getString("board_content"));
				bo.setWriter(rs.getString("writer"));
				bo.setWriteDate(rs.getString("write_date"));
				bo.setBno(rs.getInt("bno"));
				bo.setProdId(prodId);
				bo.setIsHandled(rs.getInt("is_handled"));
				bo.setRepsComment(rs.getString("reps_comment"));
				bo.setOrderNum(rs.getInt("order_num"));
				bo.setCNT(rs.getInt("cnt"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return bo;
	}
	

	// 리뷰 작성 - order_num 추가
	public void updateOrderNum(int orderNum, int bno) {
		try {
			connect();
			String sql = "update boards set order_num = ? where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, orderNum);
			pstmt.setInt(2, bno);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	public Board getReviewOrderNum(int bno) {
		Board bd = new Board();
		try {
			connect();
			String sql = "select * from boards where bno=" + bno;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				bd.setOrderNum(rs.getInt("order_num"));
				bd.setProdId(rs.getInt("prod_id"));
				return bd;
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return bd;
	}
}
