
package com.dev.service.order;

import java.util.List;

import com.dev.dao.OrderDAO;
import com.dev.vo.Criteria;
import com.dev.vo.Order;
import com.dev.vo.OrderProduct;

public class OrderService {
	// 싱글톤
	private static OrderService orderService = null;

	private OrderService() {

	}

	public static OrderService getInstance() {
		if (orderService == null) {
			orderService = new OrderService();
		}
		return orderService;
	}

	OrderDAO oDAO = OrderDAO.getInstance();

	// 주문 내역 목록 업로드
	public int insertIntoOrders(Order order) {
		return oDAO.insertIntoOrders(order);
		
		
	}

	// 주문 정보(전체) 보여주기
	public List<Order> showOrderList(String userId) {
		return oDAO.showOrderList(userId);
	}

	// 주문 정보(단건 -버튼클릭시) 보여주기
	public List<OrderProduct> showOrder(int orderNum) {
		return oDAO.showOrder(orderNum);
	}
	
	// sequence(주문번호)가장 높은거 select해오는 메소드(가장 최근 주문번호가지고 오기 위해서)
	public Order selectNewOrder() {
		return oDAO.selectNewOrder();
	}
	
	// 리스트 페이징
	public List<Order> showOrderListPaging(Criteria cri, String userId) {
		return oDAO.showOrderListPaging(cri, userId);
	}
	
}
