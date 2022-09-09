package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.Buy;
import com.dev.vo.Cart;
import com.dev.vo.Order;
import com.dev.vo.OrderHisDetail;
import com.dev.vo.OrderProduct;


public class BuyDAO extends DAO {
	
	private static BuyDAO buyDAO = null;
	private BuyDAO() {
		
	}
	
	public static BuyDAO getInstance() {
		if(buyDAO == null) {
			buyDAO = new BuyDAO();
		}
		return buyDAO;
	}
	
	// 장바구니에 상품 전체 조회
	public List<Cart> showCart(String userId) {
		List<Cart> cartList = new ArrayList<>();
		try {
			connect();
			String sql = "select p.prod_id, p.prod_name, c.is_share, c.buy_amount, p.prod_price, c.buy_amount * p.prod_price as total_price, p.img_url  "
					+ "from products p join (select * from v_cart_list where user_id = ?) c "
					+ "on p.prod_id = c.prod_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cart cart = new Cart();
				cart.setProdId(rs.getInt("prod_id"));
				cart.setProdName(rs.getString("prod_name"));
				cart.setIsShare(rs.getInt("is_share"));
				cart.setBuyAmount(rs.getInt("buy_amount"));
				cart.setProdPrice(rs.getInt("prod_price"));
				cart.setTotalPrice(rs.getInt("total_price"));
				cart.setImgUrl(rs.getString("img_url"));
				cartList.add(cart);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return cartList;
	}
	
	// 장바구니에 상품 하나 조회(바로구매 클릭시)
	public Cart showOneProd(String userId, int prodId, int isShare) {
		Cart cart = null;
		try {
			connect();
			String sql = "select p.prod_id, p.prod_name, c.is_share, c.buy_amount, p.prod_price, c.buy_amount * p.prod_price as total_price "
					+ "from products p join (select * from v_cart_list where user_id = ? and prod_id = ? and is_share = ?) c "
					+ "on p.prod_id = c.prod_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setInt(2, prodId);
			pstmt.setInt(3, isShare);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cart = new Cart();
				cart.setProdId(rs.getInt("prod_id"));
				cart.setProdName(rs.getString("prod_name"));
				cart.setIsShare(rs.getInt("is_share"));
				cart.setBuyAmount(rs.getInt("buy_amount"));
				cart.setProdPrice(rs.getInt("prod_price"));
				cart.setTotalPrice(rs.getInt("total_price"));
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return cart;
	}
	
	// 장바구니에 상품 넣기
	public void insertIntoCart(Buy cartProduct) {
		try {
			connect();
			String sql = "insert into buy_process (user_id, prod_id, buy_amount, is_share, is_cart, is_buy, is_delivery, is_completed, order_num) values (?, ?, ?, ?, 1, 0, 0, 0, 0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cartProduct.getUserId());
			pstmt.setInt(2, cartProduct.getProdId());
			pstmt.setInt(3, cartProduct.getBuyAmount());
			pstmt.setInt(4, cartProduct.getIsShare());
			
			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println(r+"건 장바구니에 들어갔습니다.");
			} else {
				System.out.println("장바구니 들어가기 실패");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	
	
	// 장바구니 품목 수정(수량만)
	public boolean updateCart(int prodId, int buyAmount, String userId, int isShare) {
		try {
			connect();
			String sql = "update buy_process set buy_amount = ? where prod_id = ? and user_id = ? and is_cart = 1 and is_share = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buyAmount);
			pstmt.setInt(2, prodId);
			pstmt.setString(3, userId);
			pstmt.setInt(4, isShare);
			int r = pstmt.executeUpdate();
			if(r>0) {
				System.out.println("장바구니 업데이트 완료");
				return true;
			} 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}
	
	// 선택한 상품 구매
	 
	// 장바구니에서 상품 삭제
	public boolean deleteFromCart(int prodId, String userId, int isShare) {
		try {
			connect();
			String sql = "delete from buy_process where prod_id = ? and user_id = ? and is_cart = 1 and is_share = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, prodId);
			pstmt.setString(2, userId);
			pstmt.setInt(3, isShare);
			int r = pstmt.executeUpdate();
			if (r>0) {
				System.out.println("장바구니에서 상품 삭제 완료");
				return true;
			} 
		} catch(SQLException e ) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}
	
	// 장바구니 비우기
	public boolean deleteAllCart(String userId) {
		try {
			connect();
			String sql = "delete from buy_process where user_id = ? and is_cart = 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			int r = pstmt.executeUpdate();
			if(r>0) {
				System.out.println("장바구니 비우기 완료");
				return true;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}
	
	
	// 결제 완료상품으로 바꾸기고 주문정보 들어오는 메소드
	public void updateOrderComplete(Buy buy) {
		try {
			connect();
			String sql = "update buy_process set is_buy = 1, "
					+ "order_num = ?, is_cart = 0 where prod_id = ? and user_id = ? and is_cart = 1";
			System.out.println(buy.getOrderNum());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, buy.getOrderNum());
			pstmt.setInt(2, buy.getProdId());
			pstmt.setString(3, buy.getUserId());
			
			int r = pstmt.executeUpdate();
			System.out.println(r + "건 결제 완료 상품으로 바뀌고 주문번호 들어옴");
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
	

	// 장바구니에서 선택한 상품 가지고 오는 메소드
		public List<Buy> selectClickedProd(Buy buy) {
			List<Buy> buyList = new ArrayList<>();
			
			try {
				connect();
				String sql ="select * from buy_process where prod_id = ?, user_id = ?, is_buy = 1";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, buy.getProdId());
				pstmt.setString(2, buy.getUserId());
				while(rs.next()) {
					Buy returnBuy = new Buy();
					returnBuy.setUserId(rs.getString("user_id"));
					returnBuy.setProdId(rs.getInt("prod_id"));
					returnBuy.setBuyAmount(rs.getInt("buy_amount"));
					returnBuy.setIsShare(rs.getInt("is_share"));
					returnBuy.setIsBuy(rs.getInt("is_buy"));
					returnBuy.setIsDelivery(rs.getInt("is_delivery"));
					returnBuy.setIsCompleted(rs.getInt("is_completed"));
					returnBuy.setOrderNum(rs.getInt("order_num"));
					
					buyList.add(returnBuy);
				}
				
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			
			return buyList;
		}

	
	// orderNum이랑 userId로 주문정보 조회하는 메소드(prodName, prodAmount, isShare, totalPrice)
		
		public List<OrderHisDetail> showAllBuy(String userId, int orderNum) {
			List<OrderHisDetail> orderProdList = new ArrayList<>();
			try {
				connect();
				String sql = "select p.prod_name, b.buy_amount, b.is_share, p.prod_price, b.buy_amount *  p.prod_price as total_price, "
						+ "p.img_url, p.prod_id, b.is_review, b.is_completed, b.is_delivery "
						+ "from (select * from buy_process where user_id = ? and order_num = ?) b join products p "
						+ "on b.prod_id = p.prod_id";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setInt(2, orderNum);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					OrderHisDetail orderHistoryDetail = new OrderHisDetail();
					orderHistoryDetail.setProdName(rs.getString("prod_name"));
					orderHistoryDetail.setIsShare(rs.getInt("is_share"));
					orderHistoryDetail.setBuyAmount(rs.getInt("buy_amount"));
					orderHistoryDetail.setTotalPrice(rs.getInt("total_price"));
					orderHistoryDetail.setProdPrice(rs.getInt("prod_price"));
					orderHistoryDetail.setIsCompleted(rs.getInt("is_completed"));
					orderHistoryDetail.setImgUrl(rs.getString("img_url"));
					orderHistoryDetail.setProdId(rs.getInt("prod_id"));
					orderHistoryDetail.setOrderNum(orderNum);
					orderHistoryDetail.setIsReview(rs.getInt("is_review"));
					orderHistoryDetail.setIsDelivery(rs.getInt("is_delivery"));

					orderProdList.add(orderHistoryDetail);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
			return orderProdList;
		}
		
		// 리뷰 작성 - is_review =1
		public void updateReview(int orderNum, int prodId) {
			try {
				connect();
				String sql = "update buy_process set is_review=1 where order_num = ? and prod_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, orderNum);
				pstmt.setInt(2, prodId);
				pstmt.executeUpdate();
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}

		public void updateIsReview(int orderNum, int prodId) {
			try {
				connect();
				String sql = "update buy_process set is_review = 0 where order_num=? and prod_id=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, orderNum);
				pstmt.setInt(2, prodId);
				pstmt.executeUpdate();
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				disconnect();
			}
		}
		
}
