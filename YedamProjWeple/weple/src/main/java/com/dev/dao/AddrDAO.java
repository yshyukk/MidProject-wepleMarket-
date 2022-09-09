package com.dev.dao;

import java.sql.SQLException;

import com.dev.common.DAO;
import com.dev.vo.Addr;

public class AddrDAO extends DAO {
	
	public void insertAddr(Addr addr) {
		try {
			connect();
			String sql = "insert into addr (user_id, addr, addr2, addr_detail, zip_code, is_default) values (?, ?, ?, ?, ?, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, addr.getUserId());
			pstmt.setString(2, addr.getAddr());
			pstmt.setString(3, addr.getAddr2());
			pstmt.setString(4, addr.getAddrDetail());
			pstmt.setInt(5, addr.getZipCode());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 주소지 입력");
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	public Addr selectDefault(String userId) {
		Addr addr = null;
		try {
			connect();
			String sql = "select * from addr where user_id = ? and is_default = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				addr = new Addr();
				addr.setAddr(rs.getString("addr"));
				addr.setAddr2(rs.getString("addr2"));
				addr.setAddrDetail(rs.getString("addr_detail"));
				addr.setAddrName(rs.getString("addr_name"));
				addr.setIsDefault(rs.getInt("is_default"));
				addr.setUserId(rs.getString("user_id"));
				addr.setZipCode(rs.getInt("zip_code"));
			} 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return addr;
	}
}
