package com.dev.dao;

import java.sql.SQLException;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.Jjim;

public class JjimDAO extends DAO {
	
	
	
	//찜 체크 확인
	public int checkJjim(int prod, String user) {
		String sql = "select count(*) from jjim where prod_id = "+prod+" and user_id = '"+user+"'";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch(SQLException e) {
			e.printStackTrace();
			                     
		} finally {
			disconnect();
		}
		return 0;
	}

	//찜 삭제
	public void deletejjim(int prod, String user) {
		String sql = "delete from jjim where prod_id = "+prod+" and user_id = '"+user+"'";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//찜 추가
	public void addjjim(int prod, String user) {
		String sql = "insert into jjim values ("+prod+", '"+user+"')";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
}
