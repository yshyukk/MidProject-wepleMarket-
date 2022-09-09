package com.dev.controller.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.dao.ProductDAO;
import com.dev.service.addr.AddrService;
import com.dev.service.buy.BuyService;
import com.dev.service.order.OrderService;
import com.dev.vo.Buy;
import com.dev.vo.Cart;
import com.dev.vo.Order;
import com.dev.vo.User;

public class insertOrderController implements Controller {


	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 서비스 선언
		OrderService orderService = OrderService.getInstance();
		AddrService addrService = AddrService.getInstance();
		BuyService buyService = BuyService.getInstance();
		ProductDAO pDAO = new ProductDAO();
	
		// 세션에서 userId 받아오기
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		User user = (User) session.getAttribute("userVO");
		
		
		@SuppressWarnings("unchecked")
		List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
		
		int orderPrice = 0;
	
		// totalPrice로 orderPrice계산하기
		for(int i = 0; i < cartList.size(); i++) {
			orderPrice += cartList.get(i).getTotalPrice();
		}
		// orderPrice에 배송비 추가하기
		if(user.getGrade() == 1) {
			orderPrice += 3500;
		} else if (user.getGrade() == 2) {
			orderPrice += 1800;
		}

		
		// 주문내역 목록 orders테이블에 넣기
		// userId, orderPrice, orderInfo
		String orderInfo = req.getParameter("orderInfo");

		Order order1 = new Order();
		
		order1.setUserId(userId);
		order1.setOrderInfo(orderInfo);
		order1.setOrderPrice(orderPrice);

		// orderNum 가져오기
		int orderNum = orderService.insertIntoOrders(order1);
		
		// buy_process테이블에 orderNum 업데이트하기
		for(Cart cartProd : cartList) {
			Buy buyProd = new Buy();
			buyProd.setUserId(userId);
			buyProd.setProdId(cartProd.getProdId());
			buyProd.setOrderNum(orderNum);
			buyService.updateOrderComplete(buyProd);
		}
		
		// 공동구매 수량 변경
		for(Cart c : cartList) {
			if(c.getIsShare() == 1) {
				//현재 공동구매 수량 가져오기
				int curr = pDAO.ParticipatePeopleNum(c.getProdId());
				int next = curr + c.getBuyAmount();
				//공동구매 수량 바꾸기
				pDAO.updateParticipatePeople(next, c.getProdId());
			}
		}

		
		Utils.forward(req, resp, "user/orderComplete.tiles");
	}
}
	
	
