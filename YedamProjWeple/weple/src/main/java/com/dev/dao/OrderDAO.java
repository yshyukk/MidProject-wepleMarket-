
package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.Criteria;
import com.dev.vo.Order;
import com.dev.vo.OrderProduct;
import com.dev.vo.Product;

public class OrderDAO extends DAO {
	// 싱글톤
	private static OrderDAO orderDAO = null;
	private OrderDAO() {
		
	}
	public static OrderDAO getInstance() {
		if(orderDAO == null) {
			orderDAO = new OrderDAO();
		} 
		return orderDAO;
	}
	

	
		// orders에 insert하는 메소드(상품 구매 완료시)
		public int insertIntoOrders(Order order) {
			int orderNum = 0;
			try {
				connect();			
				String sql = "insert into orders values (?, ORDER_NUM_SEQ.NEXTVAL, ?, ?, default)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, order.getUserId());
				pstmt.setInt(2, order.getOrderPrice());
				pstmt.setString(3, order.getOrderInfo());
				
				int r = pstmt.executeUpdate();
				if(r>0) {
					System.out.println(r+"건 입력완료");
				}
				
				String sql2 = "select * from v_max_order_seq where user_id='"+order.getUserId()+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql2);
				if(rs.next()) {
					orderNum = rs.getInt("order_num");
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return orderNum;
		}
		
		
		// 주문 정보(전체) 보여주기
		public List<Order> showOrderList(String userId) {
			List<Order> orderList = new ArrayList<>();
			try {
				connect();
				String sql = "select order_num, order_price, order_date from orders where user_id = ? order by order_num desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					Order order = new Order();
					order.setOrderNum(rs.getInt("order_num"));
					order.setOrderDate(rs.getString("order_date"));
					order.setOrderPrice(rs.getInt("order_price"));
					order.setUserId(userId);
					
					orderList.add(order);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return orderList;
		}

		
		// 주문 정보(단건 - 버튼클릭시) 보여주기
		public List<OrderProduct> showOrder(int orderNum) {
			List<OrderProduct> orderProductList = new ArrayList<>();
			try {
				connect();
				String sql = "select p.prod_name, b.is_share, p.weight, p.prod_price "
						+ "from products p join buy_process b "
						+ "on p.prod_id = b.prod_id "
						+ "where b.order_num = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, orderNum);
				while(rs.next()) {
					
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return orderProductList;
		}
		
		//  sequence(주문번호)가장 높은거 select해오는 메소드(가장 최근 주문번호가지고 오기 위해서)
		public Order selectNewOrder() {
			Order order = null;
			try {
				connect();
				String sql = "select * from orders where order_num = (select max(order_num) from orders)";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					order = new Order();
					order.setOrderNum(rs.getInt("order_num"));
				}
			} catch(SQLException e) {                             
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return order;
		}
		
		
		/*
		 * 직전 6개월 간 거래 실적 조회
		 * 
		 */
		
		public Long getMyRecord(String userId) {
			Long record = 0L;
			try {
				connect();
				String sql = "select * from v_order_record where user_id = '" + userId + "'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					record = rs.getLong("oder_price");
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return record;
		}
		
		// 리스트 페이징
		public List<Order> showOrderListPaging(Criteria cri, String userId) {
			List<Order> list = new ArrayList<>();
			
			String sql = "select order_num, order_price, order_date from "
					+ "(select order_num, order_price, order_date, rownum rn from  "
					+ "(select order_num, order_price, order_date from orders where user_id = ? order by order_num desc) "
					+ "where rownum <=?) "
					+ "where rn>=?";
			
			try {
				connect();
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, userId);
				pstmt.setInt(2, cri.getAmount() * cri.getPageNum()); // 10 * 1;
				pstmt.setInt(3, cri.getAmount() * (cri.getPageNum() - 1)); // 10
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Order or = new Order();
					or.setOrderNum(rs.getInt("order_num"));
					or.setOrderPrice(rs.getInt("order_price"));
					or.setOrderDate(rs.getString("order_date"));
					list.add(or);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return list;
		}

		
		
}

