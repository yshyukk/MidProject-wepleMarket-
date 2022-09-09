package com.dev.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.order.OrderService;
import com.dev.vo.Criteria;
import com.dev.vo.Order;
import com.dev.vo.Page;

public class OrderHistoryController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// order테이블에 userId로 정보 조회
		HttpSession session = req.getSession();
		Criteria cri = new Criteria();
		String userId = (String) session.getAttribute("userId");
		
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setAmount(Integer.parseInt(amount));
		
		OrderService orderService = OrderService.getInstance();
		List<Order> orderList = orderService.showOrderListPaging(cri, userId);
		// orderHistoryMain으로 넘겨준다.
		
		int total = orderService.showOrderList(userId).size();
		
		req.setAttribute("orderList", orderList);
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "user/orderHisMain.tiles");
	}

}
