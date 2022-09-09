package com.dev.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLRecoverableException;

import com.dev.common.DAO;
import com.dev.vo.Inventory;

public class InventoryDAO extends DAO {

	public void crawlingInsert (Inventory vo) {
		String sql = "insert into inventory values (?, ?, 0, 3, ?)";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@54.205.133.2:1521:xe", "weple", "weple123");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getRegion());
			pstmt.setInt(2, vo.getProdId());
			pstmt.setInt(3, vo.getStock());
			int r = pstmt.executeUpdate();
			if (r>0) {
				System.out.println(vo.getProdId()+"["+vo.getRegion()+"]"+" : 3개 입고 완료.");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	public void insert (Inventory vo) {
		String sql = "insert into inventory values (?, ?, ?, ?, ?, sysdate)";
		try {
//			connect();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@54.205.133.2:1521:xe", "weple", "weple123");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getRegion());
			pstmt.setInt(2, vo.getProdId());
			pstmt.setInt(3, vo.getInOut());
			pstmt.setInt(4, vo.getAmount());
			pstmt.setInt(5, vo.getStock());
			int r = pstmt.executeUpdate();
			if (r>0) {
				String inout;
				if (vo.getInOut()==0) {
					inout="입고";
				} else {
					inout = "출고";
				}
				System.out.println(vo.getProdId()+"["+vo.getRegion()+"]"+" : " + vo.getAmount() + "개 "+inout+" 완료.");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	public int getInAmount (String region, int prodId) {
		String sql = "select * from v_in_amount where region = '"+region+"' and prod_id=" + prodId;
		try {
//			connect();
			try {
				if (this.conn == null) {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection("jdbc:oracle:thin:@54.205.133.2:1521:xe", "weple", "weple123");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return rs.getInt("amount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return 0;
	}
	
	public int getOutAmount (String region, int prodId) throws SQLRecoverableException {
		String sql = "select * from v_out_amount where region = '"+region+"' and prod_id=" + prodId;
		try {
//			connect();
			try {
				if (this.conn == null) {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					conn = DriverManager.getConnection("jdbc:oracle:thin:@54.205.133.2:1521:xe", "weple", "weple123");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return rs.getInt("amount");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return 0;
	}
}
