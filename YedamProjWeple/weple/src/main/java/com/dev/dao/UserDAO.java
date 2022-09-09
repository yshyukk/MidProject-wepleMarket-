package com.dev.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.Addr;
import com.dev.vo.User;

public class UserDAO extends DAO {

	// 기본!! 배송지 조회
	public List<Addr> getAdrListD(String userId) {
		String sql = "select * from addr where user_id = ? and is_default=1 ";
		List<Addr> list2 = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Addr vo2 = new Addr();
				vo2.setUserId(rs.getString("user_id"));
				vo2.setAddr(rs.getString("addr"));
				vo2.setAddr2(rs.getString("addr2"));
				vo2.setAddrDetail(rs.getString("addr_detail"));
				vo2.setAddrName(rs.getString("addr_name"));
				vo2.setZipCode(rs.getInt("zip_code"));
				
				list2.add(vo2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list2;
	}
	// 배송지 조회
	public List<Addr> getAdrList(String userId) {
		String sql = "select * from addr where user_id = ? ";
		List<Addr> list = new ArrayList<>();
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Addr vo = new Addr();
				vo.setUserId(rs.getString("user_id"));
				vo.setAddr(rs.getString("addr"));
				vo.setAddr2(rs.getString("addr2"));
				vo.setAddrDetail(rs.getString("addr_detail"));
				vo.setAddrName(rs.getString("addr_name"));
				vo.setZipCode(rs.getInt("zip_code"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	// 배송지 추가
	public void updateAddress(Addr vo) {
		String sql = "insert into addr(user_id,addr,addr_detail,zip_code,is_default,addr_name,addr2) values(?, ?, ?, ?, default, ?, ?)";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getAddr());
			pstmt.setString(3, vo.getAddrDetail());
			pstmt.setInt(4, vo.getZipCode());
			pstmt.setString(5, vo.getAddrName());
			pstmt.setString(6, vo.getAddr2());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 추가");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	//배송지 삭제
	public void deleteAddress(Addr vo) {
		String sql = "delete addr where addr_name = ? and user_id = ?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, vo.getAddrName());
			pstmt.setString(2, vo.getUserId());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 삭제");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	//기본배송지로 지정
	public void chAddress(Addr vo) {
		String sql = "update addr set is_default=1 where addr_name = ? and user_id = ?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//pstmt.setInt(1, vo.getIsDefault());
			pstmt.setString(1, vo.getAddrName());
			pstmt.setString(2, vo.getUserId());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 추가");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	//기본배송지로 제외
	public void otAddress(Addr vo) {
		String sql = "update addr set is_default=0 where addr_name = ? and user_id = ?";
		connect();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getAddrName());
			pstmt.setString(2, vo.getUserId());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 제외");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 아이디 찾기
	public User findId(String name) {
//		String sql = "select * from users where user_name = ?";
//		connect();
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, name);
//			//pstmt.setString(2, email);
//			
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				User vo = new User();
//				//vo.setUserId(rs.getString("id"));
//				vo.setUserName(rs.getString("user_name"));
//				//vo.setEmail(rs.getString("email"));
//				//vo.setEmail(rs.getString("mail1")+"@"+rs.getString("mail2"));
//				System.out.println("아이디 조회됨");
//				return vo;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally {
//			disconnect();
//		}
		return null;
//
	}

	// 삭제
	public void deleteUser(String id, String pw) {
		String sql = "delete from users where user_id =? and user_pwd=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 삭제됨");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 수정
	public void updateUser(User vo) {
		String sql = "update users set email=?, user_pwd=?, phone=?, user_name=?, gender=?, birth=?, grade=default, addr=?, addr_detail=?, zip_code=?, reg_date=sysdate, user_role=default, addr2=? where user_id = ?";
		// "insert into users values(?,?,?,?,?,?,?,default,?,?,?,sysdate,default,?)"
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEmail1() + "@" + vo.getEmail2());
			pstmt.setString(2, vo.getUserPwd());
			pstmt.setString(3, vo.getPhone1() + "-" + vo.getPhone2() + "-" + vo.getPhone3());
			pstmt.setString(4, vo.getUserName());
			pstmt.setString(5, vo.getGender());
			pstmt.setDate(6, vo.getBirth());
			// grade
			pstmt.setString(7, vo.getAddr());
			pstmt.setString(8, vo.getAddrDetail());
			pstmt.setInt(9, vo.getZipCode());
			// pstmt.setString(10, vo.getRegDate());
			// role
			pstmt.setString(10, vo.getAddr2());
			pstmt.setString(11, vo.getUserId());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 수정");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 로그인
	public int login(String id, String pw) {
		StringBuffer sql = new StringBuffer();
		connect();
		// String sql = "SELECT user_pwd FROM users WHERE user_id = ? ";
		sql.append("SELECT user_pwd").append(" FROM users").append(" WHERE user_id = ?");
		try {
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("user_pwd").equals(pw)) {
					return 1;
				} else {
					return 0;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return -1;
	}

	// 회원가입 입력
	public int insertUser(User vo) {
		String sql = "insert into users values(?,?,?,?,?,?,?,default,?,?,?,sysdate,default,?)";
		connect();
		int value = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getEmail1() + "@" + vo.getEmail2());
			pstmt.setString(3, vo.getUserPwd());
			pstmt.setString(4, vo.getPhone1() + "-" + vo.getPhone2() + "-" + vo.getPhone3());
			pstmt.setString(5, vo.getUserName());
			pstmt.setString(6, vo.getGender());
			pstmt.setDate(7, vo.getBirth());
			// grade
			pstmt.setString(8, vo.getAddr());
			pstmt.setString(9, vo.getAddrDetail());
			pstmt.setInt(10, vo.getZipCode());
			// pstmt.setString(10, vo.getRegDate());
			// role
			pstmt.setString(11, vo.getAddr2());
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 입력");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return value;
	}

	// 아이디 중복체크
	public int duplecateId(String id) {
		String sql = "SELECT count(user_id) as cnt from users where user_id =?";
		connect();
		int cnt = 0;
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return cnt;

	}

	// 이메일 중복체크
	public int duplecateEmail(String mail) {
		String sql = "SELECT count(email) as cnt from users where email=?";
		connect();
		int cnt = 0;
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mail);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return cnt;

	}

	// 전화번호 중복체크
	public int duplecatePhone(String pnum) {
		String sql = "SELECT count(phone) as cnt from users where phone=?";
		connect();
		int cnt = 0;
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pnum);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return cnt;

	}

	// 유저 검색
	public User searchUser(String id) {
		String sql = "select * from users where user_id = '" + id + "'";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				User vo = new User();
				vo.setAddr(rs.getString("addr"));
				vo.setAddr2(rs.getString("addr2"));
				vo.setAddrDetail(rs.getString("addr_detail"));
				vo.setUserId(id);
				vo.setEmail(rs.getString("email"));
				vo.setUserPwd(rs.getString("user_pwd"));
				vo.setPhone(rs.getString("phone"));
				vo.setUserName(rs.getString("user_name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirth(rs.getDate("birth"));
				vo.setGrade(rs.getInt("grade"));
				vo.setZipCode(rs.getInt("zip_code"));
				vo.setRegDate(rs.getString("reg_date"));
				vo.setUserRole(rs.getInt("user_role"));
				vo.setEmail1(rs.getString("email").split("@")[0]);
				vo.setEmail2(rs.getString("email").split("@")[1]);
				vo.setPhone1(rs.getString("phone").split("-")[0]);
				vo.setPhone2(rs.getString("phone").split("-")[1]);
				vo.setPhone3(rs.getString("phone").split("-")[2]);

				return vo;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return null;
	}
	
	
	// 회원 등급 변경
	public void updateUserGrade(User vo) {
		try {
			connect();
			String sql = "update users set grade = ? where user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getGrade());
			pstmt.setString(2, vo.getUserId());
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	
	// 주소 검색
	public Addr searchAddr(String id, String name) {
		Addr addr = new Addr();
		try {
			connect();
			String sql = "select * from addr where user_id=? and addr_name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				addr.setAddr(rs.getString("addr"));
				addr.setUserId(rs.getString("user_id"));
				addr.setAddrName(rs.getString("addr_name"));
				addr.setZipCode(rs.getInt("zip_code"));
				addr.setAddr2(rs.getString("addr2"));
				addr.setAddrDetail(rs.getString("addr_detail"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return addr;
	}
}
